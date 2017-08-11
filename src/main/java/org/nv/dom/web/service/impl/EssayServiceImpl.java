package org.nv.dom.web.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.nv.dom.config.PageParamType;
import org.nv.dom.domain.essay.Comment;
import org.nv.dom.domain.essay.Essay;
import org.nv.dom.dto.essay.UpdateEssayStatusDTO;
import org.nv.dom.dto.essay.GetEssayListDTO;
import org.nv.dom.dto.essay.SubmitCommentDTO;
import org.nv.dom.web.dao.essay.EssayMapper;
import org.nv.dom.web.dao.game.GameMapper;
import org.nv.dom.web.service.EssayService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;

@Service("essayServiceImpl")
public class EssayServiceImpl implements EssayService {
	
	private Logger logger = Logger.getLogger(EssayServiceImpl.class);
	
	@Autowired
	EssayMapper essayMapper;
	
	@Autowired
	GameMapper	gameMapper;

	@Override
	public Map<String, Object> publishEssay(Essay essay) {
		Map<String, Object> result = new HashMap<String, Object>();
		Assert.isTrue(essayMapper.saveOrUpdateEssayDao(essay) == 1, "保存复盘失败");
		result.put("essayId", essay.getEssayId());
		result.put(PageParamType.BUSINESS_STATUS, 1);
		result.put(PageParamType.BUSINESS_MESSAGE, "保存复盘成功");
		return result;
	}

	@Override
	public Essay getReplayEssay(long userId,Long gameId) {
		Essay replayEssay = null;
		try{
			replayEssay = gameId == null ? essayMapper.getReplayEssay(userId) : essayMapper.getReplayEssayByGameId(gameId); 
		}catch(Exception e){
			logger.error(e.getMessage(),e);
		}
		return replayEssay;
	}

	@Override
	public Map<String, Object> getEssayDetail(long essayId) {
		Map<String, Object> result = new HashMap<String, Object>();
		Essay essayDetail = essayMapper.getEssayDetailDao(essayId);
		List<Comment> essayComments = essayMapper.getEssayCommentDao(essayId);
		result.put("detail", essayDetail);
		result.put("comments", essayComments);
		result.put(PageParamType.BUSINESS_STATUS, 1);
		result.put(PageParamType.BUSINESS_MESSAGE, "获取文章详情成功");
		return result;
	}

	@Override
	public Map<String, Object> submitComment(SubmitCommentDTO submitCommentDTO) {
		Map<String, Object> result = new HashMap<String, Object>();
		essayMapper.insertCommentDao(submitCommentDTO);
		result.put(PageParamType.BUSINESS_STATUS, 1);
		result.put(PageParamType.BUSINESS_MESSAGE, "评论成功");
		return result;
	}

	@Override
	public Map<String, Object> getEssayList(GetEssayListDTO getEssayListDTO) {
		Map<String, Object> result = new HashMap<String, Object>();
		if(getEssayListDTO == null){
			getEssayListDTO = new GetEssayListDTO();
			getEssayListDTO.setPageNum(0);
			getEssayListDTO.setOffset(getEssayListDTO.getPageNum()*10);
		}		
		List<Essay> essayList = essayMapper.getEssayList(getEssayListDTO);
		result.put("essayList", essayList);
		result.put(PageParamType.BUSINESS_STATUS, 1);
		result.put(PageParamType.BUSINESS_MESSAGE, "获取成功");
		return result;
	}

	@Override
	public Map<String, Object> updateEssayStatus(UpdateEssayStatusDTO updateEssayStatusDTO) {
		Map<String, Object> result = new HashMap<String, Object>();
		updateEssayStatusDTO.setStatus(0);
		Assert.isTrue(essayMapper.updateEssayStatusDao(updateEssayStatusDTO) == 1, "更新失败");
		result.put(PageParamType.BUSINESS_STATUS, 1);
		result.put(PageParamType.BUSINESS_MESSAGE, "更新成功");
		return result;
	}

}
