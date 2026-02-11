package cubes.main.web.controller.administration;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import cubes.main.dto.PostSearch;
import cubes.main.entity.Post;
import cubes.main.entity.Tag;
import cubes.main.service.CategoryService;
import cubes.main.service.PostService;
import cubes.main.service.TagService;
import cubes.main.service.UserService;

@Controller
@RequestMapping("/administration/posts")
public class PostController {

	@Autowired
	private PostService postService;

	@Autowired
	private CategoryService categoryService;

	@Autowired
	private UserService userService;

	@Autowired
	private TagService tagService;

	@InitBinder
	protected void initBinder(WebDataBinder binder) {
		binder.registerCustomEditor(Tag.class, new java.beans.PropertyEditorSupport() {
			@Override
			public void setAsText(String text) {
				if (text != null && !text.isEmpty()) {
					Tag tag = new Tag();
					tag.setId(Integer.parseInt(text));
					setValue(tag);
				}
			}
		});
	}

	@GetMapping("")
	public String getPostList(@ModelAttribute("postSearch") PostSearch postSearch, Model model) {

		List<Post> post = postService.search(postSearch);

		model.addAttribute("postList", post);
		model.addAttribute("categoryList", categoryService.getCategories());
		model.addAttribute("authorList", userService.getUsers());

		return "administration/post/post-list";
	}

	@GetMapping("/add")
	public String getPostForm(Model model) {

		model.addAttribute("post", new Post());
		model.addAttribute("categoryList", categoryService.getCategories());
		model.addAttribute("tagList", tagService.getTags());

		return "administration/post/post-form";
	}

	@PostMapping("/save")
	public String savePost(@Valid @ModelAttribute("post") Post post, BindingResult bindingResult,
			@RequestParam(value = "file", required = false) MultipartFile file, HttpServletRequest request,
			Principal principal, Model model) {

		if (bindingResult.hasErrors()) {

			model.addAttribute("categoryList", categoryService.getCategories());
			model.addAttribute("tagList", tagService.getTags());
			model.addAttribute("authorList", userService.getUsers());

			return "administration/post/post-form";
		}

		postService.savePost(post, file, request, principal);

		return "redirect:/administration/posts";
	}

	@GetMapping("/edit/{id}")
	public String getEditForm(@PathVariable("id") Integer id, Model model) {
		Post post = postService.getPostById(id);
		model.addAttribute("post", post);
		model.addAttribute("categoryList", categoryService.getCategories());
		model.addAttribute("tagList", tagService.getTags());
		model.addAttribute("authorList", userService.getUsers());
		return "administration/post/post-form";
	}

	@GetMapping("/toggle-important/{id}")
	public String togleToChangeImpotrant(@PathVariable("id") Integer id) {

		postService.changeImportant(id);

		return "redirect:/administration/posts";
	}

	@GetMapping("/toggle-enabled/{id}")
	public String togleToChangeEnabled(@PathVariable("id") Integer id) {

		postService.changeEnabled(id);

		return "redirect:/administration/posts";
	}

	@PostMapping("/delete")
	public String deletePost(@RequestParam Integer id, RedirectAttributes redirectAttributes) {

		postService.deletePost(id);
		redirectAttributes.addFlashAttribute("message", "Post successfully deleted.");

		return "redirect:/administration/posts";
	}

}
