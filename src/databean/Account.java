package databean;

import org.genericdao.PrimaryKey;

@PrimaryKey("account_no") 
public class Account {
	private String account_no;
	private String customer_id;
	private String account_type;
	private double balance;

	public String getAccount_no() {
		return account_no;
	}
	public void setAccount_no(String account_no) {
		this.account_no = account_no;
	}
	public String getCustomer_id() {
		return customer_id;
	}
	public void setCustomer_id(String customer_id) {
		this.customer_id = customer_id;
	}
	public String getAccount_type() {
		return account_type;
	}
	public void setAccount_type(String account_type) {
		this.account_type = account_type;
	}
	public double getBalance() {
		return balance;
	}
	public void setBalance(double balance) {
		this.balance = balance;
	}
	@Override
	public String toString() {
		return "Account [account_no=" + account_no + ", customer_id=" + customer_id + ", account_type=" + account_type
				+ ", balance=" + balance + "]";
	}
	
	
	
}
