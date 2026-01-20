package cubes.main.dao;

import java.util.List;

import cubes.main.entity.User;

public interface UserDAO {
	
	public List<User> getUsers();

	public void saveOrUpdateUser(User user);

	public User getUserByname(String username);

	public void deleteUser(String username);

}
