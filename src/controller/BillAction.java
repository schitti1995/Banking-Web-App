package controller;

import java.util.Arrays;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.genericdao.MatchArg;
import org.genericdao.RollbackException;

import databean.Bill;
import databean.CustomerCredential;
import model.BillDAO;
import model.Model;

public class BillAction extends Action {
	
	private BillDAO billDAO;
	
	public BillAction(Model model) {
		billDAO = model.getBillDAO();
		
	}

	public String performGet(HttpServletRequest request) {
		System.out.println("Bills");
		 
			HttpSession session = request.getSession();
			
			Bill student_loan = new Bill();
			Bill auto_loan = new Bill();
			CustomerCredential currentCustomer = (CustomerCredential)session.getAttribute("currentCustomer");
	    	String customer_id = currentCustomer.getCustomer_id();
	    	System.out.println(currentCustomer);
	   	
	   	
	    	try {
	    		Bill[] bl = billDAO.match(MatchArg.equals("customer_id", customer_id));
	    		System.out.println(Arrays.asList(bl));
	    		for (Bill b: bl) {
	    			if (b.getDescription().compareToIgnoreCase("StudentLoan") == 0) {
	    				student_loan = b;
	    				System.out.println(student_loan);
	    			}
	    			if (b.getDescription().compareToIgnoreCase("AutoLoan")==0) {
	    				auto_loan =b;
	    				System.out.println(auto_loan);
	    			}
	    		}
	    		session.setAttribute("studentLoan", student_loan);
	    		session.setAttribute("autoLoan", auto_loan);
	    		return "bill.jsp";
	    	}
	    	catch (RollbackException e) {
				e.printStackTrace();
			}
	   	
	    	return "action-error.jsp";
	    }
	   	
	@Override
		public String getName() {
			return "bill.do";
		}

}
 




