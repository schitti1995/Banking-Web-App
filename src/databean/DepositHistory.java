package databean;

import org.genericdao.PrimaryKey;

@PrimaryKey("operation_id")
public class DepositHistory {
    private String operation_id;
    private double amount;
    private String check_image_front;
    private String check_image_back;
    private String account_no;

    public String getOperation_id() {
        return operation_id;
    }

    public void setOperation_id(String operation_id) {
        this.operation_id = operation_id;
    }

    public double getAmount() {
        return amount;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }

    public String getCheck_image_front() {
        return check_image_front;
    }

    public void setCheck_image_front(String check_image_front) {
        this.check_image_front = check_image_front;
    }

    public String getCheck_image_back() {
        return check_image_back;
    }

    public void setCheck_image_back(String check_image_back) {
        this.check_image_back = check_image_back;
    }

    public String getAccount_no() {
        return account_no;
    }

    public void setAccount_no(String account_no) {
        this.account_no = account_no;
    }
}
