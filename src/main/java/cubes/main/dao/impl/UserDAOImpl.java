package cubes.main.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import cubes.main.dao.UserDAO;
import cubes.main.entity.User;

@Repository
public class UserDAOImpl implements UserDAO {

	private final SessionFactory sessionFactory;

	@Autowired
	public UserDAOImpl(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public List<User> getUsers() {
		List<User> userList = sessionFactory.getCurrentSession().createQuery("from User", User.class).getResultList();

		return userList;
	}

	@Override
	public void saveOrUpdateUser(User user) {
		sessionFactory.getCurrentSession().merge(user);

	}

	@Override
	public User getUserByUsername(String username) {
		User user = sessionFactory.getCurrentSession().get(User.class, username);

		return user;
	}

	@Override
	public void deleteUser(String username) {
		Session session = sessionFactory.getCurrentSession();

		Query<?> query = session.createQuery("delete from User where authority = :usernameId");
		query.setParameter("usernameId", username);

		query.executeUpdate();

	}

	@Override
	public void enableDisableUser(String username) {

		Session session = sessionFactory.getCurrentSession();
		User user = session.get(User.class, username);

		user.setEnabled(!user.isEnabled());

		session.saveOrUpdate(user);
	}

	@Override
	public List<User> getUsers(int page, int pageSize) {
		Session session = sessionFactory.getCurrentSession();

		int start = (page - 1) * pageSize;

		Query<User> query = session.createQuery("from User", User.class);

		query.setFirstResult(start);
		query.setMaxResults(pageSize);

		return query.getResultList();
	}

	@Override
	public long getUserCount() {
		Session session = sessionFactory.getCurrentSession();
		
		long countUser = (long) session.createQuery("select count(u) from User u").uniqueResult();
		
		return countUser;
	}

}
