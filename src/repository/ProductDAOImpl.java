package repository;

import java.sql.*;
import java.util.*;

import model.*;

public class ProductDAOImpl implements ProductDAO {
	Connection conn;
	Statement stmt;
	PreparedStatement pstmt;
	ResultSet rset;

	private static final String qFindAllProducts = "select * from product";
	private static final String qAddProduct = "insert into product(partNumber, supplierId, reorderLevel, minReorderQuantity, stock, unitPrice, description, colour, dimension, manufacturer, shelfLocation, status) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
	private static final String qDeleteProduct = "delete from product where partNumber = ?";
	private static final String qEditProduct = "update product set stock = ?, unitPrice = ? where partNumber = ?";

	// test ProductDAOImpl methods
	public static void main(String args[]) {
		ProductDAO productDAOImpl = new ProductDAOImpl();
		List<Product> products = productDAOImpl.findAllProducts();
		for (Product p : products) {
			System.out.println(p);
		}
	}

	// create
	/*
	 * (non-Javadoc)
	 * 
	 * @see repository.ProductDAO#addProduct(model.Product)
	 */
	@Override
	public boolean addProduct(Product p) {
		return true;
	}

	// read
	/*
	 * (non-Javadoc)
	 * 
	 * @see repository.ProductDAO#findAllProducts()
	 */
	@Override
	public List<Product> findAllProducts() {
		List<Product> products;
		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			// need to catch SQLException
			conn = DriverManager.getConnection(SqlUtils.URL, SqlUtils.USER, SqlUtils.PW);
			// allocate statement in the connection
			pstmt = conn.prepareStatement(qFindAllProducts);
			rset = pstmt.executeQuery();

			products = new ArrayList<Product>();
			while (rset.next()) {
				Product p = new Product();
				p.setPartNumber(rset.getInt("partnumber"));
				p.setUnitPrice(rset.getDouble("unitprice"));
				p.setDescription(rset.getString("description"));
				p.setColour(rset.getString("colour"));
				p.setDimension(rset.getString("dimension"));
				p.setManufacturer(rset.getString("manufacturer"));
				p.setSupplierId(rset.getInt("supplierid"));
				p.setReorderLevel(rset.getInt("reorderlevel"));
				p.setMinReorderQty(rset.getInt("minimumreorderquantity"));
				p.setShelfLocation(rset.getString("shelflocation"));
				p.setStock(rset.getInt("stock"));
				p.setStatus(rset.getString("status"));
				products.add(p);
			}
			return products;
		} catch (SQLException e) {
			e.printStackTrace();
			products = null;
		} catch (InstantiationException e) {
			e.printStackTrace();
			products = null;
		} catch (IllegalAccessException e) {
			e.printStackTrace();
			products = null;
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			products = null;
		} finally {
			closeConnection();
		}
		return products;
	}

	// update
	@Override
	public boolean editProduct(Product p) {
		boolean success = false;
		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			// need to catch SQLException
			conn = DriverManager.getConnection(SqlUtils.URL, SqlUtils.USER, SqlUtils.PW);

			pstmt = conn.prepareStatement(qEditProduct);
			pstmt.setInt(1, p.getStock());
			pstmt.setDouble(2, p.getUnitPrice());
			pstmt.setInt(3, p.getPartNumber());
			int rowsAffected = pstmt.executeUpdate();
			if (rowsAffected == 1)
				success = true;
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (InstantiationException e) {
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} finally {
			closeConnection();
		}
		return success;
	}

	// delete

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
