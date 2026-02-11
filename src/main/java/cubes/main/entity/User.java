package cubes.main.entity;

import java.util.LinkedHashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;
import javax.persistence.JoinColumn;

@Entity
@Table(name = "users")
public class User {

	@Id
	@Column(length = 50)
	@NotBlank(message = "Username is required")
	@Size(min = 3, max = 50, message = "Username must be between 3 and 50 characters")
	private String username;

	@Column(nullable = false, length = 68)
	@NotBlank(message = "Password is required")
	private String password;

	@Column(nullable = false, unique = true, length = 100)
	@NotBlank(message = "Email is required")
	@Email(message = "Please provide a valid email address")
	private String email;

	@Column(nullable = false)
	private boolean enabled;

	@Column(nullable = false, length = 50)
	@NotBlank(message = "Name is required")
	@Size(min = 2, max = 50, message = "Name must be between 2 and 50 characters")
	private String name;

	@Column(nullable = false, length = 50)
	@NotBlank(message = "Surname is required")
	@Size(min = 2, max = 50, message = "Surname must be between 2 and 50 characters")
	private String surname;

	@Column(nullable = false, length = 20)
	@NotBlank(message = "Phone number is required")
	@Size(min = 6, max = 20, message = "Phone number format is not valid")
	private String phone;
	
	@Column
	private String image;

	@ManyToMany(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
	@JoinTable(name = "authorities", joinColumns = @JoinColumn(name = "username"), inverseJoinColumns = @JoinColumn(name = "authority"))
	private Set<Role> authorities;

	public User() {
		this.authorities = new LinkedHashSet<>();
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public boolean isEnabled() {
		return enabled;
	}

	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSurname() {
		return surname;
	}

	public void setSurname(String surname) {
		this.surname = surname;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public Set<Role> getAuthorities() {
		return authorities;
	}

	public void setAuthorities(Set<Role> authorities) {
		this.authorities = authorities;
	}

}
