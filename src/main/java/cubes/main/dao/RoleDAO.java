package cubes.main.dao;

import java.util.List;

import cubes.main.entity.Role;

public interface RoleDAO {

	public List<Role> getRoles();

	public void saveOrUpdateRole(Role role);

	public Role getRoleByAuthority(String authority);

	public void deleteRole(String authority);

}
