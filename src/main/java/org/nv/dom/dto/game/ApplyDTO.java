package org.nv.dom.dto.game;

public class ApplyDTO {
	
	private long userId;
	
	private long gameId;
	
	private Integer playerNum;
	
	private String characterSelect;
	
	public long getUserId() {
		return userId;
	}
	public void setUserId(long userId) {
		this.userId = userId;
	}
	public long getGameId() {
		return gameId;
	}
	public void setGameId(long gameId) {
		this.gameId = gameId;
	}
	public Integer getPlayerNum() {
		return playerNum;
	}
	public void setPlayerNum(Integer playerNum) {
		this.playerNum = playerNum;
	}
	public String getCharacterSelect() {
		return characterSelect;
	}
	public void setCharacterSelect(String characterSelect) {
		this.characterSelect = characterSelect;
	}
	
}
