package controller;


import databean.Account;
import databean.Bill;
import databean.BillPay;
import databean.TransactionHistory;
import formbean.BillPayForm;
import model.*;
import org.formbeanfactory.FormBeanFactory;
import org.genericdao.MatchArg;
import org.genericdao.RollbackException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
//import model.BillsDAO;



public class BillPayAction extends Action {
	private FormBeanFactory<BillPayForm> formBeanFactory = new FormBeanFactory<>(BillPayForm.class);
	
	private BillPayDAO billpay;
	private AccountDAO accDAO;
	private TransactionHistoryDAO trscDAO;
	private BillDAO billDAO;
	
	
	public BillPayAction (Model model) {
		billpay = model.getBillPay();
		accDAO = model.getAccDAO();
		trscDAO = model.getTrscDAO();
		billDAO =model.getBillDAO();
		
		
	}
	
	public String performGet(HttpServletRequest request) {
		return "paybill.jsp";
	}
	
	public String performPost(HttpServletRequest request) {
		HttpSession session = request.getSession();
        if (session.getAttribute("user") != null) {
            return "login.do";
        }
        BillPayForm form = formBeanFactory.create(request);
        BillPay bp = new BillPay();
        
        
        String description = form.getDescription();
        System.out.println(description);
        
        String srcAcc = form.getSrcAcc();
        System.out.println(srcAcc);

        request.setAttribute("form", form);
		form.validate();
		if (form.getFormErrors().length > 0) {
			return "paybill.jsp";
		}

		double amount = Double.parseDouble(form.getAmount());

        //Validation here
        try {
			//Check whether the person has enough money
			double totalBalance = ((Account)session.getAttribute("savingAccount")).getBalance() + ((Account)session.getAttribute("checkingAccount")).getBalance();
			if (amount > totalBalance) {
				form.addFormError("You don't have enough money on your both accounts");
				System.out.println(Arrays.asList(form.getFormErrors()));
				return "paybill.jsp";
			}
			
			//pay bill
			Account sourceAcc = accDAO.read(srcAcc);
			sourceAcc.setBalance(sourceAcc.getBalance() - amount);
			accDAO.update(sourceAcc);
			
			System.out.println(description);
			//pay loan
			Bill[] desCriptionarray = billDAO.match(MatchArg.equals("description",description));
			
			Bill b = desCriptionarray[0];
			b.setAmount(b.getAmount() - amount);
			billDAO.update(b);
			
			bp.setAmount(amount);
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			bp.setDate(df.format(new Date()));
			bp.setDescription("pay from " + sourceAcc.getAccount_no());
			bp.setCategory("Pay Bill");
			bp.setSrc_account_no(srcAcc);
			bp.setStatus("Finished");
			
			bp.setTransaction_id(Long.toString(System.currentTimeMillis()));
			billpay.create(bp);
			
			
			
			TransactionHistory src_trsc = new TransactionHistory();
			src_trsc.setTransaction_id(Long.toString(System.currentTimeMillis()));
			src_trsc.setAccount_no(bp.getSrc_account_no());
			src_trsc.setAmount_change(-amount);
			src_trsc.setCategory("BillPay");
			src_trsc.setDate(bp.getDate());
			src_trsc.setDescription("Bill pay" + sourceAcc.getAccount_no());
			trscDAO.create(src_trsc);

			return "bill.do";
		} catch (RollbackException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return "action-error.jsp";
	}
	
	@Override
	public String getName() {
		return "paybill.do";
	}

	
	
}

