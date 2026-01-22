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

		List<Slider> sliderList = sessionFactory.getCurrentSession().createQuery("from Slider order by displayOrder", Slider.class)
				.getResultList();

		return sliderList;
	}

	@Override
	public void saveOrUpdateSlider(Slider slider) {
		sessionFactory.getCurrentSession().merge(slider);

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

	@Override
	public Integer getMaxDisplayOrder() {
		Session session = sessionFactory.getCurrentSession();

		Query<Integer> query = session.createQuery("SELECT MAX(s.displayOrder) FROM Slider s", Integer.class);

		return query.getSingleResult();
	}

	@Override
	public void shiftDisplayOrders(int deletedOrder) {
		Session session = sessionFactory.getCurrentSession();

		String hql = "UPDATE Slider s SET s.displayOrder = s.displayOrder - 1 "
				+ "WHERE s.displayOrder > :deletedOrder";

		Query<?> query = session.createQuery(hql);
		query.setParameter("deletedOrder", deletedOrder);

		query.executeUpdate();

	}

}
