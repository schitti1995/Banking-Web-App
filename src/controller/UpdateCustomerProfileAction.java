package controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.formbeanfactory.FormBeanFactory;
import org.genericdao.RollbackException;

import databean.CustomerCredential;
import databean.CustomerInfo;
import formbean.ChangePasswordForm;
import formbean.CommunicationInfoForm;
import formbean.PersonalInfoForm;
import formbean.SecurityInfoForm;
import model.CustomerCredentialDAO;
import model.CustomerInfoDAO;
import model.Model;

public class UpdateCustomerProfileAction extends Action{
    private FormBeanFactory<PersonalInfoForm> personalInforFormBeanFactory = new FormBeanFactory<>(PersonalInfoForm.class);
    private FormBeanFactory<SecurityInfoForm> securityInfoFormBeanFactory = new FormBeanFactory<>(SecurityInfoForm.class);
    private FormBeanFactory<CommunicationInfoForm> communicationInfoFormBeanFactory = new FormBeanFactory<>(CommunicationInfoForm.class);
    private FormBeanFactory<ChangePasswordForm> changePasswordFormBeanFactory = new FormBeanFactory<>(ChangePasswordForm.class);
    private CustomerInfoDAO ciDAO;
    private CustomerCredentialDAO ccDAO;
    
    public UpdateCustomerProfileAction(Model model) {
        System.out.println("Initialization Update Profile.");
        ciDAO = model.getCiDAO();
        ccDAO = model.getCcDAO();
    }
    
    public String performGet(HttpServletRequest request) {
        return performPost(request);
    }
    
    public String performPost(HttpServletRequest request) {
        System.out.println("---------------Update Profile--------------");
        HttpSession session = request.getSession();
        List<String> errors = new ArrayList<>();
        session.setAttribute("errors", errors);

        CustomerCredential currentCustomerCredential =
                (CustomerCredential) session.getAttribute("currentCustomer");// assume logged-in
        String customer_id = currentCustomerCredential.getCustomer_id();
        try {
            CustomerInfo currentCustomerInfo = ciDAO.read(customer_id);
            request.setAttribute("currentCustomerInfo", currentCustomerInfo);
            // Get method: display page
            if("GET".equals(request.getMethod())) {
                return "customerProfile.jsp";
            }            
             
            // Post method            
            // 1. Personal Information Tab
            String buttonClicked = request.getParameter("submit");
            request.setAttribute("buttonClicked", buttonClicked);
            if (buttonClicked.equals("Update Personal Information")) {
                System.out.println("Update Personal Information");  
                PersonalInfoForm form = personalInforFormBeanFactory.create(request);
                if (form.hasValidationErrors()) {
                    System.out.println("Personal Info: validation errors");
                    request.setAttribute("personalForm", form);
                    return "customerProfile.jsp";
                }
                currentCustomerInfo.setEmail(form.getEmail());
                currentCustomerInfo.setMobile_phone(form.getMobile_phone());
                currentCustomerInfo.setMailing_address(form.getMailing_address());
                currentCustomerInfo.setOccupation(form.getOccupation());
                currentCustomerInfo.setIncome(form.getSalary());
                currentCustomerInfo.setWork_phone(form.getWork_phone());
                currentCustomerInfo.setWork_address(form.getWork_address());
                ciDAO.update(currentCustomerInfo);
                return "customerProfile.jsp";
            }
            
            // 2. Security Information
            if (buttonClicked.equals("Update Security Information")) {
                System.out.println("Update Security Information.");
                SecurityInfoForm form = securityInfoFormBeanFactory.create(request);
                if (form.hasValidationErrors()) {
                    System.out.println("Security Info: validation errors");
                    request.setAttribute("securityForm", form);
                    return "customerProfile.jsp";
                }
                // Basic Credientials
                String driver_license = form.getDriver_license();
                String passport = form.getPassport();
                currentCustomerInfo.setDriver_license(driver_license);
                currentCustomerInfo.setPassport(passport);
                // Security Questions
                String securityQ_1 = form.getSecurityQ_1();
                String securityQ_2 = form.getSecurityQ_2();
                String securityA_1 = form.getSecurityA_1();
                String securityA_2 = form.getSecurityA_2();
                currentCustomerCredential.setSecurity_question1(securityQ_1);
                currentCustomerCredential.setSecurity_question2(securityQ_2);
                currentCustomerCredential.setSecurity_question1_answer(securityA_1);
                currentCustomerCredential.setSecurity_question2_answer(securityA_2);
                ciDAO.update(currentCustomerInfo);
                return "customerProfile.jsp";
            }
            
            // 3. Set password
            if (buttonClicked.equals("Submit")) {
                System.out.println("Modify Password");
                ChangePasswordForm form = changePasswordFormBeanFactory.create(request);
                if (form.hasValidationErrors()) {
                    System.out.println("Change Password Info: validation errors");
                    request.setAttribute("changePasswordForm", form);
                    return "customerProfile.jsp";
                }
                String newPassword = form.getNewPassword();
                String confirmNewPwd = form.getConfirmNewPwd();
                String currentInputPwd = form.getCurrentPwd();
                // Validate if the input current password match with data in DB
                if (!confirmNewPwd.equals(newPassword)) {
                    // How to display at the modal
                    // Need to display with modal pop-up
                    System.out.println("Inconsistent password.");
                    form.addFormError("New Password and its confirmation do not match!");
                    request.setAttribute("changePasswordForm", form);
                    return "customerProfile.jsp";
                }
                String password = currentCustomerCredential.getPassword();
                if (!password.equals(currentInputPwd)) {
                    System.out.println("Wrong password.");
                    form.addFormError("Wrong Password.");
                    request.setAttribute("changePasswordForm", form);
                    return "customerProfile.jsp";
                }                
                currentCustomerCredential.setPassword(newPassword);
                ccDAO.update(currentCustomerCredential);
                return "customerProfile.jsp";
            }
            
            // 4. Set preferred contact
            // Form with Radio Button
            if (buttonClicked.equals("Update Communication Information")) {
                System.out.println("Update Communication Information");
                CommunicationInfoForm form = communicationInfoFormBeanFactory.create(request);
                if (form.hasValidationErrors()) {
                    System.out.println("Communication Info: validation errors");
                    request.setAttribute("communicationForm", form);
                    return "customerProfile.jsp";
                }
                
                String preferredContact = form.getPreference_contact();
                currentCustomerInfo.setPreference_contact(preferredContact);
                ciDAO.update(currentCustomerInfo);
                return "customerProfile.jsp";
            }           
            
        } catch (RollbackException e) {
            e.printStackTrace();
        }
        return null;
    }
    
    @Override
    public String getName() {
        return "update_profile.do";
    }
}
