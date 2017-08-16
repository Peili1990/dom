package org.nv.dom.dto.message;

public class GetSpeechListDTO {
	
	private long userId;
	private long playerId;
	private long newspaperId;
	public long getUserId() {
		return userId;
	}
	public void setUserId(long userId) {
		this.userId = userId;
	}
	public long getPlayerId() {
		return playerId;
	}
	public void setPlayerId(long playerId) {
		this.playerId = playerId;
	}
	public long getNewspaperId() {
		return newspaperId;
	}
	public void setNewspaperId(long newspaperId) {
		this.newspaperId = newspaperId;
	}

}
