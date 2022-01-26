package org.nv.dom.web.service.impl;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.nv.dom.config.NVTermConstant;
import org.nv.dom.config.PageParamType;
import org.nv.dom.config.RedisConstant;
import org.nv.dom.domain.character.NVCharacter;
import org.nv.dom.domain.game.ApplyingGame;
import org.nv.dom.domain.game.Game;
import org.nv.dom.dto.game.ApplyDTO;
import org.nv.dom.dto.game.GetOperationTargetDTO;
import org.nv.dom.dto.player.ChangeStatusDTO;
import org.nv.dom.dto.player.GetCharacterListDTO;
import org.nv.dom.dto.player.SelectCharacterDTO;
import org.nv.dom.enums.CardType;
import org.nv.dom.enums.GameFinalResult;
import org.nv.dom.enums.GameStatus;
import org.nv.dom.enums.IdentityCode;
import org.nv.dom.enums.PlayerStatus;
import org.nv.dom.util.ConfigUtil;
import org.nv.dom.util.HttpClientUtil;
import org.nv.dom.util.StringUtil;
import org.nv.dom.web.dao.game.GameMapper;
import org.nv.dom.web.dao.player.PlayerMapper;
import org.nv.dom.web.service.GameService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;

import com.alibaba.fastjson.JSON;


@Service("gameServiceImpl")
public class GameServiceImpl extends BasicServiceImpl implements GameService {
	
	@Autowired
	GameMapper gameMapper;
	
	@Autowired
	PlayerMapper playerMapper;

	@Override
	public Map<String, Object> getApplyingGames() {
		Map<String, Object> result = new HashMap<String, Object>();
		List<ApplyingGame> applyingGames = gameMapper.getApplyingGamesDao();
		result.put("applyingGames", applyingGames);
		result.put(PageParamType.BUSINESS_STATUS, 1);
		result.put(PageParamType.BUSINESS_MESSAGE, "获取版杀信息成功");
		return result;
	}
	
	@Override
	public Map<String, Object> getAllGames() {
		Map<String, Object> result = new HashMap<String, Object>();
		List<Game> games;
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
		return result;
	}

	@Override
	public Map<String, Object> applyForGame(ApplyDTO applyDTO) {
		Map<String, Object> result = new HashMap<String, Object>();
		Assert.isTrue(gameMapper.queryHasAttendGameDao(applyDTO) == 0, "您已报名或参加其他版杀");
		Assert.isTrue(!(gameMapper.getPlayerNumDao(applyDTO.getGameId()) == applyDTO.getPlayerNum()), "人数已报满");	
		Assert.isTrue(gameMapper.applyForGameDao(applyDTO) == 1 && 
				gameMapper.applyForGameDaoSecStep(applyDTO.getPlayerId()) == 1, "报名失败，请重试");			
		result.put(PageParamType.BUSINESS_STATUS, 1);
		result.put(PageParamType.BUSINESS_MESSAGE, "报名成功");
		return result;
	}

	@Override
	public Map<String, Object> getCharacterListThree(GetCharacterListDTO getCharacterListDTO) {
		Map<String, Object> result = new HashMap<String, Object>();
		Assert.isTrue(getCharacterListDTO.getPlayerId() > 0 || getCharacterListDTO.getGameId() > 0, "参数异常");
			String characterStr = redisGetHSet(RedisConstant.CHARACTER_SELECTING_LIST, 
					String.valueOf(getCharacterListDTO.getPlayerId()));
			List<NVCharacter> characters = new ArrayList<NVCharacter>();
			if(StringUtil.isNullOrEmpty(characterStr)){
				List<Integer> availableList = JSON.parseArray(redisGetHSet(RedisConstant.AVAILABLE_LIST, 
						String.valueOf(getCharacterListDTO.getGameId())), Integer.class);
				if(availableList != null && availableList.size() > 2){
					Collections.shuffle(availableList);
					List<Integer> availableListThree = availableList.subList(0, 3);
					availableList = availableList.subList(3, availableList.size());
					redisSetHSet(RedisConstant.AVAILABLE_LIST, String.valueOf(getCharacterListDTO.getGameId()),
							JSON.toJSONString(availableList));
					characters = gameMapper.queryCharacterListThree(availableListThree);
					redisSetHSet(RedisConstant.CHARACTER_SELECTING_LIST, String.valueOf(getCharacterListDTO.getPlayerId()), 
							JSON.toJSONString(characters));
				}
			} else {
				characters = JSON.parseArray(characterStr, NVCharacter.class);
			}
			result.put("characters",characters);
			result.put(PageParamType.BUSINESS_STATUS,1);
			result.put(PageParamType.BUSINESS_MESSAGE, "获取角色名单成功");	
		return result;
	}

	@Override
	public Map<String, Object> selectCharacter(SelectCharacterDTO selectCharacterDTO) {
		Map<String, Object> result = new HashMap<String, Object>();
		Assert.isTrue(selectCharacterDTO.getPlayerId() > 0 || selectCharacterDTO.getGameId() > 0, "参数异常");			
		if(selectCharacterDTO.getUseCard()!=CardType.NONE.getCode() && (gameMapper.queryCanUseCardDao(selectCharacterDTO)>0 ||
				(CardType.PRIVILEGE.getCode().equals(selectCharacterDTO.getUseCard()) && gameMapper.deleteSelectedCharacterDao(selectCharacterDTO)!=1) ||
				 playerMapper.consumeUserCardDao(selectCharacterDTO)!=1)){
			result.put(PageParamType.BUSINESS_STATUS, -3);
			result.put(PageParamType.BUSINESS_MESSAGE, "使用卡片失败");
			return result;
		}
		if(CardType.IDENTITY.getCode().equals(selectCharacterDTO.getUseCard())){
			selectCharacterDTO.setCamp(selectCharacterDTO.getSign() <= IdentityCode.CIVILIAN.getCode()?
					NVTermConstant.GOOD_CAMP : NVTermConstant.KILLER_CAMP);			
		}
		if(CardType.CAMP.getCode().equals(selectCharacterDTO.getUseCard())){
			selectCharacterDTO.setSign(IdentityCode.randomIdentitiyCode(selectCharacterDTO.getCamp(), 
					gameMapper.queryGamePlayerNumDao(selectCharacterDTO.getGameId())));				
		}
		selectCharacterDTO.setIdentityDesc(IdentityCode.getMessageByCode(selectCharacterDTO.getSign()));
		String characterStr = redisGetHSet(RedisConstant.CHARACTER_SELECTING_LIST, 
				String.valueOf(selectCharacterDTO.getPlayerId()));
		if(StringUtil.isNullOrEmpty(characterStr)){
			Assert.isTrue(gameMapper.queryCharacterAvailable(selectCharacterDTO) == 0, "该角色已被选择");
		} else {
			List<NVCharacter> characters = JSON.parseArray(characterStr, NVCharacter.class);
			List<Integer> availableList = JSON.parseArray(redisGetHSet(RedisConstant.AVAILABLE_LIST, 
						String.valueOf(selectCharacterDTO.getGameId())),Integer.class);
			availableList.addAll(getCharacterList(characters, selectCharacterDTO.getCharacterId()));
			redisSetHSet(RedisConstant.AVAILABLE_LIST, String.valueOf(selectCharacterDTO.getGameId()),
					JSON.toJSONString(availableList));
			redisDelHset(RedisConstant.CHARACTER_SELECTING_LIST, String.valueOf(selectCharacterDTO.getPlayerId()));
		}
		gameMapper.selectCharacterDAO(selectCharacterDTO);
		ChangeStatusDTO changeStatusDTO = new ChangeStatusDTO();
		changeStatusDTO.setPlayerId(selectCharacterDTO.getPlayerId());
		changeStatusDTO.setStatus(PlayerStatus.CHARACTER_SELECTED.getCode());
		playerMapper.changePlayerStatus(changeStatusDTO);
		result.put(PageParamType.BUSINESS_STATUS, 1);
		result.put(PageParamType.BUSINESS_MESSAGE, "角色选择成功");	
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
		Integer count = gameMapper.queryCharacterAvailable(selectCharacterDTO);
		result.put("isChosen", count);
		result.put(PageParamType.BUSINESS_STATUS, 1);
		result.put(PageParamType.BUSINESS_MESSAGE, "查询成功");
		return result;
	}

	@Override
	public Map<String, Object> getOpreationTarget(long gameId, GetOperationTargetDTO getOperationTargetDTO) {
		Assert.isTrue(gameId > 0 , "参数异常");
		Map<String, Object> param = new HashMap<>();
		param.put("type", getOperationTargetDTO.getType());
		param.put("operationId", getOperationTargetDTO.getOperationId());
		param.put("gameId", gameId);
		return HttpClientUtil.doPostAndGetMap(ConfigUtil.getVersionConfigProperty("judger.server")+"/game/getOperationTarget", JSON.toJSONString(param));	
	}

}
