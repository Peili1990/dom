package org.nv.dom.web.dao.game;

import java.util.List;

import org.nv.dom.domain.character.NVCharacter;
import org.nv.dom.domain.game.ApplyingGame;
import org.nv.dom.domain.game.Game;
import org.nv.dom.dto.game.ApplyDTO;
import org.nv.dom.dto.player.SelectCharacterDTO;
import org.springframework.stereotype.Repository;

@Repository
public interface GameMapper {
	
	/**
	 * <p>获取报名中的版杀信息</p>
	 */
	public List<ApplyingGame> getApplyingGamesDao();
	/**
	 * <p>获取所有的版杀信息</p>
	 */
	public List<Game> getAllGamesDao();
	/**
	 * <p>获取报名中的版杀玩家人数</p>
	 */
	public Integer getPlayerNumDao(long gameId);
	/**
	 * <p>获取版杀主持法官信息</p>
	 */
	public List<String> queryGameJudgerDao(long gameId);
	/**
	 * <p>获取版杀总人数信息</p>
	 */
	public Integer queryGamePlayerNumDao(long gameId);
	/**
	 * <p>查询用户是否报名或参与其他版杀</p>
	 */
	public int queryHasAttendGameDao(ApplyDTO applyDTO);
	/**
	 * <p>报名版杀</p>
	 */
	public int applyForGameDao(ApplyDTO applyDTO);
	/**
	 * <p>报名版杀第二步</p>
	 */
	public int applyForGameDaoSecStep(long playerId);
	
	/**
	 * <p>查询玩家当前的状态</p>
	 */
	public Integer queryCurStatusDao(long playerId);
	/**
	 * <p>获取可选的3人名单</p>
	 */
	public List<NVCharacter> queryCharacterListThree(List<Integer> availableList);
	/**
	 * <p>查询角色是否被选择</p>
	 */
	public int queryCharacterAvailable(SelectCharacterDTO selectCharacterDTO);
	/**
	 * <p>选择角色</p>
	 */
	public int selectCharacterDAO(SelectCharacterDTO selectCharacterDTO);
	/**
	 * <p>查询是否允许使用卡片</p>
	 */
	public int queryCanUseCardDao(SelectCharacterDTO selectCharacterDTO);
	
}
