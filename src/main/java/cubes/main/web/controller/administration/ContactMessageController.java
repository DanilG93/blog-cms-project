package cubes.main.web.controller.administration;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import cubes.main.service.ContactMessageService;

@Controller
@RequestMapping("/administration/messages")
public class ContactMessageController {

	@Autowired
	public ContactMessageService contactMessageService;

	@GetMapping("")
	public String getContactMessageList(Model model) {

		model.addAttribute("contactMessageList", contactMessageService.getContactMessages());

		return "administration/contactMessage/contact-message-list";
	}

	@GetMapping("/mark-read")
	public String markAsRead(@RequestParam("id") Integer id) {

		contactMessageService.markAsRead(id);

		return "redirect:/administration/messages";
	}

	@PostMapping("/delete")
	public String deleteContactMessage(@RequestParam("id") Integer id) {

		contactMessageService.deleteContactMessage(id);

		return "redirect:/administration/messages";
	}

}
