package formbean;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

public class InitialVerifForm {
	
	private String customer_id;
	private String initial_password;
	
	public InitialVerifForm(HttpServletRequest request) {
		customer_id = request.getParameter("customer_id");
		initial_password = request.getParameter("initial_password");
	}

	public String getCustomer_id() {
		return customer_id;
	}

	public void setCustomer_id(String customer_id) {
		this.customer_id = customer_id;
	}

	public String getInitial_password() {
		return initial_password;
	}

	public void setInitial_password(String initial_password) {
		this.initial_password = initial_password;
	}
	
	public List<String> getValidationErrors() {
		List<String> errors = new ArrayList<String>();

		if (customer_id == null || customer_id.length() == 0)
			errors.add("User Name is required");
		if (initial_password == null || initial_password.length() == 0)
			errors.add("Password is required");
		customer_id = sanitize(customer_id);
		customer_id = sanitize(customer_id);
		return errors;
	}
    private static String sanitize(String s) {
        return s.replace("&", "&amp;").replace("<", "&lt;")
                .replace(">", "&gt;").replace("\"", "&quot;");
    }

}
