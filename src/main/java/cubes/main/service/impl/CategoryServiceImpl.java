package cubes.main.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cubes.main.dao.CategoryDAO;
import cubes.main.dao.util.MyUtil;
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

		String baseSeoUrl = MyUtil.generateSeoUrl(category.getName());
		String finalSeoUrl = baseSeoUrl;
		int counter = 1;

		while (categoryDAO.getCategoryByUrlSeo(finalSeoUrl) != null) {
			Category existingSeoUrl = categoryDAO.getCategoryByUrlSeo(finalSeoUrl);
			if (category.getId() != null && category.getId().equals(existingSeoUrl.getId())) {
				break;
			}
			finalSeoUrl = baseSeoUrl + "-" + (counter++);
		}

		category.setSeoUrl(finalSeoUrl);

		if (category.getId() == null || category.getId() == 0) {

			Integer maxOrder = categoryDAO.getMaxDisplayOrder();

			if (maxOrder == null) {

				category.setDisplayOrder(1);

			} else {

				category.setDisplayOrder(maxOrder + 1);

			}
		}

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
		Category category = categoryDAO.getCategoryById(id);

		if (category != null) {

			int orderToDelete = category.getDisplayOrder();

			categoryDAO.deleteCategory(id);

			categoryDAO.shiftDisplayOrders(orderToDelete);
		}

	}

	@Override
	@Transactional
	public void changeCategoryOrder(int id, String direction) {

		List<Category> list = categoryDAO.getCategories();

		int currentIndex = -1;
		for (int i = 0; i < list.size(); i++) {
			if (list.get(i).getId() == id) {
				currentIndex = i;
				break;
			}
		}

		if (currentIndex == -1) {
			return;
		}

		int swapIndex = -1;

		if (direction.equalsIgnoreCase("up")) {

			if (currentIndex > 0) {
				swapIndex = currentIndex - 1;
			}

		} else if (direction.equalsIgnoreCase("down")) {

			if (currentIndex < list.size() - 1) {
				swapIndex = currentIndex + 1;
			}

		}

		if (swapIndex != -1) {
			Category currentCategory = list.get(currentIndex);
			Category neighbourCategory = list.get(swapIndex);

			int currentOrder = currentCategory.getDisplayOrder();
			int neighbourOrder = neighbourCategory.getDisplayOrder();

			currentCategory.setDisplayOrder(neighbourOrder);
			neighbourCategory.setDisplayOrder(currentOrder);

			categoryDAO.saveOrUpdateCategory(currentCategory);
			categoryDAO.saveOrUpdateCategory(neighbourCategory);
		}

	}

}
