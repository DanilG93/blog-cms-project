package cubes.main.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.Hibernate;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;

import cubes.main.dao.PostDAO;
import cubes.main.dto.PostSearch;
import cubes.main.entity.Post;

@Repository
public class PostDAOImpl implements PostDAO {

	private final SessionFactory sessionFactory;

	public PostDAOImpl(SessionFactory sessionFactory) {

		this.sessionFactory = sessionFactory;

	}

	@Override
	public List<Post> getPosts() {

		List<Post> postList = sessionFactory.getCurrentSession()
				.createQuery("SELECT DISTINCT p FROM Post p LEFT JOIN FETCH p.comments", Post.class).getResultList();

		return postList;
	}

	@Override
	public List<Post> getEnabledPosts(int page, int pageSize) {

		Session session = sessionFactory.getCurrentSession();

		
		String hql = 
		"SELECT DISTINCT p FROM Post p " +
		"LEFT JOIN FETCH p.user " +
		"LEFT JOIN FETCH p.category " +
//		"LEFT JOIN FETCH p.comments " +
		"WHERE p.enabled = true " + 
		"ORDER BY p.createdAt DESC";

		Query<Post> query = session.createQuery(hql, Post.class);

		
		query.setFirstResult((page - 1) * pageSize);
		query.setMaxResults(pageSize);

		return query.getResultList();
	}

	@Override
	public void saveOrUpdatePost(Post post) {

		sessionFactory.getCurrentSession().merge(post);

	}

	@Override
	public Post getPostById(Integer id) {

		Post post = sessionFactory.getCurrentSession().get(Post.class, id);

		return post;
	}

	@Override
	public void deletePost(Integer id) {

		Session session = sessionFactory.getCurrentSession();

		Post post = session.get(Post.class, id);

		if (post != null) {
			session.delete(post);
		}

	}

	@Override
	public List<Post> search(PostSearch search) {

		Session session = sessionFactory.getCurrentSession();

		StringBuilder hql = new StringBuilder("SELECT DISTINCT p FROM Post p LEFT JOIN FETCH p.comments WHERE 1=1");

		Map<String, Object> params = new HashMap<>();

		buildSearchCriteria(hql, params, search);

		hql.append(" ORDER BY p.createdAt DESC");

		Query<Post> query = session.createQuery(hql.toString(), Post.class);

		for (Map.Entry<String, Object> entry : params.entrySet()) {
			query.setParameter(entry.getKey(), entry.getValue());
		}

		return query.getResultList();
	}

	@Override
	public List<Post> search(PostSearch search, int page, int pageSize) {

		Session session = sessionFactory.getCurrentSession();

		StringBuilder hql = new StringBuilder("SELECT DISTINCT p FROM Post p WHERE 1=1");
		Map<String, Object> params = new HashMap<>();

		buildSearchCriteria(hql, params, search);

		hql.append(" ORDER BY p.createdAt DESC");

		Query<Post> query = session.createQuery(hql.toString(), Post.class);

		for (Map.Entry<String, Object> entry : params.entrySet()) {
			query.setParameter(entry.getKey(), entry.getValue());
		}

		query.setFirstResult((page - 1) * pageSize);
		query.setMaxResults(pageSize);

		return query.getResultList();
	}

	@Override
	public long countSearch(PostSearch search) {

		Session session = sessionFactory.getCurrentSession();

		StringBuilder hql = new StringBuilder("SELECT COUNT(DISTINCT p.id) FROM Post p WHERE 1=1");
		Map<String, Object> params = new HashMap<>();

		buildSearchCriteria(hql, params, search);

		Query<Long> query = session.createQuery(hql.toString(), Long.class);

		for (Map.Entry<String, Object> entry : params.entrySet()) {
			query.setParameter(entry.getKey(), entry.getValue());
		}

		return query.uniqueResult();
	}

	private void buildSearchCriteria(StringBuilder hql, Map<String, Object> params, PostSearch search) {

		if (search.getText() != null && !search.getText().isEmpty()) {
			hql.append(" AND (p.title LIKE :term OR p.description LIKE :term OR p.content LIKE :term)");
			params.put("term", "%" + search.getText() + "%");
		}

		if (search.getCategoryId() != null) {
			hql.append(" AND p.category.id = :catId");
			params.put("catId", search.getCategoryId());
		}
		
		if (search.getTagId() != null) { 
		    hql.append(" AND :tagId IN (SELECT t.id FROM p.tags t)");
		    params.put("tagId", search.getTagId());
		}

		if (search.getAuthorUsername() != null && !search.getAuthorUsername().isEmpty()) {
			hql.append(" AND p.user.username = :authUsername");
			params.put("authUsername", search.getAuthorUsername());
		}

		if (search.getEnabled() != null) {
			hql.append(" AND p.enabled = :enabled");
			params.put("enabled", search.getEnabled());
		}
	}

	@Override
	public Post getPostByUrlSeo(String title) {

		Session session = sessionFactory.getCurrentSession();

		Query<Post> seoUrl = session.createQuery("FROM Post p WHERE p.seoUrl = :seoUrl", Post.class);

		seoUrl.setParameter("seoUrl", title);
		
		Post post = seoUrl.uniqueResult();
		
		if (post != null) {
	        Hibernate.initialize(post.getComments());

	    }
		
		
		return post;
	}

	@Override
	public Long getPostCount() {

		Session session = sessionFactory.getCurrentSession();

		Query<Long> query = session.createQuery("SELECT COUNT(p) FROM Post p", Long.class);

		return query.getSingleResult();

	}
	
	@Override
	public long getEnabledPostCount() {

        Session session = sessionFactory.getCurrentSession();
		
		Query<Long> query = session.createQuery("SELECT COUNT(p) FROM Post p WHERE p.enabled = true", Long.class);
		
		return query.getSingleResult();

	}

	@Override
	public List<Post> getRecentPosts(int limit) {

	    Session session = sessionFactory.getCurrentSession();

	   
	    String hql = "SELECT DISTINCT p FROM Post p " 
	               + "LEFT JOIN FETCH p.user " 
	               + "LEFT JOIN FETCH p.category " 
//	               + "LEFT JOIN FETCH p.comments " 
	               + "WHERE p.enabled = true " 
	               + "ORDER BY p.createdAt DESC";

	    Query<Post> query = session.createQuery(hql, Post.class);

	    query.setMaxResults(limit);

	    return query.getResultList();
	}

	@Override
	public List<Post> getImportantPosts(int limit) {

		String hql = "SELECT DISTINCT p FROM Post p " 
				+ "JOIN FETCH p.user "
				+ "JOIN FETCH p.category "
//				+ "LEFT JOIN FETCH p.comments " 
				+ "WHERE p.enabled = :enabled " 
				+ "AND p.important = :important "
				+ "ORDER BY p.createdAt DESC";

		Session session = sessionFactory.getCurrentSession();

		Query<Post> query = session.createQuery(hql, Post.class);

		query.setParameter("enabled", true);
		query.setParameter("important", true);

		query.setMaxResults(limit);

		return query.getResultList();
	}

}
