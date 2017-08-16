package org.nv.dom.dto.message;

import org.nv.dom.dto.BaseDTO;

public class GetChatRecordDTO extends BaseDTO{
	
	private String chatId;
	private long userId;
	
	public String getChatId() {
		return chatId;
	}
	public void setChatId(String chatId) {
		this.chatId = chatId;
	}
	public long getUserId() {
		return userId;
	}
	public void setUserId(long userId) {
		this.userId = userId;
	}
	
	
	
	

}
