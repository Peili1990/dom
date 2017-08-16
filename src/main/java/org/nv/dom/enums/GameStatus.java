package org.nv.dom.enums;

public enum GameStatus {
	
	CANCELED(0,"已取消"),
	APPLYING(1,"报名中"),
	APPLY_END(2,"报名结束"),
	READY(3,"游戏开始前"),
	PROCEEDING(4,"进行中"),
	REPLAYING(5,"复盘中"),
	FINISHED(9,"已结束");
	
	private final Integer code;
	private final String message;
	
	private GameStatus(Integer _code, String _message) {
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
		for (GameStatus _enum : values()) {
			if (code.equals(_enum.getCode())) {
				return _enum.getMessage();
			}
		}
		return null;
	}
	
	

}
