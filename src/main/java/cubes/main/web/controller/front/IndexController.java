package cubes.main.web.controller.front;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import cubes.main.service.PostService;
import cubes.main.service.SliderService;

@Controller
@RequestMapping("/")
public class IndexController {

	@Autowired
	private SliderService sliderService;
	@Autowired
	private PostService postService;

	@GetMapping("")
	public String getIndexPage(Model model) {
		
		

		model.addAttribute("sliderList", sliderService.getEnabledSliders());
		model.addAttribute("newPostList", postService.getImportantPosts(12));

		return "front/index";
	}

}
