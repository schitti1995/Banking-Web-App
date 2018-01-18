package formbean;

import org.formbeanfactory.FormBean;

public class SecurityInfoForm extends FormBean{
    private String driver_license;
    private String passport;
    private String securityQ_1;
    private String securityA_1;
    private String securityQ_2;
    private String securityA_2;
    
    public String getDriver_license() {
        return driver_license;
    }
    
    public void setDriver_license(String driver_license) {
        this.driver_license = driver_license;
    }
    
    public String getPassport() {
        return passport;
    }    
    public void setPassport(String passport) {
        this.passport = passport;
    } 
    public String getSecurityQ_1() {
        return securityQ_1;
    }
    public void setSecurityQ_1(String securityQ_1) {
        this.securityQ_1 = securityQ_1;
    }
    
    public String getSecurityA_1() {
        return securityA_1;
    }
    public void setSecurityA_1(String securityA_1) {
        this.securityA_1 = securityA_1;
    }
    
    public String getSecurityQ_2() {
        return securityQ_2;
    }
    public void setSecurityQ_2(String securityQ_2) {
        this.securityQ_2 = securityQ_2;
    }
    
    public String getSecurityA_2() {
        return securityA_2;
    }
    public void setSecurityA_2(String securityA_2) {
        this.securityA_2 = securityA_2;
    }
    
    @Override
    public void validate() {
        super.validate();
        if (hasValidationErrors()) {
            return;
        }
    }
}
