package org.nv.dom.web.aop;


/**
 * Class NVException.java
 *
 * @author liyisen
 * @title NVException.java
 * @Date 2017年8月11日
 */

public class NVException extends Exception{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private Integer code;
	
	private String message;

	public Integer getCode() {
		return code;
	}

	public void setCode(Integer code) {
		this.code = code;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public NVException(Integer code, String message) {
		super();
		this.code = code;
		this.message = message;
	}	

}
