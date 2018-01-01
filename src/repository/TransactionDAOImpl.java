package repository;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import model.Product;
import model.Transaction;
import model.TransactionDetails;
import service.CustomerService;
import service.TransactionService;

public class TransactionDAOImpl implements TransactionDAO {
	private Connection conn;
	private Statement stmt;
	private PreparedStatement pstmt;
	private ResultSet rset;

	private static final SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	private static final String qFindAllTrans = "select * from transaction";
	private static final String qAddTrans = "insert into transaction(transactionid, customerid, consumedate, username) values (?,?,?,?)";
	private static final String qAddTransDetails = "insert into transactiondetails(transactionid, partnumber, quantity) "
			+ "values (?,?,?)";

	/*
	 * (non-Javadoc)
	 * 
	 * @see repository.TransactionDAO#finalAllTrans()
	 */
	@Override
	public List<Transaction> findAllTrans() {
		List<Transaction> trans;
		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			// need to catch SQLException
			conn = DriverManager.getConnection(SqlUtils.URL, SqlUtils.USER, SqlUtils.PW);
			// allocate statement in the connection
			pstmt = conn.prepareStatement(qFindAllTrans);
			rset = pstmt.executeQuery();
			trans = new ArrayList<Transaction>();
			while (rset.next()) {
				Transaction t = new Transaction();
				t.setTransactionId(rset.getInt("transactionid"));
				t.setCustomerId(rset.getInt("customerid"));
				t.setCustomer(new CustomerService().getCustomerById(t.getCustomerId()));
				t.setUsername(rset.getString("username"));
				t.setConsumeDate(rset.getDate("consumedate"));
				trans.add(t);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			trans = null;
		} catch (InstantiationException e) {
			e.printStackTrace();
			trans = null;
		} catch (IllegalAccessException e) {
			e.printStackTrace();
			trans = null;
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			trans = null;
		} finally {
			closeConnection();
		}
		return trans;

	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see repository.TransactionDAO#addTrans(model.Transaction)
	 */
	@Override
	public boolean addTrans(Transaction t, List<TransactionDetails> transDetails) {
		boolean success = true;
		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			// need to catch SQLException
			conn = DriverManager.getConnection(SqlUtils.URL, SqlUtils.USER, SqlUtils.PW);

			conn.setAutoCommit(false);
			
			// allocate statement in the connection
			pstmt = conn.prepareStatement(qAddTrans);
			// "insert into transaction(transactionid, customerid, consumedate, username)
			// values (?,?,?,?)"
			pstmt.setInt(1, t.getTransactionId());
			pstmt.setInt(2, t.getCustomerId());
			pstmt.setDate(3, java.sql.Date.valueOf(sdf.format(t.getConsumeDate())));
			pstmt.setString(4, t.getUsername());

			int rowsAffected = pstmt.executeUpdate();
			pstmt.close();
			if (rowsAffected != 1) {
				success = false;
				conn.rollback();
			} else {
				for(TransactionDetails td : transDetails) {
					pstmt = conn.prepareStatement(qAddTransDetails);
					//"insert into transactiondetails(transactionid, partnumber, quantity) values (?,?,?,?)"
					pstmt.setInt(1, td.getTransactionId());
					pstmt.setInt(2, td.getPartNumber());
					pstmt.setInt(3, td.getQuantity());					
					if((rowsAffected = pstmt.executeUpdate()) != 1) { 	 	
						success = false;
						conn.rollback();
						break;
					}
				}
				conn.commit();
			}
		} catch (SQLException e) {
			e.printStackTrace();
			success = false;
		} catch (InstantiationException e) {
			e.printStackTrace();
			success = false;
		} catch (IllegalAccessException e) {
			e.printStackTrace();
			success = false;
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			success = false;
		} finally {
			closeConnection();
		}

		return success;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see repository.TransactionDAO#editTrans(model.Transaction)
	 */
	@Override
	public boolean editTrans(Transaction t) {
		return true;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see repository.TransactionDAO#deleteTrans(model.Transaction)
	 */
	@Override
	public boolean deleteTrans(Transaction t) {
		return true;
	}

	private void closeConnection() {
		try {
			if (!pstmt.isClosed()) {
				pstmt.close();
			}
			if (!conn.isClosed()) {
				conn.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
