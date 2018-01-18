package controller;

import databean.Account;
import databean.CustomerCredential;
import formbean.LoginForm;
import model.AccountDAO;
import model.CustomerCredentialDAO;
import model.Model;
import org.genericdao.MatchArg;
import org.genericdao.RollbackException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class LoginAction extends Action {
    private CustomerCredentialDAO customerCredentialDAO;
    private AccountDAO accountDAO;

    public LoginAction(Model model) {
        customerCredentialDAO = model.getCcDAO();
        accountDAO = model.getAccDAO();
    }

    public String performGet(HttpServletRequest request) {
    	return "login.jsp";
    }

    public String performPost(HttpServletRequest request) {
        HttpSession session = request.getSession();

        List<String> errors = new ArrayList<>();
        session.setAttribute("errors", errors);

        CustomerCredential currentCustomerCredential =
                (CustomerCredential) session.getAttribute("currentCustomer");

        if (currentCustomerCredential != null) {
            return "check_balance.do";
        }

        try {
            LoginForm form = new LoginForm(request);

            request.setAttribute("form", form);
            CustomerCredential customerCredentialInDB =
                    customerCredentialDAO.read(form.getCustomer_id());

            errors.addAll(form.getValidationErrors());

            if (errors.size() > 0) {
            	System.out.println(errors);
                return "login.jsp";
            }

            if (customerCredentialInDB == null) {
                errors.add("Customer ID does not exist yet.");
                System.out.println(errors);
                return "login.jsp";
            }

            String passwordInForm = form.getPassword();
            if (!passwordInForm.equals(customerCredentialInDB.getPassword())) {
                errors.add("Please Check Your Password.");
                System.out.println(errors);
                return "login.jsp";
            }

            session.setAttribute("currentCustomer", customerCredentialInDB);

            Account[] accounts;
            try {
                accounts = accountDAO.match(
                        MatchArg.equals("customer_id", customerCredentialInDB.getCustomer_id())
                );
            } catch (RollbackException e) {
                errors.add("unable to get your account, please make sure you have logged in.");
                return "login.jsp";
            }

            session.setAttribute("accounts", Arrays.asList(accounts));
            System.out.println("Login customer: " + session.getAttribute("currentCustomer"));

            return "check_balance.do";
        } catch (RollbackException e) {
            //errors.add(e.getMessage());
        	e.printStackTrace();
        }
        return "login.jsp";
        
    }

    public String getName() {
        return "login.do";
    }
}