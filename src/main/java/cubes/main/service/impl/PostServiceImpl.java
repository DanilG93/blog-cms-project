package cubes.main.service.impl;

import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cubes.main.dao.PostDAO;
import cubes.main.dao.TagDAO;
import cubes.main.dto.PostSearch;
import cubes.main.entity.Post;
import cubes.main.entity.Tag;
import cubes.main.service.PostService;
import cubes.main.util.MyUtil;

@Service
public class PostServiceImpl implements PostService {

	@Autowired
	private PostDAO postDAO;

	@Autowired
	private TagDAO tagDAO;

	@Override
	@Transactional
	public List<Post> getPosts() {
		return postDAO.getPosts();
	}

	@Override
	@Transactional
	public void saveOrUpdatePost(Post post) {

		if (post.getTags() != null) {
			Set<Tag> persistTags = new LinkedHashSet<>();
			for (Tag t : post.getTags()) {
				Tag fullTag = tagDAO.getTagById(t.getId());
				persistTags.add(fullTag);
			}
			post.setTags(persistTags);
		}

		post = generateSeoUrlForPost(post);

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

	@Transactional
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

	@Override
	@Transactional
	public Long getPostCount() {

		return postDAO.getPostCount();

	}

	@Override
	@Transactional
	public List<Post> getRecentPosts(int limit) {

		return postDAO.getRecentPosts(limit);
	}

}
