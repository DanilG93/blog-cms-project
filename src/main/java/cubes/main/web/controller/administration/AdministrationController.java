
package cubes.main.web.controller.administration;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import cubes.main.service.CategoryService;
import cubes.main.service.CommentService;
import cubes.main.service.PostService;
import cubes.main.service.TagService;

@Controller
@RequestMapping("/administration")
public class AdministrationController {

	@Autowired
	private PostService postService;

	@Autowired
	private CategoryService categoryService;

	@Autowired
	private TagService tagService;

	@Autowired
	private CommentService commentService;

	@GetMapping("")
	public String getOverviewPage(Model model) {
		
		model.addAttribute("postCount", postService.getPostCount());
		model.addAttribute("categoryCount", categoryService.getCategoryCount());
		model.addAttribute("tagCount", tagService.getTagCount());
		model.addAttribute("totalCommentCount", commentService.getTotalCommentCount());
		model.addAttribute("recentPosts", postService.getRecentPosts(5));

		return "administration/overview";
	}

}
