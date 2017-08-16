package org.nv.dom.dto.player;

public class GetCharacterListDTO {
	
	private long gameId;
	private long playerId;
	public long getGameId() {
		return gameId;
	}
	public void setGameId(long gameId) {
		this.gameId = gameId;
	}
	public long getPlayerId() {
		return playerId;
	}
	public void setPlayerId(long playerId) {
		this.playerId = playerId;
	}

}
