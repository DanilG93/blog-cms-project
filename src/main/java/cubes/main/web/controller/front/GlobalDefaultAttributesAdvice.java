package cubes.main.web.controller.front;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

import cubes.main.service.CategoryService;
import cubes.main.service.PostService;
import cubes.main.service.TagService;

@ControllerAdvice(basePackages = "cubes.main.web.controller.front")
public class GlobalDefaultAttributesAdvice {

	@Autowired
	private CategoryService categoryService;

	@Autowired
	private PostService postService;

	@Autowired
	private TagService tagService;

	@ModelAttribute
	public void addCommonAttributes(Model model) {
		model.addAttribute("categories", categoryService.getCategories());
		model.addAttribute("topViewedPosts", postService.getMostViewedPosts(3));
		model.addAttribute("latestPosts", postService.getRecentPosts(3));
		model.addAttribute("tags", tagService.getMostUsedTags());
		model.addAttribute("firstThreeImportantPosts", postService.getImportantPosts(3));
	}
}