package cubes.main.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import cubes.main.dao.SliderDAO;
import cubes.main.entity.Slider;

@Repository
public class SliderDAOImpl implements SliderDAO {

	private final SessionFactory sessionFactory;

	@Autowired
	public SliderDAOImpl(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public List<Slider> getSliders() {

		List<Slider> sliderList = sessionFactory.getCurrentSession().createQuery("from Slider", Slider.class)
				.getResultList();

		return sliderList;
	}

	@Override
	public void saveOrUpdateSlider(Slider slider) {
		sessionFactory.getCurrentSession().saveOrUpdate(slider);

	}

	@Override
	public Slider getSliderById(Integer id) {
		
		Slider slider = sessionFactory.getCurrentSession().get(Slider.class, id);

		return slider;
	}

	@Override
	public void deleteSlider(Integer id) {
		
		Session session = sessionFactory.getCurrentSession();

		Query<?> query = session.createQuery("delete from Slider where id = :cliderId");
		query.setParameter("cliderId", id);

		query.executeUpdate();

	}

}
