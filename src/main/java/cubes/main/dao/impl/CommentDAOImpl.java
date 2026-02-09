package cubes.main.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import cubes.main.dao.CommentDAO;
import cubes.main.entity.Comment;

@Repository
public class CommentDAOImpl implements CommentDAO {

	private final SessionFactory sessionFactory;

	@Autowired
	public CommentDAOImpl(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public List<Comment> getComments() {
		List<Comment> commentList = sessionFactory.getCurrentSession()
				.createQuery("from Comment c order by c.createdAt desc", Comment.class).getResultList();

		return commentList;
	}

	@Override
	public void saveOrUpdateComment(Comment comment) {
		sessionFactory.getCurrentSession().saveOrUpdate(comment);

	}

	@Override
	public Comment getCommentById(Integer id) {
		Comment comment = sessionFactory.getCurrentSession().get(Comment.class, id);

		return comment;
	}

	@Override
	public void deleteComment(Integer id) {
		Session session = sessionFactory.getCurrentSession();

		Query<?> query = session.createQuery("delete from Comment where id = :commentId");
		query.setParameter("commentId", id);

		query.executeUpdate();

	}

	@Override
	public List<Comment> getCommentsByPostId(Integer postId) {
		Session session = sessionFactory.getCurrentSession();

		Query<Comment> query = session
				.createQuery("FROM Comment c WHERE c.post.id = :thePostId ORDER BY c.createdAt DESC", Comment.class);
		query.setParameter("thePostId", postId);

		return query.getResultList();
	}

	@Override
	public Long getUnreadCommentCount() {
		Session session = sessionFactory.getCurrentSession();

		Query<Long> query = session.createQuery("SELECT COUNT(c) FROM Comment c WHERE isRead = false", Long.class);

		return query.getSingleResult();
	}

	@Override
	public void markAllAsRead() {
		Session session = sessionFactory.getCurrentSession();

		Query<?> query = session.createQuery("UPDATE Comment c SET c.isRead = true WHERE c.isRead = false");

		query.executeUpdate();
	}

	@Override
	public Long getTotalCommentCount() {
		Session session = sessionFactory.getCurrentSession();

		Query<Long> query = session.createQuery("SELECT COUNT(c) FROM Comment c", Long.class);

		return query.getSingleResult();
	}

}
