package controller;

import databean.Account;
import databean.CustomerCredential;
import databean.DepositHistory;
import databean.TransactionHistory;
import formbean.DepositForm;
import model.*;
import org.genericdao.RollbackException;
import org.genericdao.Transaction;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import java.io.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@MultipartConfig
public class DepositAction extends Action {

    private CustomerCredentialDAO ccDAO;
    private AccountDAO accountDAO;
    private DepositHistoryDAO depositHistoryDAO;
    private TransferRecordDAO transferRecordDAO;
	private TransactionHistoryDAO trscDAO;

    public DepositAction(Model model) {
        this.ccDAO = model.getCcDAO();
        this.accountDAO = model.getAccDAO();
        this.depositHistoryDAO = model.getDepositHistoryDAO();
        this.transferRecordDAO = model.getTrDAO();
        trscDAO = model.getTrscDAO();
    }

    public String performGet(HttpServletRequest request) {
        return "deposit.jsp";
    }

    private String saveImage(HttpServletRequest request, String partName) {
        Part filePart; // Retrieves <input type="file" name="file">
        List<String> errors = (List<String>) request.getAttribute("errors");

        try {
            filePart = request.getPart(partName);
            String filename = filePart.getSubmittedFileName();

            if (filename.length() == 0) {
                errors.add("Please upload the back and front of the check.");
                return "";
            }

            InputStream fileContent = filePart.getInputStream();

            long timeStamp = System.currentTimeMillis() / 1000L;

            filename = "WEB-INF/checkImages/" + timeStamp + filename;

            byte[] bytes = new byte[(int)filePart.getSize()];
            DataInputStream dataIs = new DataInputStream(fileContent);
            dataIs.readFully(bytes);

            String realPath = request.getServletContext().getRealPath(filename);
            String dir = request.getServletContext().getRealPath("") + "WEB-INF/checkImages/";
            File f = new File(dir);
            if (!f.exists()) {
                f.mkdirs();
            }

            File file = new File(realPath);
            file.createNewFile();
            FileOutputStream fos = new FileOutputStream(file, false);

            fos.write(bytes);
            fos.close();

            return realPath;
        } catch (IOException e) {
            errors.add(e.getMessage());
            e.printStackTrace();
        } catch (ServletException e) {
            errors.add(e.getMessage());
            e.printStackTrace();
        }
        return "";
    }

    @Override
    public String performPost(HttpServletRequest request) {
        HttpSession session = request.getSession();

        List<String> errors = new ArrayList<>();

        CustomerCredential customerCredential =
                (CustomerCredential) session.getAttribute("currentCustomer");
        request.setAttribute("errors", errors);

        if (customerCredential == null) {
            errors.add("Please login to proceed your operation.");
            return "login.jsp";
        }
        String checkFrontDirectory = saveImage(request, "checkFront");
        if (errors.size() > 0) {
            return "deposit.jsp";
        }

        String checkBackDirectory = saveImage(request, "checkBack");
        if (errors.size() > 0) {
            return "deposit.jsp";
        }

        DepositForm form = new DepositForm(request);
        errors.addAll(form.getValidationError());

        if (errors.size() > 0) {
            return "deposit.jsp";
        }

        DepositHistory depositHistory = new DepositHistory();
        depositHistory.setOperation_id(Long.toString(System.currentTimeMillis()));
        depositHistory.setAccount_no(form.getAccount_no());
        depositHistory.setAmount(form.getAmount());
        depositHistory.setCheck_image_back(checkBackDirectory);
        depositHistory.setCheck_image_front(checkFrontDirectory);

        /*
        TransferRecord transferRecord = new TransferRecord();
        transferRecord.setTransaction_id(Long.toString(System.currentTimeMillis()));
        transferRecord.setAmount(form.getAmount());
        transferRecord.setCategory("Deposit");
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        transferRecord.setDate(df.format(new Date()));
        transferRecord.setDest_account_no(form.getAccount_no());
        transferRecord.setStatus("Finished");*/

        try {
            Transaction.begin();
            depositHistoryDAO.create(depositHistory);
            //transferRecordDAO.create(transferRecord);

            Account account = accountDAO.read(form.getAccount_no());
            if (account == null) {
                errors.add("Invalid account, please redo your operation");
                return "deposit.jsp";
            }
            account.setBalance(account.getBalance() + form.getAmount());
            accountDAO.update(account);
            Transaction.commit();
            
			TransactionHistory trsc = new TransactionHistory();
			trsc.setTransaction_id(Long.toString(System.currentTimeMillis()));
			trsc.setAccount_no(depositHistory.getAccount_no());
			trsc.setAmount_change(depositHistory.getAmount());
			trsc.setCategory("Deposit");
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			trsc.setDate(sdf.format(new Date()));
			trsc.setDescription("Deposit to " + depositHistory.getAccount_no());
			trscDAO.create(trsc);
			
        } catch (RollbackException e) {
            e.printStackTrace();
        }

        return "deposit_success.jsp";
    }

    @Override
    public String getName() {
        // TODO Auto-generated method stub
        return "deposit.do";
    }
}
