package cubes.main.dao;

import java.util.List;

import cubes.main.entity.Category;


public interface CategoryDAO {

	public List<Category> getCategories();

	public void saveOrUpdateCategory(Category category);

	public Category getCategoryById(Integer id);

	public void deleteCategory(Integer id);
	
	public Integer getMaxDisplayOrder();
	
	public Category getCategoryByUrlSeo(String title);
	
	public void shiftDisplayOrders(int deletedOrder);
	
	public Long getCategoryCount();

}
