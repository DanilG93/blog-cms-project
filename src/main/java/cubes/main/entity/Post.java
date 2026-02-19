package cubes.main.entity;

import java.time.Duration;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.Lob;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

import org.hibernate.annotations.BatchSize;
import org.hibernate.annotations.CreationTimestamp;

@Entity
@Table(name = "posts")
public class Post {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column
	private Integer id;

	@Column(nullable = false, length = 255)
	@NotBlank(message = "Title must not be empty")
	@Size(min = 20, max = 255, message = "Title must be between 20 and 255 characters")
	private String title;

	@Column(nullable = false, length = 500)
	@NotBlank(message = "Description must not be empty")
	@Size(min = 50, max = 500, message = "Description must be between 50 and 500 characters")
	private String description;

	@Lob
	@Column(nullable = false)
	@NotBlank(message = "Content is required")
	private String content;

	@Column(nullable = false)
	private String image;

	@Column(name = "created_at", nullable = false, updatable = false)
	@CreationTimestamp
	private LocalDateTime createdAt;

	@Column(name = "view_count", nullable = false)
	private int viewCount;

	@Column(nullable = false)
	private boolean important;

	@Column(nullable = false)
	private boolean enabled;

	@Column(name = "seo_url", nullable = false, unique = true)
	private String seoUrl;

	@ManyToOne
	@JoinColumn(name = "category_id", nullable = true)
	private Category category;

	@ManyToOne
	@JoinColumn(name = "username", nullable = false)
	private User user;

	@ManyToMany(fetch = FetchType.EAGER, cascade = { CascadeType.DETACH, CascadeType.MERGE, CascadeType.PERSIST,
			CascadeType.REFRESH })
	@JoinTable(name = "posts_tags", joinColumns = @JoinColumn(name = "post_id"), inverseJoinColumns = @JoinColumn(name = "tag_id"))
	private Set<Tag> tags;

	@OneToMany(mappedBy = "post", cascade = CascadeType.ALL)
	@BatchSize(size = 20)
	private List<Comment> comments;

	public Post() {
		this.tags = new LinkedHashSet<>();
		this.comments = new ArrayList<>();
		this.viewCount = 0;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public LocalDateTime getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(LocalDateTime createdAt) {
		this.createdAt = createdAt;
	}

	public int getViewCount() {
		return viewCount;
	}

	public void setViewCount(int viewCount) {
		this.viewCount = viewCount;
	}

	public boolean getImportant() {
		return important;
	}

	public void setImportant(boolean important) {
		this.important = important;
	}

	public boolean getEnabled() {
		return enabled;
	}

	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}

	public String getSeoUrl() {
		return seoUrl;
	}

	public void setSeoUrl(String seoUrl) {
		this.seoUrl = seoUrl;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Set<Tag> getTags() {
		return tags;
	}

	public void setTags(Set<Tag> tags) {
		this.tags = tags;
	}

	public List<Comment> getComments() {
		return comments;
	}

	public void setComments(List<Comment> comments) {
		this.comments = comments;
	}

	public Date getCreatedAtAsDate() {
		if (this.createdAt == null) {
			return null;
		}

		return Date.from(this.createdAt.atZone(ZoneId.systemDefault()).toInstant());
	}

	public String getTimeAgo() {
		if (createdAt == null) {
			return "";
		}

		LocalDateTime now = LocalDateTime.now();
		Duration duration = Duration.between(createdAt, now);

		long seconds = duration.getSeconds();
		long minutes = seconds / 60;
		long hours = minutes / 60;
		long days = hours / 24;

		if (seconds < 60) {
			return "Just now";
		} else if (minutes < 60) {
			return minutes + " minutes ago";
		} else if (hours < 24) {
			return hours + " hours ago";
		} else if (days < 30) {
			return days + " days ago";
		} else if (days < 365) {
			long months = days / 30;
			return months + (months == 1 ? " month ago" : " months ago");
		} else {
			return createdAt.format(DateTimeFormatter.ofPattern("dd. MMM yyyy"));
		}
	}

}
