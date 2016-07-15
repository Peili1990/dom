package org.nv.dom.web.service.impl;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.nv.dom.config.PageParamType;
import org.nv.dom.config.RedisConstant;
import org.nv.dom.domain.character.NVCharacter;
import org.nv.dom.domain.game.ApplyingGame;
import org.nv.dom.dto.game.ApplyDTO;
import org.nv.dom.dto.player.GetCharacterListDTO;
import org.nv.dom.dto.player.SelectCharacterDTO;
import org.nv.dom.util.StringUtil;
import org.nv.dom.util.json.JacksonJSONUtils;
import org.nv.dom.web.dao.game.GameMapper;
import org.nv.dom.web.service.GameService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("gameServiceImpl")
public class GameServiceImpl extends BasicServiceImpl implements GameService {
	
	private static Logger logger = Logger.getLogger(GameServiceImpl.class);
	
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
			logger.error(e.getMessage(), e);
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
			logger.error(e.getMessage(), e);
			result.put(PageParamType.BUSINESS_STATUS, -1);
			result.put(PageParamType.BUSINESS_MESSAGE, "系统异常");
		}
		return result;
	}

	@Override
	public Map<String, Object> getCharacterListThree(GetCharacterListDTO getCharacterListDTO) {
		Map<String, Object> result = new HashMap<String, Object>();
		try{
			String characterStr = redisClient.getHSet(RedisConstant.CHARACTER_SELECTING_LIST, 
					String.valueOf(getCharacterListDTO.getPlayerId()));
			List<NVCharacter> characters = new ArrayList<NVCharacter>();
			if(StringUtil.isNullOrEmpty(characterStr)){
				List<Integer> availableList = JacksonJSONUtils.jsonToList(
					redisClient.getHSet(RedisConstant.AVAILABLE_LIST, 
						String.valueOf(getCharacterListDTO.getGameId())),Integer.class);
				if(availableList != null && availableList.size() > 2){
					Collections.shuffle(availableList);
					List<Integer> availableListThree = availableList.subList(0, 3);
					availableList = availableList.subList(3, availableList.size());
					redisClient.setHSet(RedisConstant.AVAILABLE_LIST, String.valueOf(getCharacterListDTO.getGameId()),
							JacksonJSONUtils.beanToJSON(availableList).toString());
					characters = gameMapper.queryCharacterListThree(availableListThree);
					redisClient.setHSet(RedisConstant.CHARACTER_SELECTING_LIST, String.valueOf(getCharacterListDTO.getPlayerId()), 
							JacksonJSONUtils.beanToJSON(characters).toString());
				}
			} else {
				characters = JacksonJSONUtils.jsonToList(characterStr, NVCharacter.class);
			}
			result.put("characters",characters);
			result.put(PageParamType.BUSINESS_STATUS,1);
			result.put(PageParamType.BUSINESS_MESSAGE, "获取角色名单成功");	
		} catch(Exception e){
			logger.error(e.getMessage(), e);
			result.put(PageParamType.BUSINESS_STATUS,-1);
			result.put(PageParamType.BUSINESS_MESSAGE, "系统异常");	
		}
		return result;
	}

	@Override
	public Map<String, Object> selectCharacter(SelectCharacterDTO selectCharacterDTO) {
		Map<String, Object> result = new HashMap<String, Object>();
		try{
			if(gameMapper.selectCharacterDAO(selectCharacterDTO) == 1){
				String characterStr = redisClient.getHSet(RedisConstant.CHARACTER_SELECTING_LIST, 
						String.valueOf(selectCharacterDTO.getPlayerId()));
				if(StringUtil.isNullOrEmpty(characterStr)){
					
				} else {
					List<NVCharacter> characters = JacksonJSONUtils.jsonToList(characterStr, NVCharacter.class);
					List<Integer> availableList = JacksonJSONUtils.jsonToList(
							redisClient.getHSet(RedisConstant.AVAILABLE_LIST, 
								String.valueOf(selectCharacterDTO.getGameId())),Integer.class);
					availableList.addAll(getCharacterList(characters, selectCharacterDTO.getCharacterId()));
					redisClient.setHSet(RedisConstant.AVAILABLE_LIST, String.valueOf(selectCharacterDTO.getGameId()),
							JacksonJSONUtils.beanToJSON(availableList).toString());
					redisClient.delHSet(RedisConstant.CHARACTER_SELECTING_LIST, String.valueOf(selectCharacterDTO.getPlayerId()));
				}
				result.put(PageParamType.BUSINESS_STATUS, 1);
				result.put(PageParamType.BUSINESS_MESSAGE, "角色选择成功");	
			} else {
				result.put(PageParamType.BUSINESS_STATUS,-3);
				result.put(PageParamType.BUSINESS_MESSAGE, "角色选择失败");	
			}
		} catch(Exception e){
			logger.error(e.getMessage(), e);
			result.put(PageParamType.BUSINESS_STATUS,-1);
			result.put(PageParamType.BUSINESS_MESSAGE, "系统异常");
		}
		return result;
	}
	
	private List<Integer> getCharacterList(List<NVCharacter> characters, long characterId){
		List<Integer> characterList = new ArrayList<Integer>();
		for(NVCharacter character:characters){
			if(character.getId() == characterId){
				continue;
			}
			characterList.add(character.getId());
		}
		return characterList;
	}

}
