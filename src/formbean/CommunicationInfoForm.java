package formbean;

import org.formbeanfactory.FormBean;

public class CommunicationInfoForm extends FormBean{
    private String preference_contact;
    
    public String getPreference_contact() {
        return preference_contact;
    }
    public void setPreference_contact(String preference_contact) {
        this.preference_contact = preference_contact;
    }
    
    @Override
    public void validate() {
        super.validate();
        if (hasValidationErrors()) {
            return;
        }
    }
}
