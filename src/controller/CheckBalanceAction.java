package controller;

import java.util.Arrays;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.genericdao.MatchArg;
import org.genericdao.RollbackException;

import databean.*;
import model.AccountDAO;
import model.Model;

public class CheckBalanceAction extends Action {
	
    private AccountDAO accDAO;

    public CheckBalanceAction(Model model) {
        accDAO = model.getAccDAO();
    }
	
    public String performGet(HttpServletRequest request) {
    	return performPost(request);
    }
    
    public String performPost(HttpServletRequest request) {
    	System.out.println("Check balanceeeeeeeeeeeeeeeeeeeeeeeee");
    	
    	HttpSession session = request.getSession();
    	
    	Account saving_acc = new Account();
    	Account checking_acc = new Account();
    	CustomerCredential currentCustomer = (CustomerCredential)session.getAttribute("currentCustomer");
    	String customer_id = currentCustomer.getCustomer_id();
    	System.out.println(currentCustomer);
    	
    	try {
    		
			Account[] acc = accDAO.match(MatchArg.equals("customer_id", customer_id));
			System.out.println(Arrays.asList(acc));
			for (Account a : acc) {
				if (a.getAccount_type().compareToIgnoreCase("Saving") == 0) {
					saving_acc = a;
					System.out.println(saving_acc);
				}
				if (a.getAccount_type().compareToIgnoreCase("Checking") == 0) {
					checking_acc = a;
					System.out.println(checking_acc);
				}
			}
		session.setAttribute("savingAccount", saving_acc);
	    	session.setAttribute("checkingAccount", checking_acc);
	    	return "check_balance.jsp";
		} catch (RollbackException e) {
			e.printStackTrace();
		}
    	
    	return "action-error.jsp";
    }

	@Override
	public String getName() {
		return "check_balance.do";
	}
	
}
