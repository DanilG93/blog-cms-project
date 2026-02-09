
package cubes.main.web.controller.administration;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

import cubes.main.entity.User;
import cubes.main.service.CommentService;
import cubes.main.service.ContactMessageService;
import cubes.main.service.UserService;

@ControllerAdvice(basePackages = "cubes.main.web.controller.administration")
public class GlobalDataController {

	@Autowired
	CommentService commentService;
	@Autowired
	ContactMessageService contactMessageService;
	@Autowired
	UserService userService;

	@ModelAttribute("hasUnread")
	public boolean hasUnread(Model model) {
		return commentService.hasUnreadComment() || contactMessageService.hasUnreadContactMessage();
	}

	@ModelAttribute("commentCount")
	public Long commentCount(Model model) {
		return commentService.getUnreadCommentCount();
	}

	@ModelAttribute("messageCount")
	public Long messageCount(Model model) {
		return contactMessageService.getUnreadContactMessageCount();
	}

	@ModelAttribute("currentUser")
	public User getCurrentUser(Principal principal) {

		if (principal == null) {
			return null;
		}

		return userService.getUserByUsername(principal.getName());
	}

}
