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

		List<Category> categoyList = sessionFactory.getCurrentSession().createQuery("from Category", Category.class)
				.getResultList();

		return categoyList;
	}

	@Override
	public void saveOrUpdateCategory(Category category) {

		sessionFactory.getCurrentSession().saveOrUpdate(category);

	}

	@Override
	public Category getCategoryById(Integer id) {

		Category category = sessionFactory.getCurrentSession().get(Category.class, id);

		return category;
	}

	@Override
	public void deleteCategory(Integer id) {

		Session session = sessionFactory.getCurrentSession();

		Query<?> query = session.createQuery("delete from Category where id = :categoryId");
		query.setParameter("categoryId", id);

		query.executeUpdate();

	}

}
