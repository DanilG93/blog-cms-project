package cubes.main.web.controller.administration;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
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
import org.springframework.web.multipart.MultipartFile;

import cubes.main.entity.Role;
import cubes.main.entity.User;
import cubes.main.service.RoleService;
import cubes.main.service.UserService;

@Controller
@RequestMapping("/administration/users")
public class BloggerController {

	@Autowired
	private UserService userService;
	@Autowired
	private RoleService roleService;

	@GetMapping("")
	public String getUserList(@RequestParam(value = "page", defaultValue = "1") int page, Model model) {

		int pageSize = 5;

		List<User> list = userService.getUsers(page, pageSize);

		long totalUsers = userService.getUserCount();
		int totalPages = (int) Math.ceil((double) totalUsers / pageSize);

		model.addAttribute("userList", list);
		model.addAttribute("currentPage", page);
		model.addAttribute("totalPages", totalPages);

		return "administration/user/user-list";
	}

	@RequestMapping("/toggle-status")
	public String toggleUserStatus(@RequestParam("username") String username) {

		userService.enableDisableUser(username);

		return "redirect:/administration/users";
	}

	@GetMapping("/add")
	public String addUserForm(Model model) {

		User newUser = new User();
		newUser.getAuthorities().add(new Role("ROLE_BLOGGER"));

		model.addAttribute("user", newUser);
		model.addAttribute("roleList", roleService.getRoles());

		return "administration/user/user-form";
	}

	@GetMapping("/edit/{username}")
	public String editUser(@PathVariable String username, Model model) {

		model.addAttribute("user", userService.getUserByUsername(username));
		model.addAttribute("roleList", roleService.getRoles());

		return "administration/user/user-form";
	}

	@PostMapping("/save")
	public String saveUser(@Valid @ModelAttribute("user") User user, BindingResult bindingResult,
			@RequestParam(value = "roles", required = false) List<String> roles,
			@RequestParam("file") MultipartFile file, HttpServletRequest request, Model model) {

		User existingUser = userService.getUserByUsername(user.getUsername());

		if (existingUser == null && (user.getPassword() == null || user.getPassword().trim().isEmpty())) {
			bindingResult.rejectValue("password", "error.user", "Password is required for new users.");
		}

		if (bindingResult.hasErrors()) {
			
			model.addAttribute("roleList", roleService.getRoles());

			if (roles != null) {
				user.getAuthorities().clear();
				for (String roleName : roles) {
					user.getAuthorities().add(new Role(roleName));
				}
			}

			return "administration/user/user-form";
		}

		userService.saveUser(user, roles, file, request);

		return "redirect:/administration/users";
	}
}