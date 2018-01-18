package controller;

import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.formbeanfactory.FormBeanFactory;
import org.genericdao.MatchArg;
import org.genericdao.RollbackException;

import databean.Account;
import databean.CustomerInfo;
import databean.TransactionHistory;
import databean.TransferRecord;
import formbean.TransferForm;
import model.AccountDAO;
import model.CustomerInfoDAO;
import model.Model;
import model.TransactionHistoryDAO;
import model.TransferRecordDAO;


public class TransferAction extends Action {
	private FormBeanFactory<TransferForm> formBeanFactory = new FormBeanFactory<>(TransferForm.class);
	private TransferRecordDAO trDAO;
	private AccountDAO accDAO;
	private CustomerInfoDAO ciDAO;
	private TransactionHistoryDAO trscDAO;
	
	public TransferAction(Model model) {
		trDAO = model.getTrDAO();
		accDAO = model.getAccDAO();
		ciDAO = model.getCiDAO();
		trscDAO = model.getTrscDAO();
	}

	public String performGet(HttpServletRequest request) {
		return "transfer.jsp";
	}
	
	public String performPost(HttpServletRequest request) {
		HttpSession session = request.getSession();
        if (session.getAttribute("user") != null) {
            return "login.do";
        }
        TransferForm form = formBeanFactory.create(request);
        request.setAttribute("form", form);
        TransferRecord tr = new TransferRecord();
        
        form.doValidate();
        if (form.getFormErrors().length > 0) {
        	return "transfer.jsp";
        }
        
        
        String srcAcc = form.getSrcAcc();
        String destAcc = form.getDestAcc();
        String receiverFirstname = form.getReceiverFirstname();
        String receiverLastname = form.getReceiverLastname();
        double amount = Double.parseDouble(form.getAmount());
        String verifCode = form.getVerifCode();
        
        //Validation here
        try {
        	//Find if the dest account exists
			Account[] resAcc = accDAO.match(MatchArg.equals("account_no", destAcc));
			if (resAcc.length != 1) {
				form.addFormError("Account does not exist");
				System.out.println(Arrays.asList(form.getFormErrors()));
				return "transfer.jsp";
			}
			//Check receiver's name
			Account targetAcc = resAcc[0];
			CustomerInfo targetCustomer = ciDAO.read(targetAcc.getCustomer_id());
			if (!(targetCustomer.getFirstname().equals(receiverFirstname) && targetCustomer.getLastname().equals(receiverLastname)) ){
				form.addFormError("Wrong name of the receiver");
				System.out.println(Arrays.asList(form.getFormErrors()));
				return "transfer.jsp";
			}
			
			
			//Check whether the person has enough money
			double totalBalance = ((Account)session.getAttribute("savingAccount")).getBalance() + ((Account)session.getAttribute("checkingAccount")).getBalance();
			if (amount > totalBalance) {
				form.addFormError("You don't have enough money on your both accounts");
				System.out.println(Arrays.asList(form.getFormErrors()));
				return "transfer.jsp";
			}
			
			//Do transfer
			Account sourceAcc = accDAO.read(srcAcc);
			sourceAcc.setBalance(sourceAcc.getBalance() - amount);
			accDAO.update(sourceAcc);
			targetAcc.setBalance(targetAcc.getBalance() + amount);
			accDAO.update(targetAcc);
			accDAO.update(targetAcc);
			
			tr.setAmount(amount);
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			tr.setDate(df.format(new Date()));
			tr.setDescription("Transfer from " + sourceAcc.getAccount_no());
			tr.setCategory("Transfer");
			tr.setSrc_account_no(srcAcc);
			tr.setStatus("Finished");
			tr.setDest_account_no(destAcc);
			tr.setTransaction_id(Long.toString(System.currentTimeMillis()));
			trDAO.create(tr);
			
			TransactionHistory src_trsc = new TransactionHistory();
			src_trsc.setTransaction_id(Long.toString(System.currentTimeMillis()));
			src_trsc.setAccount_no(tr.getSrc_account_no());
			src_trsc.setAmount_change(-amount);
			src_trsc.setCategory("Transfer");
			src_trsc.setDate(tr.getDate());
			src_trsc.setDescription("Transfer to " + targetAcc.getAccount_no());
			trscDAO.create(src_trsc);
			
			TransactionHistory dest_trsc = new TransactionHistory();
			dest_trsc.setTransaction_id(Long.toString(System.currentTimeMillis() + 2));
			dest_trsc.setAccount_no(tr.getDest_account_no());
			dest_trsc.setAmount_change(+amount);
			dest_trsc.setCategory("Transfer");
			dest_trsc.setDate(tr.getDate());
			dest_trsc.setDescription("Transfer from " + sourceAcc.getAccount_no());
			trscDAO.create(dest_trsc);
			
			return "check_balance.do";
		} catch (RollbackException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return "action-error.jsp";
	}
	
	@Override
	public String getName() {
		return "transfer.do";
	}

}
