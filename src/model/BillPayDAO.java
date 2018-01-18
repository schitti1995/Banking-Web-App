package model;

import org.genericdao.ConnectionPool;
import org.genericdao.DAOException;
import org.genericdao.GenericDAO;

import databean.BillPay;


public class BillPayDAO extends GenericDAO<BillPay> {
    public BillPayDAO(ConnectionPool cp, String tableName) throws DAOException {
        super(BillPay.class, tableName, cp);
    }
}
