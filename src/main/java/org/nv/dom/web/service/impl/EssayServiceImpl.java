package org.nv.dom.web.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.nv.dom.config.PageParamType;
import org.nv.dom.domain.essay.Comment;
import org.nv.dom.domain.essay.Essay;
import org.nv.dom.dto.essay.SubmitCommentDTO;
import org.nv.dom.web.dao.essay.EssayMapper;
import org.nv.dom.web.dao.game.GameMapper;
import org.nv.dom.web.service.EssayService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
		try{
			if(essayMapper.saveOrUpdateEssayDao(essay)==1){
				result.put(PageParamType.BUSINESS_STATUS, 1);
				result.put(PageParamType.BUSINESS_MESSAGE, "保存复盘成功");
			}else{
				result.put(PageParamType.BUSINESS_STATUS, -3);
				result.put(PageParamType.BUSINESS_MESSAGE, "保存复盘失败");
			}
		}catch(Exception e){
			logger.error(e.getMessage(),e);
			result.put(PageParamType.BUSINESS_STATUS, -1);
			result.put(PageParamType.BUSINESS_MESSAGE, "系统异常");
		}
		return result;
	}

	@Override
	public Essay getReplayEssay(long userId) {
		Essay replayEssay = null;
		try{
			replayEssay = essayMapper.getReplayEssay(userId);
		}catch(Exception e){
			logger.error(e.getMessage(),e);
		}
		return replayEssay;
	}

	@Override
	public Map<String, Object> getEssayDetail(long essayId) {
		Map<String, Object> result = new HashMap<String, Object>();
		try{
			Essay essayDetail = essayMapper.getEssayDetailDao(essayId);
			List<Comment> essayComments = essayMapper.getEssayCommentDao(essayId);
			result.put("detail", essayDetail);
			result.put("comments", essayComments);
			result.put(PageParamType.BUSINESS_STATUS, 1);
			result.put(PageParamType.BUSINESS_MESSAGE, "获取文章详情成功");
		}catch(Exception e){
			logger.error(e.getMessage(),e);
			result.put(PageParamType.BUSINESS_STATUS, -1);
			result.put(PageParamType.BUSINESS_MESSAGE, "系统异常");
		}
		return result;
	}

	@Override
	public Map<String, Object> submitComment(SubmitCommentDTO submitCommentDTO) {
		Map<String, Object> result = new HashMap<String, Object>();
		try{
			essayMapper.insertCommentDao(submitCommentDTO);
			result.put(PageParamType.BUSINESS_STATUS, 1);
			result.put(PageParamType.BUSINESS_MESSAGE, "评论成功");
		}catch(Exception e){
			logger.error(e.getMessage(),e);
			result.put(PageParamType.BUSINESS_STATUS, -1);
			result.put(PageParamType.BUSINESS_MESSAGE, "系统异常");
		}
		return result;
	}
	
	

}
