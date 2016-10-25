package org.nv.dom.dto.essay;

public class UpdateEssayStatusDTO {
	
	private long essayId;
	private long userId;
	private long status;
	public long getEssayId() {
		return essayId;
	}
	public void setEssayId(long essayId) {
		this.essayId = essayId;
	}
	public long getUserId() {
		return userId;
	}
	public void setUserId(long userId) {
		this.userId = userId;
	}
	public long getStatus() {
		return status;
	}
	public void setStatus(long status) {
		this.status = status;
	}
	
	
	

}
