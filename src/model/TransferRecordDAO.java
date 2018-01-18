package model;

import org.genericdao.ConnectionPool;
import org.genericdao.DAOException;
import org.genericdao.GenericDAO;

import databean.TransferRecord;

public class TransferRecordDAO extends GenericDAO<TransferRecord> {
    public TransferRecordDAO(ConnectionPool cp, String tableName) throws DAOException {
        super(TransferRecord.class, tableName, cp);
    }
}
