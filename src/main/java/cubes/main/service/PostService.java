package cubes.main.service;

import java.util.List;

import cubes.main.dto.PostSearch;
import cubes.main.entity.Post;

public interface PostService {
	
	public List<Post> getPosts();

	public void saveOrUpdatePost(Post post);

	public Post getPostById(Integer id);

	public void deletePost(Integer id);
	
	public void changeImportant(Integer id);
	
	public void changeEnabled(Integer id);
	
	public List<Post> search(PostSearch search);
	
	public Long getPostCount();
	
	public List<Post> getRecentPosts(int limit);

}
