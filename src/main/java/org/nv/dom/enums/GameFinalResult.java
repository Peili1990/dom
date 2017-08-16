package org.nv.dom.enums;

public enum GameFinalResult {
	
	GOOD_CAMP_WIN(1,"好人方胜"),
	KILL_CAMP_WIN(2,"杀手方胜"),
	CONTRACT_CAMP_WIN(3,"契约方胜"),
	TIED(4,"平局"),
	CANCELED(9,"流局");
	
	private final Integer code;
	private final String message;
	
	private GameFinalResult(Integer _code, String _message) {
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
		for (GameFinalResult _enum : values()) {
			if (code.equals(_enum.getCode())) {
				return _enum.getMessage();
			}
		}
		return null;
	}
	
	

}
