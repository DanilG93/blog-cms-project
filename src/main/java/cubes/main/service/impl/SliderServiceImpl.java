package cubes.main.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cubes.main.dao.SliderDAO;
import cubes.main.entity.Category;
import cubes.main.entity.Slider;
import cubes.main.service.SliderService;

@Service
public class SliderServiceImpl implements SliderService {

	@Autowired
	private SliderDAO sliderDAO;

	@Override
	@Transactional
	public List<Slider> getSliders() {
		return sliderDAO.getSliders();
	}

	@Override
	@Transactional
	public void saveOrUpdateSlider(Slider slider) {

		if (slider.getId() == null || slider.getId() == 0) {

			Integer maxOrder = sliderDAO.getMaxDisplayOrder();

			if (maxOrder == null) {

				slider.setDisplayOrder(1);

			} else {

				slider.setDisplayOrder(maxOrder + 1);

			}
		}

		sliderDAO.saveOrUpdateSlider(slider);

	}

	@Override
	@Transactional
	public Slider getSliderById(Integer id) {
		return sliderDAO.getSliderById(id);
	}

	@Override
	@Transactional
	public void deleteSlider(Integer id) {
		
		Slider slider = sliderDAO.getSliderById(id);
		
		
		if (slider != null) {

			int orderToDelete = slider.getDisplayOrder();

			sliderDAO.deleteSlider(id);

			sliderDAO.shiftDisplayOrders(orderToDelete);
		}

	}

	@Override
	@Transactional
	public void changeSliderOrder(int id, String direction) {
		List<Slider> list = sliderDAO.getSliders();

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
			Slider currentSlider = list.get(currentIndex);
			Slider neighbourSlider = list.get(swapIndex);

			int currentOrder = currentSlider.getDisplayOrder();
			int neighbourOrder = neighbourSlider.getDisplayOrder();

			currentSlider.setDisplayOrder(neighbourOrder);
			neighbourSlider.setDisplayOrder(currentOrder);

			sliderDAO.saveOrUpdateSlider(currentSlider);
			sliderDAO.saveOrUpdateSlider(neighbourSlider);
		}

	}

	@Override
	@Transactional
	public void toggleSliderStatus(int id) {

		Slider slider = sliderDAO.getSliderById(id);

		if (slider != null) {

			boolean newStatus = !slider.getEnabled();
			slider.setEnabled(newStatus);

			sliderDAO.saveOrUpdateSlider(slider);
		}

	}

}
