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

import cubes.main.entity.Slider;
import cubes.main.service.SliderService;

@Controller
@RequestMapping("/administration/sliders")
public class SliderController {

	@Autowired
	private SliderService sliderService;

	@GetMapping("")
	public String getSliderList(@RequestParam(required = false) String mode, Model model) {

		model.addAttribute("sliderList", sliderService.getSliders());

		if ("sort".equals(mode)) {
			model.addAttribute("isSorting", true);
		}

		return "administration/slider/slider-list";
	}

	@GetMapping("/add")
	public String getSliderForm(Model model) {

		model.addAttribute("slider", new Slider());

		return "administration/slider/slider-form";
	}

	@GetMapping("/change-order")
	public String changeOrder(@RequestParam int id, @RequestParam String direction) {

		sliderService.changeSliderOrder(id, direction);

		return "redirect:/administration/sliders/?mode=sort";
	}

	@RequestMapping("/slider-enable")
	public String toggleSlider(@RequestParam int id) {

		sliderService.toggleSliderStatus(id);

		return "redirect:/administration/sliders";
	}

	@PostMapping("/save")
	public String saveSlider(@Valid @ModelAttribute("slider") Slider slider, BindingResult bindingResult,
			RedirectAttributes redirectAttributes) {

		if (bindingResult.hasErrors()) {
			return "administration/slider/slider-form";
		}

		sliderService.saveOrUpdateSlider(slider);

		redirectAttributes.addFlashAttribute("message", "You have successfully saved a slider");

		return "redirect:/administration/sliders";
	}

	@GetMapping("/edit/{id}")
	public String editSlider(@PathVariable Integer id, Model model) {

		model.addAttribute("slider", sliderService.getSliderById(id));

		return "administration/slider/slider-form";
	}

	@PostMapping("/delete")
	public String deleteSlider(@RequestParam Integer id) {

		sliderService.deleteSlider(id);

		return "redirect:/administration/sliders";
	}

}
