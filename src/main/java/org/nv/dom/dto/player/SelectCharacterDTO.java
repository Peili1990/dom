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
	/** 是否使用卡片 */
	private Integer useCard;
	/** 阵营 */
	private Integer camp;
	/** 签 */
	private Integer sign;
	/** 实际身份描述 */
	private String identityDesc; 
	
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
	public Integer getUseCard() {
		return useCard;
	}
	public void setUseCard(Integer useCard) {
		this.useCard = useCard;
	}
	public Integer getCamp() {
		return camp;
	}
	public void setCamp(Integer camp) {
		this.camp = camp;
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
		
}
