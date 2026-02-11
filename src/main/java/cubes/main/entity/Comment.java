package cubes.main.entity;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

import org.hibernate.annotations.CreationTimestamp;

@Entity
@Table(name = "comments")
public class Comment {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column
	private Integer id;

	@Column(nullable = false, length = 100)
	@NotBlank
	private String name;

	@Column(nullable = false, length = 100)
	@Email
	@NotBlank
	private String email;

	@Column(nullable = false, length = 1000) // Komentar može biti duži
	@NotBlank
	@Size(max = 1000)
	private String content;

	@Column(columnDefinition = "TINYINT(1) DEFAULT 1", nullable = false)
	private boolean enabled;

	@Column(name = "is_read", columnDefinition = "TINYINT(1) DEFAULT 0")
	private boolean isRead;

	@Column(name = "created_at", nullable = false, updatable = false)
	@CreationTimestamp
	private LocalDateTime createdAt;

	@ManyToOne
	@JoinColumn(name = "post_id", nullable = false)
	private Post post;

	public Comment() {

	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public boolean getIsEnabled() {
		return enabled;
	}

	public void setIsEnabled(boolean enabled) {
		this.enabled = enabled;
	}

	public boolean getIsRead() {
		return isRead;
	}

	public void setIsRead(boolean isRead) {
		this.isRead = isRead;
	}

	public LocalDateTime getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(LocalDateTime createdAt) {
		this.createdAt = createdAt;
	}

	public Post getPost() {
		return post;
	}

	public void setPost(Post post) {
		this.post = post;
	}

	public String getDateFormatted() {
		if (this.createdAt == null)
			return "";

		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("MMM yyyy");

		return this.createdAt.format(formatter);
	}

}
