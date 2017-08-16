package org.nv.dom.enums;

public enum CardType {
	
	NONE(0,"无"),
	IDENTITY(1,"身份卡"),
	CAMP(2,"阵营卡"),
	PRIVILEGE(3,"特权卡"),
	PIONEER(4,"先驱卡");
	
	private final Integer code;
	private final String message;
	
	private CardType(Integer _code, String _message) {
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
		for (CardType _enum : values()) {
			if (code.equals(_enum.getCode())) {
				return _enum.getMessage();
			}
		}
		return null;
	}

}
