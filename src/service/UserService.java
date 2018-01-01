package service;

import java.util.*;

import model.User;
import repository.*;

public class UserService {
	UserDAO uDAO;

	public UserService() {
		uDAO = new UserDAOImpl();
	}

	public List<User> findAllUsers() {
		return uDAO.findAllUser();
	}

	public List<String> findAllUsername(){
		List<User> users = uDAO.findAllUser();
		List<String> usernames = new ArrayList<>();
		for(User u:users) {
			usernames.add(u.getUsername());
		}
		return usernames;
	}

	public User findUser(String username) {
		List<User> users = uDAO.findAllUser();
		for(User u:users) {
			if(u.getUsername().equals(username)) return u;
		}
		return null;
	}
	
	public boolean loginUser(String username, String password) {
		User u = findUser(username);
		if(u!=null)
			if(u.getPassword().equals(password)) {
			return true;
		}
		return false;
	}

	public String getRole(String username) {
		// TODO Auto-generated method stub
		return findUser(username).getRole();
	}
	
}
