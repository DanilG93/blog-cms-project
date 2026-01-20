package cubes.main.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cubes.main.dao.CategoryDAO;
import cubes.main.entity.Category;
import cubes.main.service.CategoryService;

@Service
public class CategoryServiceImpl implements CategoryService {

	@Autowired
	private CategoryDAO categoryDAO;

	@Override
	@Transactional
	public List<Category> getCategories() {
		return categoryDAO.getCategories();
	}

	@Override
	@Transactional
	public void saveOrUpdateCategory(Category category) {
		categoryDAO.saveOrUpdateCategory(category);
	}

	@Override
	@Transactional
	public Category getCategoryById(Integer id) {
		return categoryDAO.getCategoryById(id);
	}

	@Override
	@Transactional
	public void deleteCategory(Integer id) {
		categoryDAO.deleteCategory(id);
	}

}
