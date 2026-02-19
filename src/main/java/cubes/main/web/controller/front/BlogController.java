package cubes.main.web.controller.front;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import cubes.main.dto.PostSearch;
import cubes.main.entity.Category;
import cubes.main.entity.Post;
import cubes.main.entity.Tag;
import cubes.main.entity.User;
import cubes.main.service.CategoryService;
import cubes.main.service.PostService;
import cubes.main.service.TagService;
import cubes.main.service.UserService;
import cubes.main.util.MyUtil;

@Controller
@RequestMapping("/")
public class BlogController {

	@Autowired
	private CategoryService categoryService;
	@Autowired
	private TagService tagService;
	@Autowired
	private PostService postService;
	@Autowired
	private UserService userService;

	@GetMapping("/blog")
	public String showBlogPage(@RequestParam(name = "page", defaultValue = "1") int page, Model model) {

		int pageSize = 4;

		model.addAttribute("posts", postService.getEnabledPosts(page, pageSize));

		long totalPosts = postService.getEnabledPostCount();
		int totalPages = (int) Math.ceil((double) totalPosts / pageSize);

		model.addAttribute("currentPage", page);
		model.addAttribute("totalPages", totalPages);

		return "front/blog";
	}

	@GetMapping("/blog-post/{postSeoUrl}")
	public String showCategoryPosts(@PathVariable String postSeoUrl, Model model) {

		Post post = postService.getPostByUrlSeo(postSeoUrl);

		String postForSearch = postSeoUrl.replace("-", " ");

		if (post == null) {
			model.addAttribute("postForSearch", postForSearch);
			return "front/blog-post";
		}

		post.setViewCount(post.getViewCount() + 1);
		postService.saveOrUpdatePost(post);

		model.addAttribute("post", post);

		return "front/blog-post";
	}

	@GetMapping("/search-handler")
	public String handleSearch(@RequestParam("term") String term) {

		if (term == null || term.trim().isEmpty()) {
			return "redirect:/blog";
		}

		String seoSlug = MyUtil.generateSeoUrl(term);

		return "redirect:/blog-search/" + seoSlug;
	}

	@GetMapping("/blog-search/{term}")
	public String showSearchResults(@PathVariable String term,
			@RequestParam(required = false, defaultValue = "1") int page, Model model) {

		int pageSize = 4;
		String textForSearch = term.replace("-", " ");

		PostSearch search = new PostSearch();
		search.setText(textForSearch);
		search.setEnabled(true);

		List<Post> posts = postService.search(search, page, pageSize);

		long totalPosts = postService.countSearch(search);
		long totalPages = (long) Math.ceil((double) totalPosts / pageSize);

		model.addAttribute("posts", posts);
		model.addAttribute("searchTerm", textForSearch);
		model.addAttribute("urlTerm", term);
		model.addAttribute("currentPage", page);
		model.addAttribute("totalPages", totalPages);

		return "front/blog-search";
	}

	@GetMapping("/blog-category/{catSeoUrl}")
	public String showCategoryPosts(@PathVariable String catSeoUrl,
			@RequestParam(required = false, defaultValue = "1") int page, Model model) {

		Category category = categoryService.getCategoryByUrlSeo(catSeoUrl);

		String categoryForSearch = catSeoUrl.replace("-", " ");

		if (category == null) {
			model.addAttribute("categoryForSearch", categoryForSearch);
			return "front/blog-category";
		}

		int pageSize = 12;

		PostSearch search = new PostSearch();
		search.setCategoryId(category.getId());
		search.setEnabled(true);

		List<Post> posts = postService.search(search, page, pageSize);

		long totalPosts = postService.countSearch(search);
		long totalPages = (long) Math.ceil((double) totalPosts / pageSize);

		model.addAttribute("category", category);
		model.addAttribute("posts", posts);
		model.addAttribute("currentPage", page);
		model.addAttribute("totalPages", totalPages);

		return "front/blog-category";
	}

	@GetMapping("/blog-author/{authorSeoUrl}")
	public String showAuthorPosts(@PathVariable String authorSeoUrl,
			@RequestParam(required = false, defaultValue = "1") int page, Model model) {

		User user = userService.getUserByUrlSeo(authorSeoUrl);

		String authorForSearch = authorSeoUrl.replace("-", " ");

		if (user == null) {
			model.addAttribute("authorForSearch", authorForSearch);
			return "front/blog-author";
		}

		int pageSize = 12;

		PostSearch search = new PostSearch();
		search.setAuthorUsername(user.getUsername());
		search.setEnabled(true);

		List<Post> posts = postService.search(search, page, pageSize);

		long totalPosts = postService.countSearch(search);
		long totalPages = (long) Math.ceil((double) totalPosts / pageSize);

		model.addAttribute("author", user);
		model.addAttribute("posts", posts);
		model.addAttribute("currentPage", page);
		model.addAttribute("totalPages", totalPages);

		return "front/blog-author";
	}

	@GetMapping("/blog-tag/{tagSeoUrl}")
	public String showTagPosts(@PathVariable String tagSeoUrl,
			@RequestParam(required = false, defaultValue = "1") int page, Model model) {

		Tag tag = tagService.getTagByUrlSeo(tagSeoUrl);

		String tagForSearch = tagSeoUrl.replace("-", " ");

		if (tag == null) {
			model.addAttribute("tagForSearch", tagForSearch);
			return "front/blog-tag";
		}

		int pageSize = 12;

		PostSearch search = new PostSearch();
		search.setTagId(tag.getId());
		search.setEnabled(true);

		List<Post> posts = postService.search(search, page, pageSize);

		long totalPosts = postService.countSearch(search);
		long totalPages = (long) Math.ceil((double) totalPosts / pageSize);

		model.addAttribute("tag", tag);
		model.addAttribute("posts", posts);
		model.addAttribute("currentPage", page);
		model.addAttribute("totalPages", totalPages);

		return "front/blog-tag";
	}

	@ModelAttribute
	public void addCommonAttributes(Model model) {

		model.addAttribute("categories", categoryService.getCategories());
		model.addAttribute("latestPosts", postService.getRecentPosts(3));
		model.addAttribute("tags", tagService.getTags());
		model.addAttribute("firstThreeImportantPosts", postService.getImportantPosts(3));
	}

}
