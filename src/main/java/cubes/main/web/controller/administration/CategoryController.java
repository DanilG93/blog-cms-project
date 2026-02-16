package cubes.main.web.controller.administration;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import cubes.main.entity.Category;
import cubes.main.service.CategoryService;

@Controller
@RequestMapping("/administration/categories")
public class CategoryController {

	@Autowired
	private CategoryService categoryService;

	@GetMapping("")
	public String getCategoryList(@RequestParam(required = false) String mode, Model model) {

		model.addAttribute("categoryList", categoryService.getCategories());

		if ("sort".equals(mode)) {
			model.addAttribute("isSorting", true);
		}

		return "administration/category/category-list";
	}

	@GetMapping("/change-order")
	public String changeOrder(@RequestParam int id, @RequestParam String direction) {

		categoryService.changeCategoryOrder(id, direction);

		return "redirect:/administration/categories/?mode=sort";
	}

	@GetMapping("/add")
	public String getCategoryForm(Model model) {

		model.addAttribute("category", new Category());

		return "administration/category/category-form";
	}

	@PostMapping("/save")
	public String saveCategory(@Valid @ModelAttribute("category") Category category, BindingResult bindingResult,
			RedirectAttributes redirectAttributes) {

		Category existing = categoryService.getCategoryByName(category.getName());

		if (existing != null && (category.getId() == null || !existing.getId().equals(category.getId()))) {
			bindingResult.rejectValue("name", "error.category", "Category with this name already exists!");
		}

		if (bindingResult.hasErrors()) {
			return "administration/category/category-form";
		}

		categoryService.saveOrUpdateCategory(category);

		redirectAttributes.addFlashAttribute("message",
				"You have successfully saved a category: " + category.getName());

		return "redirect:/administration/categories";
	}

	@GetMapping("/edit/{id}")
	public String editCategory(@PathVariable Integer id, Model model) {

		model.addAttribute("category", categoryService.getCategoryById(id));

		return "administration/category/category-form";
	}

	@PostMapping("/delete")
	public String deleteCategory(@RequestParam Integer id, RedirectAttributes redirectAttributes) {

		categoryService.deleteCategory(id);
		redirectAttributes.addFlashAttribute("message", "Category successfully deleted.");

		return "redirect:/administration/categories";
	}

}
