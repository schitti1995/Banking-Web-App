package formbean;

import org.formbeanfactory.FormBean;
import org.formbeanfactory.InputType;

public class ChangePasswordForm extends FormBean{
    private String newPassword;
    private String confirmNewPwd;
    private String currentPwd;
    
    public String getNewPassword() {
        return newPassword;
    }
    @InputType("password")
    public void setNewPassword(String newPassword) {
        this.newPassword = newPassword;
    }
    
    public String getConfirmNewPwd() {
        return confirmNewPwd;
    }
    @InputType("password")
    public void setConfirmNewPwd(String confirmNewPwd) {
        this.confirmNewPwd = confirmNewPwd;
    }
    
    public String getCurrentPwd() {
        return currentPwd;
    }
    @InputType("password")
    public void setCurrentPwd(String currentPwd) {
        this.currentPwd = currentPwd;
    }
}
