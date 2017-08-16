package org.nv.dom.dto.player;

public class ChangeStatusDTO {
	
	private long playerId;
	private Integer status;
	public long getPlayerId() {
		return playerId;
	}
	public void setPlayerId(long playerId) {
		this.playerId = playerId;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
			
}
