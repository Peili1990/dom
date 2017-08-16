package org.nv.dom.web.dao.newspaper;

import java.util.List;

import org.nv.dom.domain.newspaper.Newspaper;
import org.springframework.stereotype.Repository;

@Repository
public interface NewspaperMapper {
	
	public List<Newspaper> getNewspaperListDao(long userId);
	
	public List<Newspaper> getNewspaperListByGameIdDao(long gameId);
	
	public Newspaper getNewspaperDetailDao(long newspaperId);

	public Newspaper getLatestNewspaperDao(long gameId);

}
