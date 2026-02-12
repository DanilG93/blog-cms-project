package cubes.main.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import cubes.main.entity.Slider;

public interface SliderService {

	public List<Slider> getSliders();

	public void saveOrUpdateSlider(Slider slider);

	public Slider getSliderById(Integer id);

	public void deleteSlider(Integer id);

	public void changeSliderOrder(int id, String direction);

	public void toggleSliderStatus(int id);

	public void saveSlider(Slider slider, MultipartFile file, HttpServletRequest request);

}
