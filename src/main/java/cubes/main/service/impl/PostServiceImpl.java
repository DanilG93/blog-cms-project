package cubes.main.service.impl;

import java.security.Principal;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.hibernate.Hibernate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import cubes.main.dao.CategoryDAO;
import cubes.main.dao.PostDAO;
import cubes.main.dao.TagDAO;
import cubes.main.dao.UserDAO;
import cubes.main.dto.PostSearch;
import cubes.main.entity.Category;
import cubes.main.entity.Post;
import cubes.main.entity.Tag;
import cubes.main.entity.User;
import cubes.main.service.PostService;
import cubes.main.util.MyUtil;

@Service
public class PostServiceImpl implements PostService {

	@Autowired
	private PostDAO postDAO;

	@Autowired
	private TagDAO tagDAO;

	@Autowired
	private CategoryDAO categoryDAO;

	@Autowired
	private UserDAO userDAO;

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
	public Post getPostByUrlSeo(String title) {
		
		return postDAO.getPostByUrlSeo(title);
	}

	@Override
	@Transactional
	public void deletePost(Integer id) {
		postDAO.deletePost(id);

	}

	@Override
	@Transactional
	public void changeImportant(Integer id) {

		Post post = postDAO.getPostById(id);
		post.setImportant(!post.getImportant());
		postDAO.saveOrUpdatePost(post);

	}

	@Override
	@Transactional
	public void changeEnabled(Integer id) {
		Post post = postDAO.getPostById(id);
		post.setEnabled(!post.getEnabled());
		postDAO.saveOrUpdatePost(post);

	}

	@Override
	@Transactional
	public List<Post> search(PostSearch search) {

		return postDAO.search(search);
	}

	@Override
	@Transactional
	public long getEnabledPostCount() {

		return postDAO.getEnabledPostCount();

	}

	@Override
	@Transactional
	public List<Post> getEnabledPosts(int page, int pageSize) {

		List<Post> posts = postDAO.getEnabledPosts(page, pageSize);

		for (Post post : posts) {
			Hibernate.initialize(post.getComments());
		}

		return posts;
	}

	@Override
	@Transactional
	public Long getPostCount() {

		return postDAO.getPostCount();
	}

	@Override
	@Transactional
	public List<Post> getRecentPosts(int limit) {

		List<Post> posts = postDAO.getRecentPosts(limit);

		for (Post post : posts) {
			Hibernate.initialize(post.getComments());
		}

		return posts;
	}

	@Override
	@Transactional
	public List<Post> getImportantPosts(int limit) {
		List<Post> posts = postDAO.getImportantPosts(limit);

		for (Post post : posts) {
			Hibernate.initialize(post.getComments());
		}

		return posts;
	}

	@Override
	@Transactional
	public List<Post> search(PostSearch search, int page, int pageSize) {

		List<Post> posts = postDAO.search(search, page, pageSize);

		for (Post post : posts) {
			Hibernate.initialize(post.getComments());
		}

		return posts;
	}

	@Override
	@Transactional
	public long countSearch(PostSearch search) {

		return postDAO.countSearch(search);
	}

	@Override
	@Transactional
	public void savePost(Post post, MultipartFile file, HttpServletRequest request, Principal principal) {

		handleCategory(post);
		handleTags(post);

		if (post.getId() == null) {
			createPost(post, file, request, principal);
		} else {
			updatePost(post, file, request);
		}

		post = generateSeoUrlForPost(post);
		postDAO.saveOrUpdatePost(post);

	}

	private void createPost(Post post, MultipartFile file, HttpServletRequest request, Principal principal) {

		if (file != null && !file.isEmpty()) {
			String fileName = MyUtil.saveImage(file, "posts", request);
			post.setImage(fileName);
		}

		String username = principal.getName();
		User author = userDAO.getUserByUsername(username);
		post.setUser(author);

	}

	private void updatePost(Post post, MultipartFile file, HttpServletRequest request) {

		Post existingPost = postDAO.getPostById(post.getId());

		if (file != null && !file.isEmpty()) {
			String fileName = MyUtil.saveImage(file, "posts", request);
			post.setImage(fileName);
		} else {
			post.setImage(existingPost.getImage());
		}

		post.setUser(existingPost.getUser());
		post.setViewCount(existingPost.getViewCount());

	}

	private void handleCategory(Post post) {

		if (post.getCategory() != null && post.getCategory().getId() != null) {

			Category category = categoryDAO.getCategoryById(post.getCategory().getId());
			post.setCategory(category);
		} else {
			post.setCategory(null);
		}
	}

	private void handleTags(Post post) {

		if (post.getTags() != null) {
			Set<Tag> persistTags = new LinkedHashSet<>();
			for (Tag t : post.getTags()) {
				Tag fullTag = tagDAO.getTagById(t.getId());
				persistTags.add(fullTag);
			}
			post.setTags(persistTags);
		}
	}

	private Post generateSeoUrlForPost(Post post) {

		String baseSeoUrl = MyUtil.generateSeoUrl(post.getTitle());
		String finalSeoUrl = baseSeoUrl;
		int counter = 1;

		while (postDAO.getPostByUrlSeo(finalSeoUrl) != null) {
			Post existingSeoUrl = postDAO.getPostByUrlSeo(finalSeoUrl);

			if (post.getId() != null && post.getId().equals(existingSeoUrl.getId())) {
				break;
			}
			finalSeoUrl = baseSeoUrl + "-" + (counter++);
		}

		post.setSeoUrl(finalSeoUrl);

		return post;

	}

}
