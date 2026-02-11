package cubes.main.entity;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

@Entity
@Table(name = "categories")
public class Category {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column
	private Integer id;

	@Column(nullable = false, length = 50, unique = true)
	@NotBlank
	@Size(max = 50)
	private String name;

	@Column(length = 500)
    @Size(max = 500)
	private String description;

	
	@Column(name = "display_order", nullable = false)
	private int displayOrder;

	@Column(name = "seo_url", nullable = false, unique = true, length = 60)
	private String seoUrl;

	@OneToMany(mappedBy = "category")
	private List<Post> posts;

	public Category() {
		posts = new ArrayList<>();
	}

	public Category(String name, String description, int displayOrder, String seoUrl) {
		this();
		this.name = name;
		this.description = description;
		this.displayOrder = displayOrder;
		this.seoUrl = seoUrl;

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

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getDisplayOrder() {
		return displayOrder;
	}

	public void setDisplayOrder(int displayOrder) {
		this.displayOrder = displayOrder;
	}

	public String getSeoUrl() {
		return seoUrl;
	}

	public void setSeoUrl(String seoUrl) {
		this.seoUrl = seoUrl;
	}

	public List<Post> getPosts() {
		return posts;
	}

	public void setPosts(List<Post> posts) {
		this.posts = posts;
	}

	@Override
	public String toString() {
		return "Category [id=" + id + ", name=" + name + ", description=" + description + ", displayOrder="
				+ displayOrder + ", seoUrl=" + seoUrl + "]";
	}

}
