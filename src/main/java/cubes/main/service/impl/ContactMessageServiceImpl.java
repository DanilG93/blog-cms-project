package cubes.main.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cubes.main.dao.ContactMessageDAO;
import cubes.main.entity.ContactMessage;
import cubes.main.service.ContactMessageService;

@Service
public class ContactMessageServiceImpl implements ContactMessageService {

	@Autowired
	private ContactMessageDAO contactMessageDAO;

	@Override
	@Transactional
	public List<ContactMessage> getContactMessages() {
		return contactMessageDAO.getContactMessages();
	}

	@Override
	@Transactional
	public void saveOrUpdateContactMessage(ContactMessage contactMessage) {
		contactMessageDAO.saveOrUpdateContactMessage(contactMessage);

	}

	@Override
	@Transactional
	public ContactMessage getContactMessageById(Integer id) {
		return contactMessageDAO.getContactMessageById(id);
	}

	@Override
	@Transactional
	public void deleteContactMessage(Integer id) {
		contactMessageDAO.deleteContactMessage(id);

	}

}
