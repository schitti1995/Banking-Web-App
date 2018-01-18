package databean;

import org.genericdao.PrimaryKey;

@PrimaryKey("transaction_id") 
public class TransactionHistory {
	private String transaction_id;
	private double amount_change;
	private String category;
	private String date;
	private String description;
	private String account_no;
	private String status;
	public String getTransaction_id() {
		return transaction_id;
	}
	public void setTransaction_id(String transaction_id) {
		this.transaction_id = transaction_id;
	}
	public double getAmount_change() {
		return amount_change;
	}
	public void setAmount_change(double amount_change) {
		this.amount_change = amount_change;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getAccount_no() {
		return account_no;
	}
	public void setAccount_no(String account_no) {
		this.account_no = account_no;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
}
