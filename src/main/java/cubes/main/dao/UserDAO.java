package cubes.main.dao;

import java.util.List;

import cubes.main.entity.User;

public interface UserDAO {

	public List<User> getUsers();
	
	public List<User> getUsers(int page, int pageSize);

	public void saveOrUpdateUser(User user);

	public User getUserByUsername(String username);

	public void deleteUser(String username);

	public void enableDisableUser(String username);
	
	public long getUserCount();

}
