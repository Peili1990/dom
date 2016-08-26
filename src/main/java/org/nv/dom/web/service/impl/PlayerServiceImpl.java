package org.nv.dom.web.service.impl;

import java.util.HashMap;
import java.util.Map;

import org.apache.log4j.Logger;
import org.nv.dom.config.PageParamType;
import org.nv.dom.domain.player.PlayerInfo;
import org.nv.dom.domain.player.PlayerOpreation;
import org.nv.dom.dto.player.SubmitOpreationDTO;
import org.nv.dom.web.dao.player.PlayerMapper;
import org.nv.dom.web.service.PlayerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("playerServiceImpl")
public class PlayerServiceImpl implements PlayerService {
	
	private static Logger logger = Logger.getLogger(PlayerServiceImpl.class);
	
	@Autowired
	PlayerMapper playerMapper;

	@Override
	public PlayerInfo getPlayerInfoByUserId(long userId) {
		try{
			PlayerInfo playerInfo = playerMapper.getPlayerInfo(userId);
			if(playerInfo == null){
				return null;
			}
			return playerInfo;
		}catch(Exception e){
			logger.error(e.getMessage(),e);
			return null;
		}		
	}

	@Override
	public Map<String, Object> getPlayerOpreation(long playerId) {
		Map<String, Object> result = new HashMap<String, Object>();
		if(playerId < 1L){
			result.put(PageParamType.BUSINESS_STATUS, -2);
			result.put(PageParamType.BUSINESS_MESSAGE, "参数异常");
			return result;
		}
		try{
			PlayerOpreation opreation = playerMapper.getPlayerOpreation(playerId);
			result.put("opreation", opreation);
			result.put(PageParamType.BUSINESS_STATUS, 1);
			result.put(PageParamType.BUSINESS_MESSAGE, "获取玩家操作成功");
		}catch(Exception e){
			logger.error(e.getMessage(), e);
			result.put(PageParamType.BUSINESS_STATUS, -1);
			result.put(PageParamType.BUSINESS_MESSAGE, "系统异常");
		}
		return result;
	}
	
	@Override
	public Map<String, Object> submitOpreation(SubmitOpreationDTO submitOpreationDTO) {
		Map<String, Object> result = new HashMap<String, Object>();
		if(submitOpreationDTO.getPlayerId() < 1L){
			result.put(PageParamType.BUSINESS_STATUS, -2);
			result.put(PageParamType.BUSINESS_MESSAGE, "参数异常");
			return result;
		}
		try{
			if(playerMapper.submitOpreationDao(submitOpreationDTO)==1){
				result.put(PageParamType.BUSINESS_STATUS, 1);
				result.put(PageParamType.BUSINESS_MESSAGE, "提交操作成功！");
			} else {
				result.put(PageParamType.BUSINESS_STATUS, -3);
				result.put(PageParamType.BUSINESS_MESSAGE, "提交操作失败！");
			}
		} catch(Exception e){
			logger.error(e.getMessage(),e);
			result.put(PageParamType.BUSINESS_STATUS, -1);
			result.put(PageParamType.BUSINESS_MESSAGE, "系统异常");
		}
		return result;
	}
	
}
