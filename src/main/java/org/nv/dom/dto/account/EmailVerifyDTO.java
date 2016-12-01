/**
 * com.rightoo.dto
 * EmailVerifyDTO.java
 * 2014年11月6日 下午5:59:01
 * @author: z```s
 */
package org.nv.dom.dto.account;

/**
 * <p></p>
 * 2014年11月6日 下午5:59:01
 * @author: z```s
 */
public class EmailVerifyDTO {

	//用户ID
	private String uu;
	//邮箱
	private String ee;
	//时间
	private String tt;
	//验证类型
	private String verifyType;
	/**
	 * @return the uu
	 */
	public final String getUu() {
		return uu;
	}
	/**
	 * @param uu the uu to set
	 */
	public final void setUu(String uu) {
		this.uu = uu;
	}
	/**
	 * @return the ee
	 */
	public final String getEe() {
		return ee;
	}
	/**
	 * @param ee the ee to set
	 */
	public final void setEe(String ee) {
		this.ee = ee;
	}
	/**
	 * @return the tt
	 */
	public final String getTt() {
		return tt;
	}
	/**
	 * @param tt the tt to set
	 */
	public final void setTt(String tt) {
		this.tt = tt;
	}
	public String getVerifyType() {
		return verifyType;
	}
	public void setVerifyType(String verifyType) {
		this.verifyType = verifyType;
	}
	
}
