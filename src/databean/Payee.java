package databean;

import org.genericdao.MaxSize;
import org.genericdao.PrimaryKey;

@PrimaryKey("payment_id")
public class Payee {
    private String payment_id;
    private String payee_name;
    private String fromAccount_no;
    private String toAccount_no;
    private String trdate;
    private double amount;
    private String stat;
    public String getPayment_id() {
        return payment_id;
    }
    public void setPayment_id(String payment_id) {
        this.payment_id = payment_id;
    }
    public String getPayee_name() {
        return payee_name;
    }
    
    @MaxSize(50)
    public void setPayee_name(String payee_name) {
        this.payee_name = payee_name;
    }
    public String getFromAccount_no() {
        return fromAccount_no;
    }
    public void setFromAccount_no(String fromAccount_no) {
        this.fromAccount_no = fromAccount_no;
    }
    public String getToAccount_no() {
        return toAccount_no;
    }
    
    @MaxSize(10)
    public void setToAccount_no(String toAccount_no) {
        this.toAccount_no = toAccount_no;
    }
    public String getTrdate() {
        return trdate;
    }
    
    @MaxSize(50)
    public void setTrdate(String trdate) {
        this.trdate = trdate;
    }
    public double getAmount() {
        return amount;
    }
    public void setAmount(double amount) {
        this.amount = amount;
    }
    public String getStat() {
        return stat;
    }
    
    @MaxSize(50)
    public void setStat(String stat) {
        this.stat = stat;
    }
    
}
