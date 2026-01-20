package cubes.main.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import cubes.main.dao.ContactMessageDAO;
import cubes.main.entity.ContactMessage;


@Repository
public class ContactMessageDAOImpl implements ContactMessageDAO {

	private final SessionFactory sessionFactory;

	@Autowired
	public ContactMessageDAOImpl(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public List<ContactMessage> getContactMessages() {
		List<ContactMessage> contactMessage = sessionFactory.getCurrentSession()
				.createQuery("from ContactMessage", ContactMessage.class).getResultList();

		return contactMessage;
	}

	@Override
	public void saveOrUpdateContactMessage(ContactMessage contactMessage) {
		sessionFactory.getCurrentSession().saveOrUpdate(contactMessage);

	}

	@Override
	public ContactMessage getContactMessageById(Integer id) {
		ContactMessage contactMessage = sessionFactory.getCurrentSession().get(ContactMessage.class, id);

		return contactMessage;
	}

	@Override
	public void deleteContactMessage(Integer id) {
		Session session = sessionFactory.getCurrentSession();

		Query<?> query = session.createQuery("delete from ContactMessage where id = :contactMessageId");
		query.setParameter("contactMessageId", id);

		query.executeUpdate();

	}

}
