package cubes.main.service;

import java.util.List;

import cubes.main.entity.Tag;

public interface TagService {

	public List<Tag> getTags();

	public void saveOrUpdateTag(Tag tag);

	public Tag getTagById(Integer id);
	
	public Tag getTagByName(String name);

	public void deleteTag(Integer id);
	
	public Long getTagCount();

}
