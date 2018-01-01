package repository;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import model.Customer;
import model.Transaction;

public class CustomerDAOImpl implements CustomerDAO {
	Connection conn;
	Statement stmt;	
	PreparedStatement pstmt;
	ResultSet rset;

	private static final String qFindAllCustomer = "select * from customer";
	
	
	/* (non-Javadoc)
	 * @see repository.CustomerDAO#findAllCustomer()
	 */
	@Override
	public List<Customer> findAllCustomer(){
		List<Customer> customers;
		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			// need to catch SQLException
			conn = DriverManager.getConnection(SqlUtils.URL, SqlUtils.USER, SqlUtils.PW);
			// allocate statement in the connection
			pstmt = conn.prepareStatement(qFindAllCustomer);
			rset = pstmt.executeQuery();
			customers = new ArrayList<Customer>();
			while (rset.next()) {
				Customer c = new Customer();
				c.setCustomerId(rset.getInt("customerid"));
				c.setCustomerName(rset.getString("customername"));
				c.setAddress(rset.getString("address"));
				c.setCountry(rset.getString("country"));
				c.setContactNumber(rset.getInt("contactnumber"));
				customers.add(c);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			customers=null;
		} catch (InstantiationException e) {
			e.printStackTrace();
			customers=null;
		} catch (IllegalAccessException e) {
			e.printStackTrace();
			customers=null;
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			customers=null;
		} finally {
			closeConnection();
		}
		return customers;
	
	}
	
	/* (non-Javadoc)
	 * @see repository.CustomerDAO#addCustomer(model.Customer)
	 */
	@Override
	public boolean addCustomer(Customer c){
		return true;
	}
	
	/* (non-Javadoc)
	 * @see repository.CustomerDAO#editCustomer(model.Customer)
	 */
	@Override
	public boolean editCustomer(Customer c){
		return true;
	}
	
	/* (non-Javadoc)
	 * @see repository.CustomerDAO#deleteCustomer(model.Customer)
	 */
	@Override
	public boolean deleteCustomer(Customer c){
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
