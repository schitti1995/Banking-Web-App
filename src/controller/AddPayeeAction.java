package controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.genericdao.RollbackException;

import org.genericdao.DuplicateKeyException;

import databean.PayeeInfo;
import formbean.AddPayeeForm;
import model.AddPayeeDAO;
import model.Model;

public class AddPayeeAction extends Action {
    
    private AddPayeeDAO apDAO;
    
    public AddPayeeAction(Model model) {
        apDAO = model.getApDAO();
    }

    public String performGet(HttpServletRequest request) {
        return "Addpayee.jsp";
    }
    
    public String performPost(HttpServletRequest request) {
        HttpSession session = request.getSession();
        List<String> errors = new ArrayList<String>();
        session.setAttribute("errors_addpayee", errors);

        try {
            AddPayeeForm form = new AddPayeeForm(request);
            request.setAttribute("form", form);
            
            if(form.getButton().equals("Add Payee")) {
                errors.addAll(form.getValidationErrors());
                
                if (errors.size() != 0) {
                    return "Addpayee.jsp";
                }
                
                PayeeInfo p = new PayeeInfo();
                p.setFromAccount_no(form.getFrom_Account());
                p.setPayee_account_no(form.getPayee_acc());
                p.setPayee_name(form.getPayee_name());
                p.setUtility(form.getUtility());
                
                try {
                    apDAO.create(p);
                } catch(DuplicateKeyException e) {
                    errors.add("A user with this account number already exists");
                    return "Addpayee.jsp";
                }
                session.setAttribute("errors_addpayee", null);
                return "paypayee.do";
            }
            else {
                session.setAttribute("errors_addpayee", null);
                return "Addpayee.jsp";
            }
            

        } catch (RollbackException e) {
            errors.add(e.getMessage());
            return "Addpayee.jsp";
        }
    }
    
    @Override
    public String getName() {
        return "addpayee.do";
    }

}
