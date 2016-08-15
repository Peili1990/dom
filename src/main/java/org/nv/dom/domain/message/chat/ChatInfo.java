package org.nv.dom.domain.message.chat;

public class ChatInfo {
	
	private String chatId;
	private long fromUserId;
	private long toUserId;
	private String toUserNickname;
	private String toUserAvatar;
	private String toUserMotto;
	private long toPlayerId;
	public String getChatId() {
		return chatId;
	}
	public void setChatId(String chatId) {
		this.chatId = chatId;
	}
	public long getFromUserId() {
		return fromUserId;
	}
	public void setFromUserId(long fromUserId) {
		this.fromUserId = fromUserId;
	}
	public long getToUserId() {
		return toUserId;
	}
	public String getToUserNickname() {
		return toUserNickname;
	}
	public void setToUserNickname(String toUserNickname) {
		this.toUserNickname = toUserNickname;
	}
	public String getToUserAvatar() {
		return toUserAvatar;
	}
	public void setToUserAvatar(String toUserAvatar) {
		this.toUserAvatar = toUserAvatar;
	}
	public String getToUserMotto() {
		return toUserMotto;
	}
	public void setToUserMotto(String toUserMotto) {
		this.toUserMotto = toUserMotto;
	}
	public void setToUserId(long toUserId) {
		this.toUserId = toUserId;
	}
	public long getToPlayerId() {
		return toPlayerId;
	}
	public void setToPlayerId(long toPlayerId) {
		this.toPlayerId = toPlayerId;
	}
	
	

}
