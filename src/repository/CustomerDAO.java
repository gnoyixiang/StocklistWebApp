package repository;

import java.util.List;

import model.Customer;
import model.Transaction;

public interface CustomerDAO {

	List<Customer> findAllCustomer();

	boolean addCustomer(Customer c);

	boolean editCustomer(Customer c);

	boolean deleteCustomer(Customer c);

}