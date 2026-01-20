package cubes.main.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;

import cubes.main.dao.RoleDAO;
import cubes.main.entity.Role;

@Repository
public class RoleDAOImpl implements RoleDAO {

	private final SessionFactory sessionFactory;

	public RoleDAOImpl(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public List<Role> getRoles() {
		List<Role> roleList = sessionFactory.getCurrentSession().createQuery("from Role", Role.class).getResultList();

		return roleList;
	}

	@Override
	public void saveOrUpdateRole(Role role) {
		sessionFactory.getCurrentSession().saveOrUpdate(role);

	}

	@Override
	public Role getRoleByAuthority(String authority) {

		Role role = sessionFactory.getCurrentSession().get(Role.class, authority);

		return role;
	}

	@Override
	public void deleteRole(String authority) {
		Session session = sessionFactory.getCurrentSession();

		Query<?> query = session.createQuery("delete from Role where authority = :authorityId");
		query.setParameter("authorityId", authority);

		query.executeUpdate();

	}

}
