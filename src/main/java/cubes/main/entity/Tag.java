package cubes.main.entity;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

@Entity
@Table(name = "tags")
public class Tag {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column
	private Integer id;
	
	
	@Column(nullable = false, length = 50, unique = true)
    @NotBlank
    @Size(max = 50)
	private String name;
	
	@Column(name = "seo_url", nullable = false, unique = true, length = 60)
	private String seoUrl;
	
	@ManyToMany(mappedBy = "tags")
	private List<Post> posts;

	public Tag() {
		posts = new ArrayList<>();
	}

	public Tag(String name, String seoUrl) {
		this();
		this.name = name;
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
		return "Tag [id=" + id + ", name=" + name + ", seoUrl=" + seoUrl + "]";
	}

}
