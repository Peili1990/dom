package org.nv.dom.domain.player;

public class PlayerInfo {
	
	/** 游戏id */
	private long gameId;
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
	/** 角色头像（杀手方） */
	private String characterKillerAvatar;
	/** 签 */
	private Integer sign;
	/** 实际身份描述 */
	private String identityDesc;
	/** 签头像 */
	private String signAvatar;
	/** 阵营 */
	private Integer camp;
	/** 是否被禁言 */
	private Integer isMute;
	
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
	public String getCharacterKillerAvatar() {
		return characterKillerAvatar;
	}
	public void setCharacterKillerAvatar(String characterKillerAvatar) {
		this.characterKillerAvatar = characterKillerAvatar;
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
	public Integer getCamp() {
		return camp;
	}
	public void setCamp(Integer camp) {
		this.camp = camp;
	}
	public Integer getIsMute() {
		return isMute;
	}
	public void setIsMute(Integer isMute) {
		this.isMute = isMute;
	}
	
	
}
