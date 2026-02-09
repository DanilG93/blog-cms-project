package cubes.main.service;

import java.util.List;

import cubes.main.entity.Comment;

public interface CommentService {

	public List<Comment> getComments();

	public void saveOrUpdateComment(Comment comment);

	public Comment getCommentById(Integer id);

	public void deleteComment(Integer id);

	public List<Comment> getCommentsByPostId(Integer postId);

	public Long getUnreadCommentCount();
	
	public boolean hasUnreadComment();
	
	public void markAllAsRead();
	
	public void toggleCommentStatus(Integer id);
	
	public Long getTotalCommentCount();

}
