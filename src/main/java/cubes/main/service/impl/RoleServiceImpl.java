package cubes.main.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cubes.main.dao.RoleDAO;
import cubes.main.entity.Role;
import cubes.main.service.RoleService;

@Service
public class RoleServiceImpl implements RoleService{
	
	@Autowired
	private RoleDAO roleDAO;

	@Override
	@Transactional
	public List<Role> getRoles() {
		return roleDAO.getRoles();
	}

	@Override
	@Transactional
	public void saveOrUpdateRole(Role role) {
		roleDAO.saveOrUpdateRole(role);;
		
	}

	@Override
	@Transactional
	public Role getRoleByAuthority(String authority) {
		return roleDAO.getRoleByAuthority(authority);
	}

	@Override
	@Transactional
	public void deleteRole(String authority) {
		roleDAO.deleteRole(authority);
		
	}

}
