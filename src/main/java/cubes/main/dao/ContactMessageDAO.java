package cubes.main.dao;

import java.util.List;

import cubes.main.entity.ContactMessage;

public interface ContactMessageDAO {

	public List<ContactMessage> getContactMessages();

	public void saveOrUpdateContactMessage(ContactMessage contactMessage);

	public ContactMessage getContactMessageById(Integer id);

	public void deleteContactMessage(Integer id);

}
