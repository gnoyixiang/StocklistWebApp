package service;

import repository.*;
import model.*;
import java.util.*;

public class CustomerService {
	CustomerDAO cDAO;
	
	public CustomerService() {
		cDAO = new CustomerDAOImpl();
	}
	
	public List<Customer> findAllCustomers(){
		return cDAO.findAllCustomer();
	}
	
	public Customer findCustomerByName(String customerName){
		List<Customer> cList = cDAO.findAllCustomer();
		for(Customer c: cList) {
			if(c.getCustomerName().equals(customerName)) {
				return c;
			}
		}
		return null;
	}
	
	public Customer getCustomerById(int customerId){
		List<Customer> cList = cDAO.findAllCustomer();
		for(Customer c: cList) {
			if(c.getCustomerId()==customerId) {
				return c;
			}
		}
		return null;
	}
}
