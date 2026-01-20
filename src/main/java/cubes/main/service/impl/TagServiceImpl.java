package cubes.main.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cubes.main.dao.TagDAO;
import cubes.main.entity.Tag;
import cubes.main.service.TagService;

@Service
public class TagServiceImpl implements TagService {

	@Autowired
	private TagDAO tagDAO;

	@Override
	@Transactional
	public List<Tag> getTags() {

		return tagDAO.getTags();
	}

	@Override
	@Transactional
	public void saveOrUpdateTag(Tag tag) {
		tagDAO.saveOrUpdateTag(tag);

	}

	@Override
	@Transactional
	public Tag getTagById(Integer id) {
		return tagDAO.getTagById(id);
	}

	@Override
	@Transactional
	public void deleteTag(Integer id) {
		tagDAO.deleteTag(id);
	}

}
