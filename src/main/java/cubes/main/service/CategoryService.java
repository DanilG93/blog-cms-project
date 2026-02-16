package cubes.main.service;

import java.util.List;

import cubes.main.entity.Category;

public interface CategoryService {

	public List<Category> getCategories();

	public void saveOrUpdateCategory(Category category);
	
	public Category getCategoryByName(String name);

	public Category getCategoryById(Integer id);

	public void deleteCategory(Integer id);

	public void changeCategoryOrder(int id, String direction);
	
	public Long getCategoryCount();
}
