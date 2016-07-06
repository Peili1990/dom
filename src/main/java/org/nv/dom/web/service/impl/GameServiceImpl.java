package org.nv.dom.web.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.nv.dom.config.PageParamType;
import org.nv.dom.domain.game.ApplyingGame;
import org.nv.dom.dto.game.ApplyDTO;
import org.nv.dom.web.dao.game.GameMapper;
import org.nv.dom.web.service.GameService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("gameServiceImpl")
public class GameServiceImpl implements GameService {
	
	@Autowired
	GameMapper gameMapper;

	@Override
	public Map<String, Object> getApplyingGames() {
		Map<String, Object> result = new HashMap<String, Object>();
		List<ApplyingGame> applyingGames;
		try{
			applyingGames = gameMapper.getApplyingGamesDao();
			result.put("applyingGames", applyingGames);
			result.put(PageParamType.BUSINESS_STATUS, 1);
			result.put(PageParamType.BUSINESS_MESSAGE, "获取版杀信息成功");
		} catch (Exception e){
			result.put(PageParamType.BUSINESS_STATUS, -1);
			result.put(PageParamType.BUSINESS_MESSAGE, "系统异常");
		}	
		return result;
	}

	@Override
	public Map<String, Object> applyForGame(ApplyDTO applyDTO) {
		Map<String, Object> result = new HashMap<String, Object>();
		try{
			if(gameMapper.queryHasAttendGameDao(applyDTO)>0){
				result.put(PageParamType.BUSINESS_STATUS, -3);
				result.put(PageParamType.BUSINESS_MESSAGE, "您已报名或参加其他版杀");
			} else if(gameMapper.applyForGameDao(applyDTO) == 1){
				result.put(PageParamType.BUSINESS_STATUS, 1);
				result.put(PageParamType.BUSINESS_MESSAGE, "报名成功");
			} else {
				result.put(PageParamType.BUSINESS_STATUS, -4);
				result.put(PageParamType.BUSINESS_MESSAGE, "报名失败，请重试");
			}
		} catch (Exception e){
			result.put(PageParamType.BUSINESS_STATUS, -1);
			result.put(PageParamType.BUSINESS_MESSAGE, "系统异常");
		}
		return result;
	}

}
