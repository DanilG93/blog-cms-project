package cubes.main.dao;

import java.util.List;

import cubes.main.dto.PostSearch;
import cubes.main.entity.Post;

public interface PostDAO {

	public List<Post> getPosts();
	
	public List<Post> search(PostSearch postSearch);

	public void saveOrUpdatePost(Post post);

	public Post getPostById(Integer id);

	public void deletePost(Integer id);
	
	public Post getPostByUrlSeo(String title);
	
	

}
