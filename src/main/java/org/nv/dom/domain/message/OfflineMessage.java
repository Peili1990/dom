package org.nv.dom.domain.message;

public class OfflineMessage {
	
	private long userId;
	private long speechId;
	private long newspaperId;
	public long getUserId() {
		return userId;
	}
	public void setUserId(long userId) {
		this.userId = userId;
	}
	public long getSpeechId() {
		return speechId;
	}
	public void setSpeechId(long speechId) {
		this.speechId = speechId;
	}
	public long getNewspaperId() {
		return newspaperId;
	}
	public void setNewspaperId(long newspaperId) {
		this.newspaperId = newspaperId;
	}

}
