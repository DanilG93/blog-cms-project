package cubes.main.web.controller.front;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import cubes.main.entity.ContactMessage;
import cubes.main.service.ContactMessageService;

@Controller
@RequestMapping("/")
public class ContactController {

	@Autowired
	private ContactMessageService contactMessageService;

	@GetMapping("/contact")
	public String showContactPage(Model model) {

		return "front/contact";
	}

	@PostMapping("/contact-submit")
	public String submitContactMessage(@ModelAttribute ContactMessage contactMessage,
			RedirectAttributes redirectAttributes) {

		contactMessage.setIsRead(false);
		contactMessageService.saveOrUpdateContactMessage(contactMessage);

		redirectAttributes.addFlashAttribute("successMessage",
				"Thank you for contacting us! Your message has been sent successfully.");

		return "redirect:/contact";
	}

}
