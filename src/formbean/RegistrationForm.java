package formbean;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

public class RegistrationForm {

	private String customer_id;
	private String firstname;
	private String lastname;
	private String addr1;
	private String addr2;
	private String zipcode;
	private String city;
	private String state;
	private String phoneNumber;
	private String email;
	private String card_number;
	private String password;
	private String confirm_password;
	private String security_question1;
	private String security_question2;
	private String security_question1_answer;
	private String security_question2_answer;
	
	public RegistrationForm(HttpServletRequest request) {
		customer_id = (String)request.getSession().getAttribute("registerUser");
		request.setAttribute("registerUser", null);
		firstname = request.getParameter("firstname");
		lastname = request.getParameter("lastname");
		addr1 = request.getParameter("addr1");
		addr2 = request.getParameter("addr2");
		zipcode = request.getParameter("zipcode");
		city = request.getParameter("city");
		state = request.getParameter("state");
		phoneNumber = request.getParameter("phoneNumber");
		email = request.getParameter("email");
		card_number = request.getParameter("card_number");
		password = request.getParameter("password");
		confirm_password = request.getParameter("confirm_password");
		security_question1 = request.getParameter("security_question1");
		security_question1_answer = request.getParameter("security_question1_answer");
		security_question2 = request.getParameter("security_question2");
		security_question2_answer = request.getParameter("security_question2_answer");
	}
	
	public String getSecurity_question1() {
		return security_question1;
	}



	public void setSecurity_question1(String security_question1) {
		this.security_question1 = security_question1;
	}



	public String getSecurity_question2() {
		return security_question2;
	}



	public void setSecurity_question2(String security_question2) {
		this.security_question2 = security_question2;
	}



	public String getSecurity_question1_answer() {
		return security_question1_answer;
	}



	public void setSecurity_question1_answer(String security_question1_answer) {
		this.security_question1_answer = security_question1_answer;
	}



	public String getSecurity_question2_answer() {
		return security_question2_answer;
	}



	public void setSecurity_question2_answer(String security_question2_answer) {
		this.security_question2_answer = security_question2_answer;
	}



	public String getConfirm_password() {
		return confirm_password;
	}

	public void setConfirm_password(String confirm_password) {
		this.confirm_password = confirm_password;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getCustomer_id() {
		return customer_id;
	}

	public void setCustomer_id(String customer_id) {
		this.customer_id = customer_id;
	}

	public String getFirstname() {
		return firstname;
	}
	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}
	public String getLastname() {
		return lastname;
	}
	public void setLastname(String lastname) {
		this.lastname = lastname;
	}
	public String getAddr1() {
		return addr1;
	}
	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}
	public String getAddr2() {
		return addr2;
	}
	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getCard_number() {
		return card_number;
	}
	public void setCard_number(String card_number) {
		this.card_number = card_number;
	}
	
	public List<String> getValidationErrors() {
		List<String> errors = new ArrayList<String>();

		if (firstname == null || firstname.length() == 0)
			errors.add("Firstname is required");
		if (lastname == null || lastname.length() == 0)
			errors.add("Lastname is required");
		if (password == null || password.length() == 0)
			errors.add("PIN is required");
		if (confirm_password == null || confirm_password.length() == 0)
			errors.add("Confirm PIN is required");
		if (security_question1_answer == null || security_question1_answer.length() == 0)
			errors.add("Security question answer 1 is required");
		if (security_question2_answer == null || security_question2_answer.length() == 0)
			errors.add("Security question answer 2 is required");
		firstname = sanitize(firstname);
		lastname = sanitize(lastname);
		return errors;
	}
    private static String sanitize(String s) {
        return s.replace("&", "&amp;").replace("<", "&lt;")
                .replace(">", "&gt;").replace("\"", "&quot;");
    }
}
