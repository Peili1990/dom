package org.nv.dom.dto.player;

public class SelectCharacterDTO {
	
	/** 玩家id */
	private long playerId;
	/** 游戏id */
	private long gameId;
	/** 角色id */
	private long characterId;
	/** 是否sp */
	private String isSp;
	/** 是否申请先驱 */
	private String applyPioneer;
	
	public long getPlayerId() {
		return playerId;
	}
	public void setPlayerId(long playerId) {
		this.playerId = playerId;
	}
	public long getGameId() {
		return gameId;
	}
	public void setGameId(long gameId) {
		this.gameId = gameId;
	}
	public long getCharacterId() {
		return characterId;
	}
	public void setCharacterId(long characterId) {
		this.characterId = characterId;
	}
	public String getIsSp() {
		return isSp;
	}
	public void setIsSp(String isSp) {
		this.isSp = isSp;
	}
	public String getApplyPioneer() {
		return applyPioneer;
	}
	public void setApplyPioneer(String applyPioneer) {
		this.applyPioneer = applyPioneer;
	}
	
}
