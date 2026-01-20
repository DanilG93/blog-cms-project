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

}
