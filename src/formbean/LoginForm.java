package formbean;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

public class LoginForm {
    String customer_id;
    String password;

    public String getCustomer_id() {
        return customer_id;
    }

    public LoginForm(HttpServletRequest request) {
        customer_id = request.getParameter("customer_id");
        password = request.getParameter("password");
    }

    public void setCustomer_id(String customer_id) {
        this.customer_id = customer_id;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public List<String> getValidationErrors() {
        List<String> errors = new ArrayList<>();

        if (customer_id == null || customer_id.length() == 0) {
            errors.add("Customer ID is required.");
        }

        if (password == null || password.length() == 0) {
            errors.add("Password is required");
        }

        return errors;
    }
}