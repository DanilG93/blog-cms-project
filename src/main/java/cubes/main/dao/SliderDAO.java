package cubes.main.dao;

import java.util.List;

import cubes.main.entity.Slider;

public interface SliderDAO {

	public List<Slider> getSliders();
	
	public List<Slider> getEnabledSliders();

	public void saveOrUpdateSlider(Slider slider);

	public Slider getSliderById(Integer id);

	public void deleteSlider(Integer id);
	
	public Integer getMaxDisplayOrder();
	
	public void shiftDisplayOrders(int deletedOrder);
}
