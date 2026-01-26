package cubes.main.web.controller.administration;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import cubes.main.entity.Comment;
import cubes.main.entity.Post;
import cubes.main.service.CommentService;
import cubes.main.service.PostService;

@Controller
@RequestMapping("/administration/comments")
public class CommentController {

	@Autowired
	private CommentService commentService;

	@Autowired
	private PostService postService;

	@GetMapping("")
	public String getCommentList(@RequestParam(required = false) Integer postId, Model model) {

		List<Comment> commentList;

		if (postId != null && postId > 0) {

			commentList = commentService.getCommentsByPostId(postId);
		} else {

			commentList = commentService.getComments();
		}

		List<Post> postList = postService.getPosts();

		model.addAttribute("commentList", commentList);
		model.addAttribute("postList", postList);
		model.addAttribute("selectedPostId", postId);

		commentService.markAllAsRead();

		return "administration/comment/comment-list";
	}

	@GetMapping("/toggle-status/{id}")
	public String toggleCommentStatus(@PathVariable Integer id) {

		commentService.toggleCommentStatus(id);

		return "redirect:/administration/comments";
	}

}
