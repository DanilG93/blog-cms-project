package cubes.main.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;

import cubes.main.dao.PostDAO;
import cubes.main.entity.Post;

@Repository
public class PostDAOImpl implements PostDAO {

	private final SessionFactory sessionFactory;

	public PostDAOImpl(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public List<Post> getPosts() {
		List<Post> postList = sessionFactory.getCurrentSession().createQuery("from Post", Post.class).getResultList();

		return postList;
	}

	@Override
	public void saveOrUpdatePost(Post post) {
		sessionFactory.getCurrentSession().saveOrUpdate(post);

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

}
