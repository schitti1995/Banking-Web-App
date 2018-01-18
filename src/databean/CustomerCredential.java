package databean;

import org.genericdao.PrimaryKey;

@PrimaryKey("customer_id") 
public class CustomerCredential {
	private String customer_id;
	private String initial_password;
	private String password;
	private String security_question1;
	private String security_question1_answer;
	private String security_question2;
	private String security_question2_answer;
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
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getSecurity_question1() {
		return security_question1;
	}
	public void setSecurity_question1(String security_question1) {
		this.security_question1 = security_question1;
	}
	public String getSecurity_question1_answer() {
		return security_question1_answer;
	}
	public void setSecurity_question1_answer(String security_question1_answer) {
		this.security_question1_answer = security_question1_answer;
	}
	public String getSecurity_question2() {
		return security_question2;
	}
	public void setSecurity_question2(String security_question2) {
		this.security_question2 = security_question2;
	}
	public String getSecurity_question2_answer() {
		return security_question2_answer;
	}
	public void setSecurity_question2_answer(String security_question2_answer) {
		this.security_question2_answer = security_question2_answer;
	}
	@Override
	public String toString() {
		return "CustomerCredential [customer_id=" + customer_id + ", initial_password=" + initial_password
				+ ", password=" + password + ", security_question1=" + security_question1
				+ ", security_question1_answer=" + security_question1_answer + ", security_question2="
				+ security_question2 + ", security_question2_answer=" + security_question2_answer + "]";
	}
	
}
