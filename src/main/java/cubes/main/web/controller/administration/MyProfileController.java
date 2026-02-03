package cubes.main.web.controller.administration;

import java.security.Principal;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.ui.Model;

import cubes.main.entity.User;
import cubes.main.service.UserService;

@Controller
@RequestMapping("/administration/my-profile")
public class MyProfileController {

	@Autowired
	private UserService userService;

	@GetMapping("/edit")
	public String getMyProfile(Principal principal, Model model) {

		User user = userService.getUserByUsername(principal.getName());

		model.addAttribute("user", user);

		return "administration/user/my-profile-form";
	}

	@PostMapping("/save")
	public String saveMyProfile(@ModelAttribute("user") User user, @RequestParam("file") MultipartFile file,
			HttpServletRequest request) {

		userService.saveMyProfile(user, file, request);

		return "redirect:/administration/my-profile/edit?success=true";
	}

}
