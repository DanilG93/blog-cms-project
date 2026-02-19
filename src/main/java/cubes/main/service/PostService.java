package cubes.main.service;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import cubes.main.dto.PostSearch;
import cubes.main.entity.Post;

public interface PostService {

	public List<Post> getPosts();
	
	public List<Post> getEnabledPosts(int page, int pageSize);

	public void saveOrUpdatePost(Post post);

	public Post getPostById(Integer id);
	
	public Post getPostByUrlSeo(String title);

	public void deletePost(Integer id);

	public void changeImportant(Integer id);

	public void changeEnabled(Integer id);

	public List<Post> search(PostSearch search);
	
	public List<Post> search(PostSearch search, int page, int pageSize);
	
	public long countSearch(PostSearch search);

	public long getEnabledPostCount();
	
	public Long getPostCount();

	public List<Post> getRecentPosts(int limit);
	
	public List<Post> getImportantPosts(int limit);

	public void savePost(Post post, MultipartFile file, HttpServletRequest request, Principal principal);

}
