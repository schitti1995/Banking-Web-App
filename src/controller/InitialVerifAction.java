package controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.genericdao.RollbackException;

import databean.CustomerCredential;
import databean.CustomerInfo;
import model.Model;
import model. CustomerCredentialDAO;
import model.CustomerInfoDAO;
import formbean.InitialVerifForm;

public class InitialVerifAction extends Action {
    
	private CustomerCredentialDAO ccDAO;
	private CustomerInfoDAO ciDAO;
	
    public InitialVerifAction(Model model) {
		this.ccDAO = model.getCcDAO();
		this.ciDAO = model.getCiDAO();
	}

    public String performGet(HttpServletRequest request) {
    	return "Registration.jsp";
    }
    
	public String performPost(HttpServletRequest request) {
		HttpSession session = request.getSession();
        List<String> errors = new ArrayList<String>();
        session.setAttribute("errors", errors);
        
        InitialVerifForm form = new InitialVerifForm(request);
        request.setAttribute("form", form);
        errors.addAll(form.getValidationErrors());
        
        if (errors.size() != 0) {
        	System.out.println(errors);
            return "Registration.jsp";
        }
    	
        try {
			CustomerCredential cc = ccDAO.read(form.getCustomer_id());
			if (cc == null) {
				errors.add("No such user");
				return "Registration.jsp";
			}
			if (!cc.getInitial_password().equals(form.getInitial_password())) {
				errors.add("Wrong password");
				return "Registration.jsp";
			}
	        if (errors.size() != 0) {
	        	System.out.println(errors);
	            return "Registration.jsp";
	        }
	        session.setAttribute("registerUser", form.getCustomer_id());
	        session.setAttribute("registerUserInitialPassword", form.getInitial_password());
	        
	        System.out.println();
	        CustomerInfo ci = ciDAO.read(form.getCustomer_id());
	        session.setAttribute("c", ci);
	        return "Registration2.jsp";
			
		} catch (RollbackException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        
        
        return "Registration.jsp";
    }

	@Override
	public String getName() {
		// TODO Auto-generated method stub
		return "initialVerif.do";
	}

}
