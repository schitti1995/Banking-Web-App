package controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.genericdao.DuplicateKeyException;
import org.genericdao.MatchArg;

import databean.Account;
import databean.Payee;
import databean.PayeeInfo;
import model.PayeePayDAO;
import model.AddPayeeDAO;
import model.AccountDAO;
import model.Model;


public class PayPayeeAction extends Action {

    private PayeePayDAO ppDAO;
    private AccountDAO accDAO;
    private AddPayeeDAO apDAO;

    public PayPayeeAction(Model model) {
        accDAO = model.getAccDAO();
        ppDAO = model.getPpDAO();
        apDAO = model.getApDAO();
    }

    public String performGet(HttpServletRequest request) {
        PayeeInfo[] allpayees = apDAO.getAllPayees();
//        for(PayeeInfo p : allpayees) {
//            System.out.println(p.getPayee_name());
//        }
        HttpSession session = request.getSession();
        session.setAttribute("allpayees", allpayees);
        return "Paybills.jsp";
    }

    public String performPost(HttpServletRequest request) {
        HttpSession session = request.getSession();
        List<String> errors = new ArrayList<String>();
        session.setAttribute("errors_paypayee", errors);
        
        PayeeInfo[] allpayees = apDAO.getAllPayees();
//        for(PayeeInfo p : allpayees) {
//            System.out.println(p.getPayee_name());
//        }
        session.setAttribute("allpayees", allpayees);

        try {
            String bname = request.getParameter("button");
            if(bname != null) {
                String accNo = parseAccountNumber(bname);
                if(accNo == null) {
                    errors.add("No account number to pay to!");
                    return "Paybills.jsp";
                }

                else {
                    String amount = request.getParameter(accNo);
                    if(amount == null || amount.trim().equals("")) {
                        errors.add("Please enter the amount");
                        return "Paybills.jsp";
                    }

                    try {
                        double amt = Double.parseDouble(amount);
                        
                        PayeeInfo[] currentpayee;
                        try {
                            currentpayee = apDAO.match(MatchArg.equals("payee_account_no", accNo));
                            if(currentpayee.length != 1) {
                                throw new Exception();
                            }
                            /*for(PayeeInfo pp : currentpayee) {
                                System.out.println(pp.getFromAccount_no());
                            }*/
                        } catch(Exception e) {
                            errors.add("Error locating your accounts");
                            return "Paybills.jsp";
                        }
                        
                        Account[] aa = accDAO.match(MatchArg.equals("account_no", currentpayee[0].getFromAccount_no()));
                        if(aa.length != 1) {
                            errors.add("Not able to locate your account");
                            return "Paybills.jsp";
                        }
                       
                        if(amt < 0) {
                            errors.add("Amount can't be negative.");
                            return "Paybills.jsp";
                        }
                        
                        Payee current = new Payee();
                        current.setAmount(amt);
                        current.setFromAccount_no(currentpayee[0].getFromAccount_no());
                        current.setPayee_name(currentpayee[0].getPayee_name());
                        current.setPayment_id(Long.toString((long)System.currentTimeMillis()));
                        current.setToAccount_no(accNo);
                        current.setTrdate(new Date().toString());
                        
                        if(amt < aa[0].getBalance()) {
                            aa[0].setBalance(aa[0].getBalance() - amt);
                            accDAO.update(aa[0]);
                            current.setStat("Processed");
                            
                            try {
                                ppDAO.create(current);
                            } catch(DuplicateKeyException e) {
                                errors.add("Transaction Id already exists!");
                                return "Paybills.jsp";
                            }
                            
                            Payee[] payee_transactions = ppDAO.getAllTransactions();
                            session.setAttribute("payee_transactions", payee_transactions);
                            
                            request.setAttribute("utilitypay_pass", "Payment successful. You will receive a confirmation to your mail soon.");
                            request.setAttribute("utilitypay_fail", null);
                            return "Utility_history.jsp";
                        }

                        else {
                            current.setStat("Failed");
                            try {
                                ppDAO.create(current);
                            } catch(DuplicateKeyException e) {
                                errors.add("Transaction Id already exists!");
                                return "Paybills.jsp";
                            }
                            
                            Payee[] payee_transactions = ppDAO.getAllTransactions();
                            session.setAttribute("payee_transactions", payee_transactions);
                            
                            request.setAttribute("utilitypay_fail", "Failed. You don't have enough money in the account you specified");
                            request.setAttribute("utilitypay_pass", null);
                            return "Utility_history.jsp";
                        }

                    } catch(Exception e) {
                        errors.add("Amount entered is not valid");
                        return "Paybills.jsp";
                    }

//                    session.setAttribute("errors_paypayee", null);
//                    return "addpayee.do";
                }
            }

            else {
                errors.add("Incorrect button!");
                return "Paybills.jsp";
            }
        } catch(Exception e) {
            errors.add("Oops. Something went wrong.");
            return "Paybills.jsp";
        }
    }

    private String parseAccountNumber(String bname) throws Exception{
        return bname.substring(4, 14);
    }

    @Override
    public String getName() {
        return "paypayee.do";
    }

}
