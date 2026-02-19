package cubes.main.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import cubes.main.dao.CategoryDAO;
import cubes.main.entity.Category;

@Repository
public class CategoryDAOImpl implements CategoryDAO {

	private final SessionFactory sessionFactory;

	@Autowired
	public CategoryDAOImpl(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public List<Category> getCategories() {

		String hql = 
				"SELECT DISTINCT c FROM Category c " +
                "LEFT JOIN FETCH c.posts " +
                "ORDER BY c.displayOrder";

			List<Category> categoryList = sessionFactory.getCurrentSession()
           .createQuery(hql, Category.class)
           .getResultList();

   return categoryList;
	}

	@Override
	public void saveOrUpdateCategory(Category category) {

		sessionFactory.getCurrentSession().merge(category);

	}

	@Override
	public Category getCategoryById(Integer id) {

		Category category = sessionFactory.getCurrentSession().get(Category.class, id);

		return category;
	}

	@Override
	public void deleteCategory(Integer id) {
		Session session = sessionFactory.getCurrentSession();

		Category category = session.get(Category.class, id);

		if (category != null) {
			session.delete(category);
		}

	}

	@Override
	public Integer getMaxDisplayOrder() {
		Session session = sessionFactory.getCurrentSession();

		Query<Integer> query = session.createQuery("SELECT MAX(c.displayOrder) FROM Category c", Integer.class);

		return query.getSingleResult();
	}

	@Override
	public Category getCategoryByUrlSeo(String title) {

		Session session = sessionFactory.getCurrentSession();

		Query<Category> seoUrl = session.createQuery("FROM Category c WHERE c.seoUrl = :seoUrl", Category.class);

		seoUrl.setParameter("seoUrl", title);
		return seoUrl.uniqueResult();

	}

	@Override
	public void shiftDisplayOrders(int deletedOrder) {
		Session session = sessionFactory.getCurrentSession();

		String hql = "UPDATE Category c SET c.displayOrder = c.displayOrder - 1 "
				+ "WHERE c.displayOrder > :deletedOrder";

		Query<?> query = session.createQuery(hql);
		query.setParameter("deletedOrder", deletedOrder);

		query.executeUpdate();

	}

	@Override
	public Long getCategoryCount() {
		Session session = sessionFactory.getCurrentSession();

		Query<Long> query = session.createQuery("SELECT COUNT(c) FROM Category c", Long.class);

		return query.getSingleResult();
	}

	@Override
	public Category getCategoryByName(String name) {
		Session session = sessionFactory.getCurrentSession();
		Query<Category> query = session.createQuery("from Category where name = :name", Category.class);
		query.setParameter("name", name);
		return query.uniqueResult();
	}

}
