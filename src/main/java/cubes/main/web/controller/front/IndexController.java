package cubes.main.web.controller.front;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import cubes.main.service.CategoryService;
import cubes.main.service.PostService;
import cubes.main.service.SliderService;

@Controller
@RequestMapping("/")
public class IndexController {

	@Autowired
	private SliderService sliderService;

	@Autowired
	private PostService postService;

	@Autowired
	private CategoryService categoryService;
	
	@GetMapping("")
	public String getIndexPage(Model model) {

		model.addAttribute("sliderList", sliderService.getSliders());
		model.addAttribute("firstThreeImportantPosts", postService.getImportantPosts(3));
		model.addAttribute("newPostList", postService.getRecentPosts(12));
		model.addAttribute("categories", categoryService.getCategories());

		return "front/index";
	}

}
