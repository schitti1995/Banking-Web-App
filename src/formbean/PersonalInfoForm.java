package formbean;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.formbeanfactory.FormBean;
/**
 * Personal Information that can be modified.
 * @author Jianing He
 */
public class PersonalInfoForm extends FormBean{
    private String email;
    private String mobile_phone;
    private String mailing_address;
    private String occupation;
    private String salary;
    private String work_phone;
    private String work_address;
    public static final Pattern VALID_EMAIL_ADDRESS_REGEX = 
            Pattern.compile("^[A-Z0-9._%+-]+@[A-Z0-9._%+-]+", Pattern.CASE_INSENSITIVE);
    
    public String getEmail() {
        return email;
    }
    public void setEmail(String email) {
        this.email = email;
    }
    
    public String getMobile_phone() {
        return mobile_phone;
    }
    public void setMobile_phone(String mobile_phone) {
        this.mobile_phone = mobile_phone;
    }
    
    public String getMailing_address() {
        return mailing_address;
    }
    public void setMailing_address(String mailing_address) {
        this.mailing_address = mailing_address;
    }
       
    public String getOccupation() {
        return occupation;
    }
    public void setOccupation(String occupation) {
        this.occupation = occupation;
    }
    
    public String getSalary() {
        return salary;
    }
    public void setSalary(String salary) {
        this.salary = salary;
    }
    
    public String getWork_phone() {
        return work_phone;
    }
    public void setWork_phone(String work_phone) {
        this.work_phone = work_phone;
    }
    
    public String getWork_address() {
        return work_address;
    }
    public void setWork_address(String work_address) {
        this.work_address = work_address;
    }
    
    @Override
    public void validate() {
        super.validate();
        if (hasValidationErrors()) {
            return;
        }
        
        // Validate email format
        Matcher matcher = VALID_EMAIL_ADDRESS_REGEX.matcher(email);
        if (!matcher.find())
            this.addFieldError("email", "The format of the email is invalid.");
    }
}
