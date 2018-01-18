package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.genericdao.MatchArg;
import org.genericdao.RollbackException;

import databean.Account;
import databean.TransactionHistory;
import model.Model;
import model.TransactionHistoryDAO;
import org.genericdao.MatchArg;
import org.genericdao.RollbackException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

public class ExploreTransactionsAction extends Action{
    private TransactionHistoryDAO trscDAO;    
    
    public ExploreTransactionsAction(Model model) {
        trscDAO = model.getTrscDAO();
    }
    public String performGet(HttpServletRequest request) {
        return performPost(request);
    }

    private TransactionHistory[] getTransactionHistoriesBetweenTime(String from, String to, String checkingAccountNum, String savingAccountNum)
            throws RollbackException {
        TransactionHistory[] ret  = trscDAO.match(
                MatchArg.and(
                        MatchArg.or(
                                MatchArg.equals("account_no", checkingAccountNum),
                                MatchArg.equals("account_no", savingAccountNum)
                        ),

                        MatchArg.and(
                                MatchArg.greaterThanOrEqualTo("date", from),
                                MatchArg.lessThanOrEqualTo("date", to)
                        )
                )
        );

        return ret;
    }

    public String performPost(HttpServletRequest request) {
        System.out.println("Explore Transaction History");
        HttpSession session = request.getSession();

        Account checkingAccount = (Account) session.getAttribute("checkingAccount");
        Account savingAccount = (Account) session.getAttribute("savingAccount");
        String checkingAccountNum = checkingAccount.getAccount_no();
        String savingAccountNum = savingAccount.getAccount_no();
        
        String transactionId = request.getParameter("transactionId");
        if (transactionId != null) {
            System.out.println("Get transaction Id " + transactionId);
            TransactionHistory detailsTransaction = null;
            try {
                detailsTransaction = trscDAO.read(transactionId);
            } catch (RollbackException e) {
                e.printStackTrace();
            }
            request.setAttribute("detailsTransaction", detailsTransaction);
            return "detailsTransaction.jsp";
        }
        
        try {
            TransactionHistory[] transactionHistory = trscDAO.match(MatchArg.or(
                                                                        MatchArg.equals("account_no", checkingAccountNum),
                                                                        MatchArg.equals("account_no", savingAccountNum)));

            LocalDateTime now = LocalDateTime.now();
            LocalDateTime nowMinusOneWeek = now.minusWeeks(1);
            LocalDateTime nowMinusOneMonth  = now.minusMonths(1);
            LocalDateTime nowMinusThreeMonths = now.minusMonths(3);
            LocalDateTime nowMinusOneYear = now.minusYears(1);

            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");

            String formattedNow = now.format(formatter);
            String formattedNowMinusOneWeek = nowMinusOneWeek.format(formatter);

            TransactionHistory[] transactionsInOneWeek =
                    getTransactionHistoriesBetweenTime(formattedNowMinusOneWeek, formattedNow, checkingAccountNum, savingAccountNum);

            String formattedNowMinusOneMonth = nowMinusOneMonth.format(formatter);
            TransactionHistory[] transactionsInOneMonth =
                    getTransactionHistoriesBetweenTime(formattedNowMinusOneMonth, formattedNow, checkingAccountNum, savingAccountNum);

            String formattedNowMinusThreeMonths = nowMinusThreeMonths.format(formatter);
            TransactionHistory[] transactionsInThreeMonths =
                    getTransactionHistoriesBetweenTime(formattedNowMinusThreeMonths, formattedNow, checkingAccountNum, savingAccountNum);

            String formattedNowMinusOneYear = nowMinusOneYear.format(formatter);
            TransactionHistory[] transactionsInOneYear =
                    getTransactionHistoriesBetweenTime(formattedNowMinusOneYear, formattedNow, checkingAccountNum, savingAccountNum);

            request.setAttribute("transactionsInOneWeek", transactionsInOneWeek);
            request.setAttribute("transactionsInOneMonth", transactionsInOneMonth);
            request.setAttribute("transactionsInThreeMonths", transactionsInThreeMonths);
            request.setAttribute("transactionsInOneYear", transactionsInOneYear);

            System.out.println("The lenght of transactionHistory is " + transactionHistory.length);
            request.setAttribute("transactionHistory", transactionHistory);
        } catch (RollbackException e) {
            e.printStackTrace();
        }
              
        return "transactionHistory.jsp";
    }
    
    @Override
    public String getName() {
        return "explore_transactions.do";
    }
}
