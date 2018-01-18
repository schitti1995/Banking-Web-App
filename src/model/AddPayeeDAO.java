package model;

import org.genericdao.ConnectionPool;
import org.genericdao.DAOException;
import org.genericdao.GenericDAO;
import org.genericdao.RollbackException;

import databean.PayeeInfo;

public class AddPayeeDAO extends GenericDAO<PayeeInfo> {
    public AddPayeeDAO(ConnectionPool cp, String tableName) throws DAOException {
        super(PayeeInfo.class, tableName, cp);
    }
    
    public PayeeInfo[] getAllPayees() {
        PayeeInfo[] allpayees;
        try {
            allpayees = match();
        } catch (RollbackException e) {
            return null;
        }
        return allpayees;
    }
}