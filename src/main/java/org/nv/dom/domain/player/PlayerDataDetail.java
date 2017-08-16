package org.nv.dom.domain.player;

public class PlayerDataDetail {
	
	private String description;
	private String value;
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getValue() {
		return value;
	}
	public void setValue(String value) {
		this.value = value;
	}
	
	
	public PlayerDataDetail() {
		super();
	}
	
	public PlayerDataDetail(String description, String value) {
		super();
		this.description = description;
		this.value = value;
	}
	
	

}
