package model;

import org.genericdao.ConnectionPool;
import org.genericdao.DAOException;
import org.genericdao.GenericDAO;

import databean.TransactionHistory;

public class TransactionHistoryDAO extends GenericDAO<TransactionHistory> {
    public TransactionHistoryDAO(ConnectionPool cp, String tableName) throws DAOException {
        super(TransactionHistory.class, tableName, cp);
    }
}
