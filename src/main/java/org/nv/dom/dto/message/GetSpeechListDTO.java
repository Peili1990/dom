package org.nv.dom.dto.message;

public class GetSpeechListDTO {
	
	private long userId;
	private long newspaperId;
	public long getUserId() {
		return userId;
	}
	public void setUserId(long userId) {
		this.userId = userId;
	}
	public long getNewspaperId() {
		return newspaperId;
	}
	public void setNewspaperId(long newspaperId) {
		this.newspaperId = newspaperId;
	}

}
