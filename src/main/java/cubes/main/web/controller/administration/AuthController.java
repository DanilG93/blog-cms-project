package cubes.main.web.controller.administration;

import java.security.Principal;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AuthController {

	@RequestMapping("/login")
	public String getLoginPage(Principal principal) {

		if (principal != null) {

			return "redirect:/administration";
		}

		return "administration/login";
	}

}
