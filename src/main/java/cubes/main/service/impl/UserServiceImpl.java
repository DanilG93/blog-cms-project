package cubes.main.service.impl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import cubes.main.dao.UserDAO;
import cubes.main.dto.PasswordDTO;
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
		user.setPassword(encoded);

		user.setEnabled(true);
		mapRoles(user, roles);

		if (file != null && !file.isEmpty()) {
			user.setImage(MyUtil.saveImage(file, "users", request));
		}
		user = generateSeoUrlForPost(user);
		userDAO.saveOrUpdateUser(user);
	}

	private void updateUser(User user, User existingUser, List<String> roles, MultipartFile file,
			HttpServletRequest request) {

		existingUser.setName(user.getName());
		existingUser.setSurname(user.getSurname());
		existingUser.setEmail(user.getEmail());
		existingUser.setPhone(user.getPhone());
		existingUser.setEnabled(user.isEnabled());

		mapRoles(existingUser, roles);

		if (file != null && !file.isEmpty()) {
			existingUser.setImage(MyUtil.saveImage(file, "users", request));
		}
		existingUser = generateSeoUrlForPost(existingUser);
		userDAO.saveOrUpdateUser(existingUser);
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
		existingUser = generateSeoUrlForPost(existingUser);
		userDAO.saveOrUpdateUser(existingUser);

	}

	@Override
	@Transactional
	public boolean changePassword(String username, PasswordDTO passwordDTO) {

		User user = userDAO.getUserByUsername(username);

		String dbPassword = user.getPassword();

		if (!passwordEncoder.matches(passwordDTO.getOldPassword(), dbPassword)) {
			return false;
		}

		if (!passwordDTO.getNewPassword().equals(passwordDTO.getConfirmPassword())) {
			return false;
		}

		String encodedPasswordString = passwordEncoder.encode(passwordDTO.getNewPassword());
		user.setPassword(encodedPasswordString);

		return true;
	}

	@Override
	@Transactional
	public User getUserByUrlSeo(String title) {

		return userDAO.getUserByUrlSeo(title);
	}

	private User generateSeoUrlForPost(User user) {

		String fullName = user.getName().trim();

		if (user.getSurname() != null && !user.getSurname().trim().isEmpty()) {
			fullName += " " + user.getSurname().trim();
		}

		String baseSeoUrl = MyUtil.generateSeoUrl(fullName);
		String finalSeoUrl = baseSeoUrl;
		int counter = 1;

		while (userDAO.getUserByUrlSeo(finalSeoUrl) != null) {
			User existingUser = userDAO.getUserByUrlSeo(finalSeoUrl);

			if (user.getUsername() != null && user.getUsername().equals(existingUser.getUsername())) {
				break;
			}

			finalSeoUrl = baseSeoUrl + "-" + (counter++);
		}

		user.setSeoUrl(finalSeoUrl);

		return user;

	}

}
