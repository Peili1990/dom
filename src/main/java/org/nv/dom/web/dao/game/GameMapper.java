package org.nv.dom.web.dao.game;

import java.util.List;

import org.nv.dom.domain.character.NVCharacter;
import org.nv.dom.domain.game.ApplyingGame;
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
	 * <p>获取版杀主持法官信息</p>
	 */
	public List<String> queryGameJudgerDao(long gameId);
	/**
	 * <p>查询用户是否报名或参与其他版杀</p>
	 */
	public int queryHasAttendGameDao(ApplyDTO applyDTO);
	/**
	 * <p>报名版杀</p>
	 */
	public int applyForGameDao(ApplyDTO applyDTO);
	/**
	 * <p>查询玩家当前的状态</p>
	 */
	public Integer queryCurStatusDao(long playerId);
	/**
	 * <p>获取可选的3人名单</p>
	 */
	public List<NVCharacter> queryCharacterListThree(List<Integer> availableList);
	/**
	 * <p>选择角色</p>
	 */
	public int selectCharacterDAO(SelectCharacterDTO selectCharacterDTO);
}
