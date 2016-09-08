package org.nv.dom.web.dao.essay;

import org.nv.dom.domain.essay.Essay;
import org.springframework.stereotype.Repository;

@Repository
public interface EssayMapper {

	public int saveOrUpdateEssayDao(Essay essay);
	
	public Essay getReplayEssay(long userId);

}
