package cubes.main.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cubes.main.dao.SliderDAO;
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
		sliderDAO.deleteSlider(id);

	}

}
