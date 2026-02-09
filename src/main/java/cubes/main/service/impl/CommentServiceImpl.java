package cubes.main.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cubes.main.dao.CommentDAO;
import cubes.main.entity.Comment;
import cubes.main.service.CommentService;

@Service
public class CommentServiceImpl implements CommentService {

	@Autowired
	private CommentDAO commentDAO;

	@Override
	@Transactional
	public List<Comment> getComments() {
		return commentDAO.getComments();
	}

	@Override
	@Transactional
	public void saveOrUpdateComment(Comment comment) {
		commentDAO.saveOrUpdateComment(comment);

	}

	@Override
	@Transactional
	public Comment getCommentById(Integer id) {
		return commentDAO.getCommentById(id);
	}

	@Override
	@Transactional
	public void deleteComment(Integer id) {
		commentDAO.deleteComment(id);

	}

	@Override
	@Transactional
	public List<Comment> getCommentsByPostId(Integer postId) {

		return commentDAO.getCommentsByPostId(postId);
	}

	@Override
	@Transactional
	public Long getUnreadCommentCount() {
		return commentDAO.getUnreadCommentCount();
	}

	@Override
	@Transactional
	public boolean hasUnreadComment() {
		if (getUnreadCommentCount() > 0) {
			return true;
		}
		return false;
	}

	@Override
	@Transactional
	public void markAllAsRead() {
		commentDAO.markAllAsRead();

	}

	@Override
	@Transactional
	public void toggleCommentStatus(Integer id) {

		Comment comment = commentDAO.getCommentById(id);

		comment.setIsEnabled(!comment.getIsEnabled());

		commentDAO.saveOrUpdateComment(comment);

	}

	@Override
	@Transactional
	public Long getTotalCommentCount() {
		
		return commentDAO.getTotalCommentCount();
	}

}
