package cubes.main.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cubes.main.dao.UserDAO;
import cubes.main.entity.User;
import cubes.main.service.UserService;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDAO userDAO;

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
	public User getUserByname(String username) {
		return userDAO.getUserByname(username);
	}

	@Override
	@Transactional
	public void deleteUser(String username) {
		userDAO.deleteUser(username);

	}

}
