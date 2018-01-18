package model;

import org.genericdao.ConnectionPool;
import org.genericdao.DAOException;
import org.genericdao.GenericDAO;

import databean.Account;

public class AccountDAO extends GenericDAO<Account> {

	public AccountDAO(ConnectionPool connectionPool, String tableName) throws DAOException {
		super(Account.class, tableName, connectionPool);
	}
	
}
