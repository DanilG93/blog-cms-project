package cubes.main.service;

import java.util.List;

import cubes.main.entity.ContactMessage;

public interface ContactMessageService {

	public List<ContactMessage> getContactMessages();

	public void saveOrUpdateContactMessage(ContactMessage contactMessage);

	public ContactMessage getContactMessageById(Integer id);

	public void deleteContactMessage(Integer id);
	
}
