package org.nv.dom.domain.game;

import java.util.List;

public class ApplyingGame {
	
	/** 游戏id */
	private long id;
	/** 游戏名称 */
	private String gameDesc;
	/** 法官配置 */
	private List<String> Judgers;
	/** 玩家人数 */
	private Integer playerNum;
	/** 当前报名人数 */
	private Integer playCurNum;
	/** 预计开始时间 */
	private String startDate;
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getGameDesc() {
		return gameDesc;
	}
	public void setGameDesc(String gameDesc) {
		this.gameDesc = gameDesc;
	}
	public List<String> getJudgers() {
		return Judgers;
	}
	public void setJudgers(List<String> judgers) {
		Judgers = judgers;
	}
	public Integer getPlayerNum() {
		return playerNum;
	}
	public void setPlayerNum(Integer playerNum) {
		this.playerNum = playerNum;
	}
	public Integer getPlayCurNum() {
		return playCurNum;
	}
	public void setPlayCurNum(Integer playCurNum) {
		this.playCurNum = playCurNum;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	
	
	
	

}
