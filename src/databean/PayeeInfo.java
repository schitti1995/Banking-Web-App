package databean;

import org.genericdao.PrimaryKey;

@PrimaryKey("payee_account_no")
public class PayeeInfo {
    private String payee_name;
    private String payee_account_no;
    private String fromAccount_no;
    private String utility;

    public String getPayee_name() {
        return payee_name;
    }
    public void setPayee_name(String payee_name) {
        this.payee_name = payee_name;
    }
    public String getPayee_account_no() {
        return payee_account_no;
    }
    public void setPayee_account_no(String payee_account_no) {
        this.payee_account_no = payee_account_no;
    }
    public String getFromAccount_no() {
        return fromAccount_no;
    }
    public void setFromAccount_no(String fromAccount_no) {
        this.fromAccount_no = fromAccount_no;
    }
    public String getUtility() {
        return utility;
    }
    public void setUtility(String utility) {
        this.utility = utility;
    }
}
