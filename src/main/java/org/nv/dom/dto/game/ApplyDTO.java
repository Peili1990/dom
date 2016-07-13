package org.nv.dom.dto.game;

public class ApplyDTO {
	
	private long userId;
	
	private long gameId;
	
	private String identitySelect;
	
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
	public String getIdentitySelect() {
		return identitySelect;
	}
	public void setIdentitySelect(String identitySelect) {
		this.identitySelect = identitySelect;
	}
}
