package org.nv.dom.domain.character;

public class NVCharacter {
	
	/** 角色Id */
	private int id;
	/** 角色名称 */
	private String name;
	/** 角色头像 */
	private String avatar;
	/** 是否有sp */
	private String hasSp;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAvatar() {
		return avatar;
	}
	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}
	public String getHasSp() {
		return hasSp;
	}
	public void setHasSp(String hasSp) {
		this.hasSp = hasSp;
	}
}
