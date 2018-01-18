package model;

import org.genericdao.ConnectionPool;
import org.genericdao.DAOException;
import org.genericdao.GenericDAO;
import org.genericdao.RollbackException;

import databean.Payee;

public class PayeePayDAO extends GenericDAO<Payee> {
    public PayeePayDAO(ConnectionPool cp, String tableName) throws DAOException {
        super(Payee.class, tableName, cp);
    }
    
    public Payee[] getAllTransactions() {
        Payee[] allpayees;
        try {
            allpayees = match();
        } catch (RollbackException e) {
            return null;
        }
        return allpayees;
    }
}

