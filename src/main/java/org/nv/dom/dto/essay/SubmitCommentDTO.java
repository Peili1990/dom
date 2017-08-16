package org.nv.dom.dto.essay;

public class SubmitCommentDTO {
	
	private long essayId;
	private long userId;
	private String content;
	private String createTime;
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
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getCreateTime() {
		return createTime;
	}
	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}
	
	

}
