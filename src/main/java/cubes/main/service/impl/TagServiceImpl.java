package cubes.main.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cubes.main.dao.TagDAO;
import cubes.main.entity.Tag;
import cubes.main.service.TagService;
import cubes.main.util.MyUtil;

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

		String baseSeoUrl = MyUtil.generateSeoUrl(tag.getName());
		String finalSeoUrl = baseSeoUrl;
		int counter = 1;

		while (tagDAO.getTagByUrlSeo(finalSeoUrl) != null) {
			Tag existingSeoUrl = tagDAO.getTagByUrlSeo(finalSeoUrl);
			if (tag.getId() != null && tag.getId().equals(existingSeoUrl.getId())) {
				break;
			}
			finalSeoUrl = baseSeoUrl + "-" + (counter++);
		}

		tag.setSeoUrl(finalSeoUrl);

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

	@Override
	@Transactional
	public Long getTagCount() {

		return tagDAO.getTagCount();
	}

	@Override
	@Transactional
	public Tag getTagByName(String name) {
		
		return tagDAO.getTagByName(name);
	}

}
