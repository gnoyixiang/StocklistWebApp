package repository;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import model.Transaction;
import model.TransactionDetails;
import service.ProductService;

public class TransactionDetailsDAOImpl implements TransactionDetailsDAO {
	Connection conn;
	Statement stmt;	
	PreparedStatement pstmt;
	ResultSet rset;

	private static final String qFindAllTransDetails = "select * from transactiondetails where transactionId=?";
	
	/* (non-Javadoc)
	 * @see repository.TransactionDetailsDAO#finalAllTransDetails()
	 */
	@Override
	public List<TransactionDetails> findTransDetails(Transaction t){
		List<TransactionDetails> transDetails;
		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			// need to catch SQLException
			conn = DriverManager.getConnection(SqlUtils.URL, SqlUtils.USER, SqlUtils.PW);
			// allocate statement in the connection
			pstmt = conn.prepareStatement(qFindAllTransDetails);
			pstmt.setInt(1, t.getTransactionId());
			rset = pstmt.executeQuery();
			transDetails = new ArrayList<TransactionDetails>();
			while (rset.next()) {
				TransactionDetails td = new TransactionDetails();
				td.setTransactionId(rset.getInt("transactionid"));
				td.setPartNumber(rset.getInt("partNumber"));
				td.setQuantity(rset.getInt("quantity"));
				td.setProduct(new ProductService().findProduct(td.getPartNumber()));
				transDetails.add(td);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			transDetails=null;
		} catch (InstantiationException e) {
			e.printStackTrace();
			transDetails=null;
		} catch (IllegalAccessException e) {
			e.printStackTrace();
			transDetails=null;
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			transDetails=null;
		} finally {
			closeConnection();
		}
		return transDetails;
	
	}
	
	/* (non-Javadoc)
	 * @see repository.TransactionDetailsDAO#addTransDetails(model.TransactionDetails)
	 */
	@Override
	public boolean addTransDetails(TransactionDetails td){
		return true;
	}
	
	/* (non-Javadoc)
	 * @see repository.TransactionDetailsDAO#editTransDetails(model.TransactionDetails)
	 */
	@Override
	public boolean editTransDetails(TransactionDetails td){
		return true;
	}
	/* (non-Javadoc)
	 * @see repository.TransactionDetailsDAO#deleteTransDetails(model.TransactionDetails)
	 */
	@Override
	public boolean deleteTransDetails(TransactionDetails td){
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
