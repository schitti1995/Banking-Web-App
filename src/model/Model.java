package model;

import org.genericdao.ConnectionPool;
import org.genericdao.DAOException;



import javax.servlet.ServletConfig;
import javax.servlet.ServletException;

public class Model {
    private CustomerCredentialDAO ccDAO;
    private CustomerInfoDAO ciDAO;
    private AccountDAO accDAO;
    private TransferRecordDAO trDAO;
    private DepositHistoryDAO depositHistoryDAO;
    private TransactionHistoryDAO trscDAO;
    private BillPayDAO billpay;
    private PayeePayDAO ppDAO;
    private AddPayeeDAO apDAO;
    private BillDAO billDAO;

    public Model(ServletConfig config) throws ServletException {
        try {
            String jdbcDriver = config.getInitParameter("jdbcDriverName");
            String jdbcURL    = config.getInitParameter("jdbcURL");
//            String username   = config.getInitParameter("jdbcUsername");;
//            String password   = config.getInitParameter("jdbcPassword");

            ConnectionPool pool = new ConnectionPool(jdbcDriver, jdbcURL);

            ccDAO = new CustomerCredentialDAO(pool, "customer_credential");
            ciDAO = new CustomerInfoDAO(pool,"customer_info");
            accDAO = new AccountDAO(pool, "account");
            trDAO = new TransferRecordDAO(pool, "transfer_history");
            depositHistoryDAO = new DepositHistoryDAO(pool, "deposit_history");
            trscDAO = new TransactionHistoryDAO(pool, "transaction_history");
            billpay = new BillPayDAO(pool,"billpay_history");
            ppDAO = new PayeePayDAO(pool, "payee_transaction");
            apDAO = new AddPayeeDAO(pool, "payeeinfo");
            billDAO = new BillDAO(pool,"loans");
        } catch (DAOException e) {
            throw new ServletException(e);
        }
    }

    public DepositHistoryDAO getDepositHistoryDAO() {
        return depositHistoryDAO;
    }

    public void setDepositHistoryDAO(DepositHistoryDAO depositHistoryDAO) {
        this.depositHistoryDAO = depositHistoryDAO;
    }

    public CustomerCredentialDAO getCcDAO() {
		return ccDAO;
	}

	public CustomerInfoDAO getCiDAO() {
		return ciDAO;
	}

	public AccountDAO getAccDAO() {
		return accDAO;
	}

	public TransferRecordDAO getTrDAO() {
		return trDAO;
	}


	public TransactionHistoryDAO getTrscDAO() {
		return trscDAO;
    }

	public BillPayDAO getBillPay() {
		return billpay;
	}
	public PayeePayDAO getPpDAO() {
        return ppDAO;
    }
	
	public AddPayeeDAO getApDAO() {
        return apDAO;
    }
	public BillDAO getBillDAO() {
		return billDAO;
	}
}
