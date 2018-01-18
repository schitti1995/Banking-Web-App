package controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.genericdao.RollbackException;

import databean.PayeeInfo;
import model.AddPayeeDAO;
import model.Model;

public class DeletePayeeAction extends Action {
    
    private AddPayeeDAO apDAO;
    
    public DeletePayeeAction(Model model) {
        apDAO = model.getApDAO();
    }

    public String performGet(HttpServletRequest request) {
        HttpSession session = request.getSession();
        PayeeInfo[] allpayees = apDAO.getAllPayees();
        session.setAttribute("allpayees", allpayees);
        return "Managepayees.jsp";
    }
    
    public String performPost(HttpServletRequest request) {
        List<String> errors = new ArrayList<String>();
        request.setAttribute("errors_delete", errors);
        HttpSession session = request.getSession();
        
        PayeeInfo[] allpayees = apDAO.getAllPayees();
        session.setAttribute("allpayees", allpayees);

        try {
            String id = (String)request.getParameter("id");
            if(id == null) {
                errors.add("Button not found");
                return "Managepayees.jsp";
            }
            
            apDAO.delete(id);
            errors.add("Successfully deleted the payee!");
            allpayees = apDAO.getAllPayees();
            session.setAttribute("allpayees", allpayees);
            return "Managepayees.jsp";
            
        } catch (RollbackException e) {
            errors.add(e.getMessage());
            return "Managepayees.jsp";
        }
    }
    
    @Override
    public String getName() {
        return "deletepayee.do";
    }

}
