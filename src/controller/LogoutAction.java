package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import model.CustomerCredentialDAO;
import model.Model;

public class LogoutAction extends Action {
	private CustomerCredentialDAO customerCredentialDAO;

    public LogoutAction(Model model) {
    	customerCredentialDAO = model.getCcDAO();
    }
	
    public String performGet(HttpServletRequest request) {
    	return performPost(request);
    }
    
    public String performPost(HttpServletRequest request) {
    	HttpSession session = request.getSession();
    	session.setAttribute("currentCustomer", null);
    	session.setAttribute("checkingAccount", null);
    	session.setAttribute("savingAccount", null);
    	return "login.jsp";
    }
    
	@Override
	public String getName() {
		// TODO Auto-generated method stub
		return "logout.do";
	}

}
