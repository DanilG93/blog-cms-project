package cubes.main.dao;

import java.util.List;

import cubes.main.dto.PostSearch;
import cubes.main.entity.Post;

public interface PostDAO {

	public List<Post> getPosts();

	public List<Post> getEnabledPosts(int page, int pageSize);

	public List<Post> search(PostSearch postSearch);

	public List<Post> search(PostSearch search, int page, int pageSize);

	public long countSearch(PostSearch search);

	public void saveOrUpdatePost(Post post);

	public Post getPostById(Integer id);

	public void deletePost(Integer id);

	public Post getPostByUrlSeo(String title);

	public long getEnabledPostCount();

	public Long getPostCount();

	public List<Post> getRecentPosts(int limit);

	public List<Post> getImportantPosts(int limit);
	
	public List<Post> getMostViewedPosts(int limit);

	Post getPreviousPost(int currentPostId);

	Post getNextPost(int currentPostId);

}
