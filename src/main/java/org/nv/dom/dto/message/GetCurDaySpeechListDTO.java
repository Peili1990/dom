package org.nv.dom.dto.message;


/**
 * Class GetCurDaySpeechListDTO.java
 *
 * @author liyisen
 * @title GetCurDaySpeechListDTO.java
 * @Date 2017年2月28日
 */

public class GetCurDaySpeechListDTO {
	
	private long playerId;
	
	private long newspaperId;
	
	private String content;

	public long getPlayerId() {
		return playerId;
	}

	public void setPlayerId(long playerId) {
		this.playerId = playerId;
	}

	public long getNewspaperId() {
		return newspaperId;
	}

	public void setNewspaperId(long newspaperId) {
		this.newspaperId = newspaperId;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

}
