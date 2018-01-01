package service;

import java.util.*;
import model.Product;
import repository.*;

public class ProductService {

	private ProductDAO pDAO;

	public ProductService() {
		pDAO = new ProductDAOImpl();
	}

	public List<Product> findAllProducts() {
		return pDAO.findAllProducts();
	}

	public Product findProduct(int partNumber) {
		List<Product> productList = pDAO.findAllProducts();
		for (Product product : productList) {
			if (product.getPartNumber() == partNumber) {
				return product;
			}
		}
		return null;
	}

	public Product findProductByIndex(int index) {
		List<Product> productList = pDAO.findAllProducts();
		if (index < 0 || index >= productList.size()) {
			return null;
		}
		return productList.get(index);
	}

	public int getProductIndex(int partNumber) {
		List<Product> productList = pDAO.findAllProducts();
		for (int i = 0; i < productList.size(); i++) {
			if (productList.get(i).getPartNumber() == partNumber) {
				return i;
			}
		}
		return -1;
	}

	public int getCount() {
		return pDAO.findAllProducts().size();
	}

	public boolean editProduct(int partNumber, int stock, double unitPrice) {
		Product p = findProduct(partNumber);
		p.setStock(stock);
		p.setUnitPrice(unitPrice);
		return pDAO.editProduct(p);
	}
}
