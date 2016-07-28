package org.nv.dom.web.dao.newspaper;

import java.util.List;

import org.nv.dom.domain.newspaper.Newspaper;
import org.springframework.stereotype.Repository;

@Repository
public interface NewspaperMapper {
	
	List<Newspaper> getNewspaperListDao(long userId);
	
	public Newspaper getNewspaperDetailDao(long newspaperId);

}
