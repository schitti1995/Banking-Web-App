package formbean;

import org.formbeanfactory.FormBean;
import org.formbeanfactory.InputType;

public class BillPayForm extends FormBean {
	
	private String description;
	private String srcAcc;
	private String amount;
	private String action;
	private String date;
	private String transaction_id;
	
	public String getDescription() {
		return description;
	}
	
	@InputType("description")
	public void setDescription(String description) {
		this.description = description;
	}
	
	public String getSrcAcc() {
		return srcAcc;
	}
	@InputType("srcAcc")
	public void setSrcAcc(String srcAcc) {
		this.srcAcc = srcAcc;
	}
	
	public String getAmount() {
		return amount;
	}
	@InputType("amount")
	public void setAmount(String amount) {
		this.amount = amount;
	}
	public String getAction() {
		return action;
	}
	@InputType("button")
	public void setAction(String action) {
		this.action = action;
	}
	public String getTransaction_id() {
		return transaction_id;
	}
	public void setTransaction_id(String transaction_id) {
		this.transaction_id = transaction_id;
	}

	@Override
    public void validate() {
		super.validate();

        if (amount == null || amount.length() == 0) {
            addFormError("Amount is required.");
        }
        /*
		if (hasValidationErrors()) {
			return;
		}
		*/
	}
}