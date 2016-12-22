package org.nv.dom.web.service.impl;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.nv.dom.config.NVTermConstant;
import org.nv.dom.config.PageParamType;
import org.nv.dom.config.RedisConstant;
import org.nv.dom.domain.character.NVCharacter;
import org.nv.dom.domain.game.ApplyingGame;
import org.nv.dom.domain.game.Game;
import org.nv.dom.dto.game.ApplyDTO;
import org.nv.dom.dto.player.ChangeStatusDTO;
import org.nv.dom.dto.player.GetCharacterListDTO;
import org.nv.dom.dto.player.SelectCharacterDTO;
import org.nv.dom.enums.GameFinalResult;
import org.nv.dom.enums.GameStatus;
import org.nv.dom.enums.IdentityCode;
import org.nv.dom.enums.PlayerStatus;
import org.nv.dom.util.StringUtil;
import org.nv.dom.util.json.JacksonJSONUtils;
import org.nv.dom.web.dao.game.GameMapper;
import org.nv.dom.web.dao.player.PlayerMapper;
import org.nv.dom.web.service.GameService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("gameServiceImpl")
public class GameServiceImpl extends BasicServiceImpl implements GameService {
	
	private static Logger logger = Logger.getLogger(GameServiceImpl.class);
	
	@Autowired
	GameMapper gameMapper;
	
	@Autowired
	PlayerMapper playerMapper;

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
	public Map<String, Object> getAllGames() {
		Map<String, Object> result = new HashMap<String, Object>();
		List<Game> games;
		try{
			games = gameMapper.getAllGamesDao();
			for(Game game:games){
				game.setGameStatusDesc(GameStatus.getMessageByCode(game.getGameStatus()));
				if(game.getFinalResult()!=null){
					game.setFinalResultDesc(GameFinalResult.getMessageByCode(game.getFinalResult()));
				}
			}
			result.put("games", games);
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
			} else if(gameMapper.getPlayerNumDao(applyDTO.getGameId()) == applyDTO.getPlayerNum()){
				result.put(PageParamType.BUSINESS_STATUS, -5);
				result.put(PageParamType.BUSINESS_MESSAGE, "人数已报满");
			} else if(gameMapper.applyForGameDao(applyDTO) == 1 && 
					gameMapper.applyForGameDaoSecStep(applyDTO.getPlayerId()) == 1){				
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
		if(getCharacterListDTO.getPlayerId() < 1L || getCharacterListDTO.getGameId() < 1L){
			result.put(PageParamType.BUSINESS_STATUS, -2);
			result.put(PageParamType.BUSINESS_MESSAGE, "参数异常");
			return result;
		}
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
		if(selectCharacterDTO.getPlayerId() < 1L || selectCharacterDTO.getGameId() < 1L){
			result.put(PageParamType.BUSINESS_STATUS, -2);
			result.put(PageParamType.BUSINESS_MESSAGE, "参数异常");
			return result;
		}
		try{
			if(NVTermConstant.USE_IDENTITY_CARD.equals(selectCharacterDTO.getUseCard())){
				selectCharacterDTO.setCamp(selectCharacterDTO.getSign() <= IdentityCode.CIVILIAN.getCode()?
						NVTermConstant.GOOD_CAMP : NVTermConstant.KILLER_CAMP);
				selectCharacterDTO.setIdentityDesc(IdentityCode.getMessageByCode(selectCharacterDTO.getSign()));
			}
			if(selectCharacterDTO.getUseCard()!=0 && (gameMapper.queryCanUseCardDao(selectCharacterDTO)>0 || 
					 playerMapper.consumeUserCardDao(selectCharacterDTO)!=1)){
				result.put(PageParamType.BUSINESS_STATUS, -3);
				result.put(PageParamType.BUSINESS_MESSAGE, "使用卡片失败");
				return result;
			}
			if(NVTermConstant.USE_CAMP_CARD.equals(selectCharacterDTO.getUseCard())){
				selectCharacterDTO.setSign(IdentityCode.randomIdentitiyCode(selectCharacterDTO.getCamp(), 
						gameMapper.queryGamePlayerNumDao(selectCharacterDTO.getGameId())));
				selectCharacterDTO.setIdentityDesc(IdentityCode.getMessageByCode(selectCharacterDTO.getSign()));
			}
			String characterStr = redisClient.getHSet(RedisConstant.CHARACTER_SELECTING_LIST, 
					String.valueOf(selectCharacterDTO.getPlayerId()));
			if(StringUtil.isNullOrEmpty(characterStr)){
				if(gameMapper.queryCharacterAvailable(selectCharacterDTO)==1){
					result.put(PageParamType.BUSINESS_STATUS, -3);
					result.put(PageParamType.BUSINESS_MESSAGE, "该角色已被选择");
					return result;
				}
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
			gameMapper.selectCharacterDAO(selectCharacterDTO);
			ChangeStatusDTO changeStatusDTO = new ChangeStatusDTO();
			changeStatusDTO.setPlayerId(selectCharacterDTO.getPlayerId());
			changeStatusDTO.setStatus(PlayerStatus.CHARACTER_SELECTED.getCode());
			playerMapper.changePlayerStatus(changeStatusDTO);
			result.put(PageParamType.BUSINESS_STATUS, 1);
			result.put(PageParamType.BUSINESS_MESSAGE, "角色选择成功");	
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

	@Override
	public Map<String, Object> queryCharacter(SelectCharacterDTO selectCharacterDTO) {
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			Integer count = gameMapper.queryCharacterAvailable(selectCharacterDTO);
			result.put("isChosen", count);
			result.put(PageParamType.BUSINESS_STATUS, 1);
			result.put(PageParamType.BUSINESS_MESSAGE, "查询成功");
		}catch(Exception e){
			logger.error(e.getMessage(), e);
			result.put(PageParamType.BUSINESS_STATUS,-1);
			result.put(PageParamType.BUSINESS_MESSAGE, "系统异常");
		}
		return result;
	}

}
