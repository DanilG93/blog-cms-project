package cubes.main.dao;

import java.util.List;

import cubes.main.entity.Tag;

public interface TagDAO {

	public List<Tag> getTags();

	public void saveOrUpdateTag(Tag tag);

	public Tag getTagById(Integer id);

	public Tag getTagByName(String name);

	public void deleteTag(Integer id);

	public Tag getTagByUrlSeo(String title);

	public Long getTagCount();
}
