package org.nv.dom.domain.game;

public class Game {
	
	/** 游戏id */
	private long id;
	/** 游戏名称 */
	private String gameDesc;
	/** 开版时间 */
	private String startDate;
	/** 当前状态 */
	private Integer gameStatus;
	/** 当前状态描述 */
	private String gameStatusDesc;
	/** 最终结果 */
	private Integer finalResult;
	/** 最终结果 */
	private String finalResultDesc;
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
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public Integer getGameStatus() {
		return gameStatus;
	}
	public void setGameStatus(Integer gameStatus) {
		this.gameStatus = gameStatus;
	}
	public String getGameStatusDesc() {
		return gameStatusDesc;
	}
	public void setGameStatusDesc(String gameStatusDesc) {
		this.gameStatusDesc = gameStatusDesc;
	}
	public Integer getFinalResult() {
		return finalResult;
	}
	public void setFinalResult(Integer finalResult) {
		this.finalResult = finalResult;
	}
	public String getFinalResultDesc() {
		return finalResultDesc;
	}
	public void setFinalResultDesc(String finalResultDesc) {
		this.finalResultDesc = finalResultDesc;
	}
	
}
