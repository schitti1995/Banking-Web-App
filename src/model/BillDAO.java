package model;
import org.genericdao.ConnectionPool;
import org.genericdao.DAOException;
import org.genericdao.GenericDAO;

import databean.Bill;


public class BillDAO extends GenericDAO<Bill> {
    public BillDAO(ConnectionPool cp, String tableName) throws DAOException {
        super(Bill.class, tableName, cp);
    }
}