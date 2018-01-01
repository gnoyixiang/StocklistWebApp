package repository;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import model.User;

public class UserDAOImpl implements UserDAO {
	Connection conn;
	Statement stmt;	
	PreparedStatement pstmt;
	ResultSet rset;

	private static final String qFindAllUser = "select * from user";


	/* (non-Javadoc)
	 * @see repository.UserDAO#findAllUser()
	 */
	@Override
	public List<User> findAllUser(){
		List<User> users;
		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			// need to catch SQLException
			conn = DriverManager.getConnection(SqlUtils.URL, SqlUtils.USER, SqlUtils.PW);
			// allocate statement in the connection
			pstmt = conn.prepareStatement(qFindAllUser);
			rset = pstmt.executeQuery();
			users = new ArrayList<User>();
			while (rset.next()) {
				User u = new User();
				u.setUsername(rset.getString("username"));
				u.setPassword(rset.getString("password"));
				u.setRole(rset.getString("role"));
				u.setStatus(rset.getString("status"));
				users.add(u);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			users=null;
		} catch (InstantiationException e) {
			e.printStackTrace();
			users=null;
		} catch (IllegalAccessException e) {
			e.printStackTrace();
			users=null;
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			users=null;
		} finally {
			closeConnection();
		}
		return users;
	
	}
	
	/* (non-Javadoc)
	 * @see repository.UserDAO#addUser(model.User)
	 */
	@Override
	public boolean addUser(User u){
		return true;
	}
	
	/* (non-Javadoc)
	 * @see repository.UserDAO#editUser(model.User)
	 */
	@Override
	public boolean editUser(User u){
		return true;
	}
	
	/* (non-Javadoc)
	 * @see repository.UserDAO#deleteUser(model.User)
	 */
	@Override
	public boolean deleteUser(User u){
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
