package org.nv.dom.web.dao.essay;

import java.util.List;

import org.nv.dom.domain.essay.Comment;
import org.nv.dom.domain.essay.Essay;
import org.nv.dom.dto.essay.SubmitCommentDTO;
import org.springframework.stereotype.Repository;

@Repository
public interface EssayMapper {

	public int saveOrUpdateEssayDao(Essay essay);
	
	public Essay getReplayEssay(long userId);
	
	public Essay getEssayDetailDao(long essayId);
	
	public List<Comment> getEssayCommentDao(long essayId);
	
	public int insertCommentDao(SubmitCommentDTO submitCommentDTO);
	
}