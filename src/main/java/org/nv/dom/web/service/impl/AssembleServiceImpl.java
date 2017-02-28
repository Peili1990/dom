package org.nv.dom.web.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.nv.dom.config.NVTermConstant;
import org.nv.dom.config.PageParamType;
import org.nv.dom.domain.message.speech.Speech;
import org.nv.dom.domain.newspaper.Newspaper;
import org.nv.dom.domain.player.PlayerReplaceSkin;
import org.nv.dom.dto.message.GetCurDaySpeechListDTO;
import org.nv.dom.dto.message.GetSpeechListDTO;
import org.nv.dom.util.StringUtil;
import org.nv.dom.util.TextUtil;
import org.nv.dom.web.dao.message.MessageMapper;
import org.nv.dom.web.dao.newspaper.NewspaperMapper;
import org.nv.dom.web.dao.player.PlayerMapper;
import org.nv.dom.web.service.AssembleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("assembleServieImpl")
public class AssembleServiceImpl implements AssembleService {
	
	private static Logger logger = Logger.getLogger(AssembleServiceImpl.class);
	
	@Autowired
	NewspaperMapper newspaperMapper;
	
	@Autowired
	MessageMapper messageMapper;
	
	@Autowired
	PlayerMapper playerMapper;

	@Override
	public Map<String, Object> getNewspaperList(long userId,Long gameId) {
		Map<String,Object> result = new HashMap<String,Object>();
		try{
			List<Newspaper> newspaperList = gameId == null ? 
					newspaperMapper.getNewspaperListDao(userId) :newspaperMapper.getNewspaperListByGameIdDao(gameId);
			result.put("newspaperList", newspaperList);
			result.put(PageParamType.BUSINESS_STATUS, 1);
			result.put(PageParamType.BUSINESS_MESSAGE, "获取报纸列表成功");
		}catch(Exception e){
			logger.error(e.getMessage(), e);
			result.put(PageParamType.BUSINESS_STATUS, -1);
			result.put(PageParamType.BUSINESS_MESSAGE, "系统异常");
		}
		return result;
	}
	
	@Override
	public Map<String, Object> getNewspaperDetail(GetSpeechListDTO getSpeechListDTO) {
		Map<String, Object> result = new HashMap<String, Object>();
		try{
			Newspaper newspaper = newspaperMapper.getNewspaperDetailDao(getSpeechListDTO.getNewspaperId());
			if(newspaper.getType() == NVTermConstant.DAILY_PAPER){
				List<Speech> speechList = messageMapper.getSpeechListDao(getSpeechListDTO);
				result.put("speechList", speechList);
				if(getSpeechListDTO.getPlayerId()>0L){
					List<PlayerReplaceSkin> replaceList = playerMapper.getPlayerReplaceSkinDao(getSpeechListDTO.getPlayerId());
					if(replaceList!=null &&!replaceList.isEmpty()){
						result.put("replaceList", replaceList);
					}
				}
			}			
			result.put("newspaperDetail", newspaper);
			result.put(PageParamType.BUSINESS_STATUS, 1);
			result.put(PageParamType.BUSINESS_MESSAGE, "获取报纸详情成功");
		}catch(Exception e){
			logger.error(e.getMessage(), e);
			result.put(PageParamType.BUSINESS_STATUS, -1);
			result.put(PageParamType.BUSINESS_MESSAGE, "系统异常");
		}
		return result;
	}

	@Override
	public Map<String, Object> getLatestNewspaperInfo(long gameId) {
		Map<String, Object> result = new HashMap<String, Object>();
		try{
			Newspaper newspaper = newspaperMapper.getLatestNewspaperDao(gameId);
			if(StringUtil.isNullOrEmpty(newspaper.getHeadline())){
				newspaper.setHeadline("重要公告");
			}
			if(StringUtil.isNullOrEmpty(newspaper.getHeadlineBody())){
				newspaper.setHeadlineBody(newspaper.getImportantNotice());
			}
			Speech speech = messageMapper.getLatestSpeechDao(gameId);
			result.put("newspaper", newspaper);
			result.put("speech", speech);
		}catch(Exception e){
			logger.error(e.getMessage(), e);
		}
		return result;
	}
	
	@Override
	public Map<String, Object> wordCount(GetCurDaySpeechListDTO getCurDaySpeechListDTO) {
		Map<String, Object> result = new HashMap<String, Object>();
		try{
			List<String> speechList = messageMapper.getCurDaySpeechListDao(getCurDaySpeechListDTO);
			Integer usedWordCount = 0;
			for(String speech : speechList){
				usedWordCount += TextUtil.wordCount(speech);
			}
			Integer wordCount = TextUtil.wordCount(getCurDaySpeechListDTO.getContent());
			result.put("used", usedWordCount);
			result.put("wordCount", wordCount);
			result.put(PageParamType.BUSINESS_STATUS, 1);
			result.put(PageParamType.BUSINESS_MESSAGE, "字数统计成功");
		}catch(Exception e){  
			logger.error(e.getMessage(),e);
			result.put(PageParamType.BUSINESS_STATUS, -1);
			result.put(PageParamType.BUSINESS_MESSAGE, "系统异常");
		}
		return result;
	}
	
	

}
