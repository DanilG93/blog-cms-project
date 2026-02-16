package cubes.main.dao.impl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.hibernate.Session;
import org.hibernate.query.Query;

import cubes.main.dao.TagDAO;
import cubes.main.entity.Tag;

@Repository
public class TagDAOImpl implements TagDAO {

	private final SessionFactory sessionFactory;

	@Autowired
	public TagDAOImpl(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public List<Tag> getTags() {
		List<Tag> tagList = sessionFactory.getCurrentSession().createQuery("from Tag", Tag.class).getResultList();

		return tagList;
	}

	@Override
	public void saveOrUpdateTag(Tag tag) {
		sessionFactory.getCurrentSession().merge(tag);

	}

	@Override
	public Tag getTagById(Integer id) {
		Tag tag = sessionFactory.getCurrentSession().get(Tag.class, id);

		return tag;
	}

	@Override
	public void deleteTag(Integer id) {
		Session session = sessionFactory.getCurrentSession();

		Query<?> query = session.createQuery("delete from Tag where id = :tagId");
		query.setParameter("tagId", id);

		query.executeUpdate();

	}

	@Override
	public Tag getTagByUrlSeo(String title) {
		Session session = sessionFactory.getCurrentSession();

		Query<Tag> seoUrl = session.createQuery("FROM Tag t WHERE t.seoUrl = :seoUrl", Tag.class);

		seoUrl.setParameter("seoUrl", title);
		return seoUrl.uniqueResult();
	}

	@Override
	public Long getTagCount() {
		Session session = sessionFactory.getCurrentSession();

		Query<Long> query = session.createQuery("SELECT COUNT(t) FROM Tag t", Long.class);

		return query.getSingleResult();
	}

	@Override
	public Tag getTagByName(String name) {
		Session session = sessionFactory.getCurrentSession();
		Query<Tag> query = session.createQuery("from Tag where name = :name", Tag.class);
		query.setParameter("name", name);
		return query.uniqueResult();
	}

}
