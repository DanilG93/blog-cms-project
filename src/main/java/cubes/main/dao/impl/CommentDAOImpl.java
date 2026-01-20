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
		List<Comment> commentList = sessionFactory.getCurrentSession().createQuery("from Comment", Comment.class)
				.getResultList();

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

}
