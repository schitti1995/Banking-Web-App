package controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.genericdao.RollbackException;

import databean.CustomerCredential;
import databean.CustomerInfo;
import formbean.InitialVerifForm;
import formbean.RegistrationForm;
import model.CustomerCredentialDAO;
import model.CustomerInfoDAO;
import model.Model;

public class RegisterAction extends Action {
	
	private CustomerInfoDAO ciDAO;
	private CustomerCredentialDAO ccDAO;
	
	public RegisterAction(Model model) {
		this.ciDAO = model.getCiDAO();
		this.ccDAO = model.getCcDAO();
	}

	public String performGet(HttpServletRequest request) {
		return "Registration.jsp";
	}
	
	public String performPost(HttpServletRequest request) {
		HttpSession session = request.getSession();
        List<String> errors = new ArrayList<String>();
        
        RegistrationForm form = new RegistrationForm(request);
        request.setAttribute("form", form);
        request.setAttribute("registerErrors", errors);
        errors.addAll(form.getValidationErrors());
        if (errors.size() != 0) {
        	System.out.println(errors);
            return "Registration2.jsp";
        }
        if (!form.getPassword().equals(form.getConfirm_password())) {
        	errors.add("Password is not the same as confirm password.");
        	return "Registration2.jsp";
        }
        
        CustomerInfo ci = new CustomerInfo();
        ci.setCard_number(form.getCard_number());
        ci.setCustomer_id(form.getCustomer_id());
        ci.setMailing_address(form.getAddr1() + "/" + form.getAddr2() + "/" + form.getZipcode() + "/" + form.getCity() + "/" + form.getState());
        ci.setMobile_phone(form.getPhoneNumber());
        ci.setEmail(form.getEmail());
        ci.setFirstname(form.getFirstname());
        ci.setLastname(form.getLastname());
        try {
			ciDAO.create(ci);
		} catch (RollbackException e) {
			e.printStackTrace();
		}
        
        CustomerCredential cc = new CustomerCredential();
        cc.setCustomer_id(form.getCustomer_id());
        cc.setInitial_password((String)session.getAttribute("registerUserInitialPassword"));
        session.setAttribute("registerUserInitialPassword",null);
        cc.setPassword(form.getPassword());
        cc.setSecurity_question1(form.getSecurity_question1());
        cc.setSecurity_question1_answer(form.getSecurity_question1_answer());
        cc.setSecurity_question2(form.getSecurity_question2());
        cc.setSecurity_question2_answer(form.getSecurity_question2_answer());
        try {
			ccDAO.update(cc);
		} catch (RollbackException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        
        return "login.jsp";
    }
	
	@Override
	public String getName() {
		return "register.do";
	}

}
