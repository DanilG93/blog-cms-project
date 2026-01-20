package cubes.main.service;

import java.util.List;

import cubes.main.entity.User;

public interface UserService {
	
	public List<User> getUsers();

	public void saveOrUpdateUser(User user);

	public User getUserByname(String username);

	public void deleteUser(String username);

}
