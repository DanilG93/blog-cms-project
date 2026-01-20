package cubes.main.service;

import java.util.List;

import cubes.main.entity.Role;

public interface RoleService {
	
	public List<Role> getRoles();

	public void saveOrUpdateRole(Role role);

	public Role getRoleByAuthority(String authority);

	public void deleteRole(String authority);

}
