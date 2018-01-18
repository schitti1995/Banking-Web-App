package formbean;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

public class DepositForm {
    private String account_no;
    private double amount;

    public DepositForm(HttpServletRequest request) {
        account_no = request.getParameter("account");
        String amountString = request.getParameter("amount");

        try {
            amount = Double.parseDouble(amountString);
        } catch (Exception e) {
            amount = -1.0;
        }
    }

    public List<String> getValidationError() {
        List<String> errors = new ArrayList<>();

        if (amount <= 0.0) {
            errors.add("Please set a valid amount.");
        }
        return errors;
    }

    public String getAccount_no() {
        return account_no;
    }

    public void setAccount_no(String account_no) {
        this.account_no = account_no;
    }

    public double getAmount() {
        return amount;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }
    
    public void validate() {
    	
    }
}
