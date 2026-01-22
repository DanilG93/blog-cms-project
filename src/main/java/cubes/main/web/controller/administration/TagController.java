package cubes.main.web.controller.administration;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import cubes.main.entity.Tag;
import cubes.main.service.TagService;

@Controller
@RequestMapping("/administration/tags")
public class TagController {

	@Autowired
	private TagService tagService;

	@GetMapping("")
	public String getTagList(Model model) {

		model.addAttribute("tagList", tagService.getTags());

		model.addAttribute("tag", new Tag());

		return "administration/tag/tag-list";
	}

	@PostMapping("/save")
	public String saveTag(@ModelAttribute("tag") Tag tag) {

		tagService.saveOrUpdateTag(tag);

		return "redirect:/administration/tags";
	}

	@GetMapping("/edit/{id}")
	public String editTag(@PathVariable int id, Model model) {

		model.addAttribute("tagList", tagService.getTags());

		model.addAttribute("tag", tagService.getTagById(id));

		return "administration/tag/tag-list";
	}

	@PostMapping("/delete")
	public String deleteTag(@RequestParam int id) {
		tagService.deleteTag(id);

		return "redirect:/administration/tags/";
	}
}
