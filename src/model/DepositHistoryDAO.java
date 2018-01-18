package model;

import databean.DepositHistory;
import org.genericdao.ConnectionPool;
import org.genericdao.DAOException;
import org.genericdao.GenericDAO;

public class DepositHistoryDAO extends GenericDAO<DepositHistory> {
    public DepositHistoryDAO(ConnectionPool cp, String tableName) throws DAOException {
        super(DepositHistory.class, tableName, cp);
    }
}
