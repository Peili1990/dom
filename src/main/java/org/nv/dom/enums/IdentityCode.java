package org.nv.dom.enums;

public enum IdentityCode {
	
	NONE(0,"未发放"),
	POLICE(1,"警察"),
	OFFICER(2,"官员"),
	ASSASSIN(3,"刺客"),
	DOCTER(4,"医生"),
	PRIEST(5,"牧师"),
	CIVILIAN(6,"平民"),
	PIONEER(7,"先驱"),
	KILLER(8,"杀手"),
	MOB(9,"暴徒"),
	SPY(10,"间谍"),
	THIEF(11,"小偷"),
	WIZARD(12,"巫师"),
	GANG(13,"帮众");
	
	private final Integer code;
	private final String message;
	
	private IdentityCode(Integer _code, String _message) {
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
		for (IdentityCode _enum : values()) {
			if (code.equals(_enum.getCode())) {
				return _enum.getMessage();
			}
		}
		return null;
	}
	
	

}


