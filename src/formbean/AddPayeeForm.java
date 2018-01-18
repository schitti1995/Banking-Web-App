package formbean;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

public class AddPayeeForm {
    private String payee_acc;
    private String from_Account;
    private String payee_name;
    private String utility;
    private String button;

    public AddPayeeForm(HttpServletRequest request) {
        payee_acc = request.getParameter("payeeAcc");
        from_Account = request.getParameter("srcAcc");
        payee_name = request.getParameter("payeeName");
        utility = request.getParameter("utility");
        button = request.getParameter("button");
    }

    public String getPayee_acc() {
        return payee_acc;
    }

    public String getFrom_Account() {
        return from_Account;
    }

    public String getPayee_name() {
        return payee_name;
    }

    public String getUtility() {
        return utility;
    }
    
    public String getButton() {
        return button;
    }

    public List<String> getValidationErrors() {
        List<String> errors = new ArrayList<String>();

        if (payee_name == null || payee_name.length() == 0)
            errors.add("Payee Name is required");

        if (utility == null || utility.length() == 0)
            errors.add("Utility name is required");
        
        if (from_Account == null || from_Account.length() == 0)
            errors.add("Account you will be using is required");
        
        if (payee_acc == null || payee_acc.length() == 0)
            errors.add("Payee's account number is required");
        
        if (button == null)
            errors.add("Button is required");
        
        if (!button.equals("Add Payee"))
            errors.add("Invalid button");

        if (payee_name.matches(".*[<>\"].*"))
            errors.add("Payee Name may not contain angle brackets or quotes");

        if (utility.matches(".*[<>\"].*"))
            errors.add("Utility name may not contain angle brackets or quotes");

        if (payee_acc.matches(".*[<>\"].*"))
            errors.add("Account number name may not contain angle brackets or quotes");
        
        try {
            Long.parseLong(payee_acc);
            if(payee_acc.length() != 10) {
                errors.add("Payee's account number is not valid.");
            }
        } catch(Exception e) {
            errors.add("Payee's account number is not an integer");
        }

        return errors;
    }
}
