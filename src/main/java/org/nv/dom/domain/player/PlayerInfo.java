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
	/** 角色头像 */
	private String characterAvatar;
	/** 签 */
	private Integer sign;
	/** 实际身份描述 */
	private String identityDesc;
	/** 签头像 */
	private String signAvatar;
	
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
	public String getCharacterAvatar() {
		return characterAvatar;
	}
	public void setCharacterAvatar(String characterAvatar) {
		this.characterAvatar = characterAvatar;
	}
	public Integer getSign() {
		return sign;
	}
	public void setSign(Integer sign) {
		this.sign = sign;
	}
	public String getIdentityDesc() {
		return identityDesc;
	}
	public void setIdentityDesc(String identityDesc) {
		this.identityDesc = identityDesc;
	}
	public String getSignAvatar() {
		return signAvatar;
	}
	public void setSignAvatar(String signAvatar) {
		this.signAvatar = signAvatar;
	}
	
}
