package org.nv.dom.web.service;

import java.util.Map;

import org.nv.dom.domain.essay.Essay;
import org.nv.dom.dto.essay.UpdateEssayStatusDTO;
import org.nv.dom.dto.essay.GetEssayListDTO;
import org.nv.dom.dto.essay.SubmitCommentDTO;

public interface EssayService {

	public Map<String, Object> publishEssay(Essay essay);

	public Essay getReplayEssay(long userId,Long gameId);

	public Map<String, Object> getEssayDetail(long essayId);

	public Map<String, Object> submitComment(SubmitCommentDTO submitCommentDTO);

	public Map<String, Object> getEssayList(GetEssayListDTO getEssayListDTO);

	public Map<String, Object> updateEssayStatus(UpdateEssayStatusDTO updateEssayStatusDTO);

}
