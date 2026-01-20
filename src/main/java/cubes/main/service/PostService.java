package cubes.main.service;

import java.util.List;

import cubes.main.entity.Post;

public interface PostService {
	
	public List<Post> getPosts();

	public void saveOrUpdatePost(Post post);

	public Post getPostById(Integer id);

	public void deletePost(Integer id);

}
