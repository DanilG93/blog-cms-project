package cubes.main.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import cubes.main.entity.User;

public interface UserService {
	
	public List<User> getUsers();
	
	public List<User> getUsers(int page, int pageSize);

	public void saveOrUpdateUser(User user);

	public User getUserByUsername(String username);

	public void deleteUser(String username);
	
	public void enableDisableUser(String username);
	
	public void saveUser(User user, List<String> roles, MultipartFile file, HttpServletRequest request);
	
	public void saveMyProfile(User user, MultipartFile file, HttpServletRequest request);
	
	public long getUserCount();

}
