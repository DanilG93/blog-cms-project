package cubes.main.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import cubes.main.dao.PostDAO;
import cubes.main.entity.Post;
import cubes.main.service.PostService;

public class PostServiceImpl implements PostService {

	@Autowired
	private PostDAO postDAO;

	@Override
	@Transactional
	public List<Post> getPosts() {
		return postDAO.getPosts();
	}

	@Override
	@Transactional
	public void saveOrUpdatePost(Post post) {
		postDAO.saveOrUpdatePost(post);

	}

	@Override
	@Transactional
	public Post getPostById(Integer id) {
		return postDAO.getPostById(id);
	}

	@Override
	@Transactional
	public void deletePost(Integer id) {
		postDAO.deletePost(id);

	}

}
