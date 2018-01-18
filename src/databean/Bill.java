package databean;


import org.genericdao.PrimaryKey;

@PrimaryKey("loan_id") 
public class Bill {

private String loan_id;	
private double amount;
private String customer_id;
private String description;



public String getLoan_id() {return loan_id;}
public double getAmount() {return amount;}
public String getCustomer_id() {return customer_id;}
public String getDescription() {return description;}

public void setLoan_id(String loan_id) {this.loan_id = loan_id;}
public void setAmount(double amount) {this.amount = amount;}
public void setCustomer_id(String customer_id) {this.customer_id = customer_id;}
public void setDescription(String description) {this.description = description ;}

@Override
public String toString() {
	return "Bill [ bill_id="+loan_id +",amount="+amount+ ", customer_id=" + customer_id + ",description"+description +"]";
}


}





