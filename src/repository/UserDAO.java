package repository;

import java.util.List;

import model.User;

public interface UserDAO {

	List<User> findAllUser();

	boolean addUser(User u);

	boolean editUser(User u);

	boolean deleteUser(User u);

}