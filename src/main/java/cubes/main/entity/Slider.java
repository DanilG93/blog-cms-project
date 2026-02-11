package cubes.main.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotBlank;

@Entity
@Table(name = "sliders")
public class Slider {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column
	private Integer id;
	
	@Column(nullable = false, length = 100)
    @NotBlank
	private String title;
	
	@Column(nullable = false)
	private String image;
	
	
	
    
	@Column(name = "button_text", nullable = false, length = 30)
	@NotBlank
	private String buttonText;
	
	@Column(name = "button_url", nullable = false, length = 255)
	@NotBlank
	private String buttonUrl;
	
	@Column(name = "display_order", nullable = false)
	private Integer displayOrder;
	
	@Column(nullable = false)
	private boolean enabled;

	public Slider() {

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

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getButtonText() {
		return buttonText;
	}

	public void setButtonText(String buttonText) {
		this.buttonText = buttonText;
	}

	public String getButtonUrl() {
		return buttonUrl;
	}

	public void setButtonUrl(String buttonUrl) {
		this.buttonUrl = buttonUrl;
	}

	public Integer getDisplayOrder() {
		return displayOrder;
	}

	public void setDisplayOrder(Integer displayOrder) {
		this.displayOrder = displayOrder;
	}

	public boolean getEnabled() {
		return enabled;
	}

	public void setEnabled(Boolean enabled) {
		this.enabled = enabled;
	}

	@Override
	public String toString() {
		return "Slider [id=" + id + ", title=" + title + ", image=" + image + ", buttonText=" + buttonText
				+ ", buttonUrl=" + buttonUrl + ", displayOrder=" + displayOrder + ", enabled=" + enabled + "]";
	}

}
