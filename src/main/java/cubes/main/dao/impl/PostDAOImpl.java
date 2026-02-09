package cubes.main.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

		Query<?> query = session.createQuery("delete from Post where id = :postId");
		query.setParameter("postId", id);

		query.executeUpdate();

	}

	@Override
	public List<Post> search(PostSearch search) {

		StringBuilder hql = new StringBuilder("SELECT DISTINCT p FROM Post p LEFT JOIN FETCH p.comments WHERE 1=1");

		Map<String, Object> params = new HashMap<>();

		if (search.getTitle() != null && !search.getTitle().isEmpty()) {
			hql.append(" AND p.title LIKE :title");
			params.put("title", "%" + search.getTitle() + "%");
		}

		if (search.getCategoryId() != null) {
			hql.append(" AND p.category.id = :catId");
			params.put("catId", search.getCategoryId());
		}

		if (search.getAuthorId() != null) {
			hql.append(" AND p.user.id = :authId");
			params.put("authId", search.getAuthorId());
		}

		if (search.getEnabled() != null) {
			hql.append(" AND p.enabled = :enabled");
			params.put("enabled", search.getEnabled());
		}
		hql.append(" ORDER BY p.createdAt DESC");

		Query<Post> query = sessionFactory.getCurrentSession().createQuery(hql.toString(), Post.class);

		for (Map.Entry<String, Object> entry : params.entrySet()) {
			query.setParameter(entry.getKey(), entry.getValue());
		}

		return query.getResultList();
	}

	@Override
	public Post getPostByUrlSeo(String title) {

		Session session = sessionFactory.getCurrentSession();

		Query<Post> seoUrl = session.createQuery("FROM Post p WHERE p.seoUrl = :seoUrl", Post.class);

		seoUrl.setParameter("seoUrl", title);
		return seoUrl.uniqueResult();
	}

	@Override
	public Long getPostCount() {

		Session session = sessionFactory.getCurrentSession();

		Query<Long> query = session.createQuery("SELECT COUNT(p) FROM Post p", Long.class);

		return query.getSingleResult();

	}

	@Override
	public List<Post> getRecentPosts(int limit) {

		Session session = sessionFactory.getCurrentSession();

		Query<Post> query = session.createQuery("FROM Post p ORDER BY p.createdAt DESC", Post.class);

		query.setMaxResults(limit);

		return query.getResultList();
	}

}
