package org.nv.dom.domain.player;

public class PlayerInfo {
	
	/** 玩家id */
	private long playerId;
	/** 角色id */
	private Integer characterId;
	/** 是否sp */
	private String isSp;
	/** 角色名称 */
	private String characterName;
	/** 实际身份 */
	private Integer identity;
	/** 实际身份描述 */
	private String identityDesc;
	public long getPlayerId() {
		return playerId;
	}
	public void setPlayerId(long playerId) {
		this.playerId = playerId;
	}
	public Integer getCharacterId() {
		return characterId;
	}
	public void setCharacterId(Integer characterId) {
		this.characterId = characterId;
	}
	public String getIsSp() {
		return isSp;
	}
	public void setIsSp(String isSp) {
		this.isSp = isSp;
	}
	public String getCharacterName() {
		return characterName;
	}
	public void setCharacterName(String characterName) {
		this.characterName = characterName;
	}
	public Integer getIdentity() {
		return identity;
	}
	public void setIdentity(Integer identity) {
		this.identity = identity;
	}
	public String getIdentityDesc() {
		return identityDesc;
	}
	public void setIdentityDesc(String identityDesc) {
		this.identityDesc = identityDesc;
	}

}
