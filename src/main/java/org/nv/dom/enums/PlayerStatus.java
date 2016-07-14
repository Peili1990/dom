package org.nv.dom.enums;

public enum PlayerStatus {
	
	APPLIED(0,"已报名"),
	CHARACTER_SELECTING(1,"待选角色"),
	CHARACTER_SELECTING_THREE(2,"待3选1"),
	CHARACTER_SELECTED(3,"已选角色"),
	INDENTITY_KNOWN(4,"已有身份");
	
	private final Integer code;
	private final String message;
	
	private PlayerStatus(Integer _code, String _message) {
		this.code = _code;
		this.message = _message;
	}
	public Integer getCode() {
		return code;
	}
	public String getMessage() {
		return message;
	}
	
	/**
	 * 通过枚举code获取对应的message
	 * @return 取不到时返回null
	 * @create 2015-6-8 下午3:41:47
	 * @author 玄玉<http://blog.csdn.net/jadyer>
	 */
	public static String getMessageByCode(Integer code) {
		for (PlayerStatus _enum : values()) {
			if (code.equals(_enum.getCode())) {
				return _enum.getMessage();
			}
		}
		return null;
	}
	
	

}
