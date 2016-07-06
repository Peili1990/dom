package org.nv.dom.web.dao.game;

import java.util.List;

import org.nv.dom.domain.game.ApplyingGame;
import org.nv.dom.dto.game.ApplyDTO;
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
	 * <p>查询玩家是否报名或参与其他版杀</p>
	 */
	public int queryHasAttendGameDao(ApplyDTO applyDTO);
	/**
	 * <p>报名版杀</p>
	 */
	public int applyForGameDao(ApplyDTO applyDTO);
	
}
