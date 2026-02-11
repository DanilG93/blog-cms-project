package cubes.main.web.controller.administration;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AuthController {

	@RequestMapping("/login")
	public String getLoginPage() {

		return "administration/login";
	}

}
