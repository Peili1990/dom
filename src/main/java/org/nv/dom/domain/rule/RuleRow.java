package org.nv.dom.domain.rule;

import java.util.List;

public class RuleRow {
	
	private Integer chapterId;
	private String chapter;
	private String content;
	private List<RuleIndex> indexs;
	public Integer getChapterId() {
		return chapterId;
	}
	public void setChapterId(Integer chapterId) {
		this.chapterId = chapterId;
	}
	public String getChapter() {
		return chapter;
	}
	public void setChapter(String chapter) {
		this.chapter = chapter;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public List<RuleIndex> getIndexs() {
		return indexs;
	}
	public void setIndexs(List<RuleIndex> indexs) {
		this.indexs = indexs;
	}
	
	

}
