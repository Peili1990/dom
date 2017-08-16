package org.nv.dom.dto.player;

public class SubmitOpreationDTO {
	
	/** 玩家id */
	private long playerId;
	/** 行动 */
	private String action;
	/** 特权 */
	private String privilege;
	/** 投票 */
	private String vote;
	public long getPlayerId() {
		return playerId;
	}
	public void setPlayerId(long playerId) {
		this.playerId = playerId;
	}
	public String getAction() {
		return action;
	}
	public void setAction(String action) {
		this.action = action;
	}
	public String getPrivilege() {
		return privilege;
	}
	public void setPrivilege(String privilege) {
		this.privilege = privilege;
	}
	public String getVote() {
		return vote;
	}
	public void setVote(String vote) {
		this.vote = vote;
	}
	
	

}
