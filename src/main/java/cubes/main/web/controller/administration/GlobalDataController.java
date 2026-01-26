
package cubes.main.web.controller.administration;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

import cubes.main.service.CommentService;
import cubes.main.service.ContactMessageService;

@ControllerAdvice(basePackages = "cubes.main.web.controller.administration")
public class GlobalDataController {

	@Autowired
	CommentService commentService;
	@Autowired
	ContactMessageService contactMessageService;

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
	

}
