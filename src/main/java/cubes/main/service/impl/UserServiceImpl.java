package cubes.main.service.impl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import cubes.main.dao.UserDAO;
import cubes.main.entity.Role;
import cubes.main.entity.User;
import cubes.main.service.UserService;
import cubes.main.util.MyUtil;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDAO userDAO;

	@Autowired
	private PasswordEncoder passwordEncoder;

	@Override
	@Transactional
	public List<User> getUsers() {
		return userDAO.getUsers();
	}

	@Override
	@Transactional
	public void saveOrUpdateUser(User user) {
		userDAO.saveOrUpdateUser(user);

	}

	@Override
	@Transactional
	public User getUserByUsername(String username) {
		return userDAO.getUserByUsername(username);
	}

	@Override
	@Transactional
	public void deleteUser(String username) {
		userDAO.deleteUser(username);

	}

	@Override
	@Transactional
	public void enableDisableUser(String username) {
		userDAO.enableDisableUser(username);

	}

	@Override
	@Transactional
	public List<User> getUsers(int page, int pageSize) {

		return userDAO.getUsers(page, pageSize);
	}

	@Override
	@Transactional
	public long getUserCount() {

		return userDAO.getUserCount();

	}

	@Override
	@Transactional
	public void saveUser(User user, List<String> roles, MultipartFile file, HttpServletRequest request) {

		User tempUser = userDAO.getUserByUsername(user.getUsername());

		if (tempUser == null) {
			createUser(user, roles, file, request);
		} else {
			updateUser(user, tempUser, roles, file, request);
		}
	}

	private void createUser(User user, List<String> roles, MultipartFile file, HttpServletRequest request) {

		String encoded = passwordEncoder.encode(user.getPassword());
		user.setPassword("{bcrypt}" + encoded);

		user.setEnabled(true);
		mapRoles(user, roles);

		if (file != null && !file.isEmpty()) {
			String fileName = MyUtil.saveImage(file, "users", request);
			user.setImage(fileName);
		}

		userDAO.saveOrUpdateUser(user);
	}

	private void updateUser(User user, User existingUser, List<String> roles, MultipartFile file,
			HttpServletRequest request) {

		user.setPassword(existingUser.getPassword());

		mapRoles(user, roles);

		if (file != null && !file.isEmpty()) {
			user.setImage(existingUser.getImage());
		} else {
			String fileName = MyUtil.saveImage(file, "users", request);
			user.setImage(fileName);
		}

		userDAO.saveOrUpdateUser(user);
	}

	private void mapRoles(User user, List<String> roles) {
		user.getAuthorities().clear();
		if (roles == null || roles.isEmpty()) {
			user.getAuthorities().add(new Role("ROLE_BLOGGER"));
		} else {
			for (String r : roles) {
				user.getAuthorities().add(new Role(r));
			}
		}
	}

	@Override
	@Transactional
	public void saveMyProfile(User user, MultipartFile file, HttpServletRequest request) {
		
	    User existingUser = userDAO.getUserByUsername(user.getUsername());

	  
	    existingUser.setName(user.getName());
	    existingUser.setSurname(user.getSurname());
	    existingUser.setEmail(user.getEmail());
	    existingUser.setPhone(user.getPhone());

	   
	    if (file != null && !file.isEmpty()) {
	        String fileName = MyUtil.saveImage(file, "users", request);
	        existingUser.setImage(fileName);
	    }
	   

	    userDAO.saveOrUpdateUser(existingUser);
		
	}

}
