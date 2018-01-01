package repository;

import java.util.List;

import model.Product;

public interface ProductDAO {

	// create
	boolean addProduct(Product p);

	// read
	List<Product> findAllProducts();
	
	boolean editProduct(Product p);

}