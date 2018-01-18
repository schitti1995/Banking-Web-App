package formbean;
import org.formbeanfactory.FormBean;
import org.formbeanfactory.InputType;

public class TransferForm extends FormBean {
	private String srcAcc;
	private String destAcc;
	private String receiverFirstname;
	private String receiverLastname;
	private String amount;
	private String verifCode;
	private String action;
	private String transaction_id;
	
	public String getSrcAcc() {
		return srcAcc;
	}
	@InputType("srcAcc")
	public void setSrcAcc(String srcAcc) {
		this.srcAcc = srcAcc;
	}
	public String getDestAcc() {
		return destAcc;
	}
	@InputType("destAcc")
	public void setDestAcc(String destAcc) {
		this.destAcc = destAcc;
	}
	public String getReceiverFirstname() {
		return receiverFirstname;
	}
	@InputType("receiverFirstname")
	public void setReceiverFirstname(String receiverFirstname) {
		this.receiverFirstname = receiverFirstname;
	}
	public String getReceiverLastname() {
		return receiverLastname;
	}
	@InputType("receiverLastname")
	public void setReceiverLastname(String receiverLastname) {
		this.receiverLastname = receiverLastname;
	}
	public String getAmount() {
		return amount;
	}
	@InputType("amount")
	public void setAmount(String amount) {
		this.amount = amount;
	}
	public String getVerifCode() {
		return verifCode;
	}
	@InputType("verifCode")
	public void setVerifCode(String verifCode) {
		this.verifCode = verifCode;
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
	
    public void doValidate() {
        super.validate();
        if (srcAcc == null || srcAcc.length() == 0) {
            addFormError("Source account is required.");
        }
        if (destAcc == null || destAcc.length() == 0) {
            addFormError("Destination account is required.");
        }
        if (receiverFirstname == null || receiverFirstname.length() == 0) {
            addFormError("Receiver firstname is required.");
        }
        if (receiverLastname == null || receiverLastname.length() == 0) {
            addFormError("Receiver lastname is required.");
        }
        if (amount == null || amount.length() == 0) {
            addFormError("Amount is required.");
        }
        if (verifCode == null || verifCode.length() == 0) {
            addFormError("Verification code is required.");
        }
        if (hasValidationErrors()) {
            return;
        }
        
//        if (!action.equals("Login") && !action.equals("Register")) {
//            this.addFormError("Invalid button");
//        }
        
//        if (userName.matches(".*[<>\"].*")) {
//            this.addFieldError("userName", "May not contain angle brackets or quotes");
//        }
    }
}
