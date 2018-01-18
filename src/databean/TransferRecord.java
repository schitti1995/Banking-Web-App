package databean;

import org.genericdao.PrimaryKey;

@PrimaryKey("transaction_id") 
public class TransferRecord {
	private String transaction_id;
	private String src_account_no;
	private String dest_account_no;
	private String date;
	private double amount;
	private String description;
	private String category;
	private String status;
	
	public String getTransaction_id() {
		return transaction_id;
	}
	public void setTransaction_id(String transaction_id) {
		this.transaction_id = transaction_id;
	}
	public String getSrc_account_no() {
		return src_account_no;
	}
	public void setSrc_account_no(String src_account_no) {
		this.src_account_no = src_account_no;
	}
	public String getDest_account_no() {
		return dest_account_no;
	}
	public void setDest_account_no(String dest_account_no) {
		this.dest_account_no = dest_account_no;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public double getAmount() {
		return amount;
	}
	public void setAmount(double amount) {
		this.amount = amount;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
}
