package org.nv.dom.domain.player;

public class PlayerData {
	
	private long userId;
	/** 总登场次数 */
	private Integer totalPlayTimes;
	/** 好人方次数 */
	private Integer goodCampTimes;
	/** 杀手方次数 */
	private Integer killerCampTimes;
	/** 契约方次数 */
	private Integer contractCampTimes;
	/** 好人方胜利次数 */
	private Integer goodCampWinTimes;
	/** 杀手方胜利次数 */
	private Integer killerCampWinTimes;
	/** 胜利次数 */
	private Integer contractCampWinTimes;
	/** 平局次数 */
	private Integer tiedTimes;
	public long getUserId() {
		return userId;
	}
	public void setUserId(long userId) {
		this.userId = userId;
	}
	public Integer getTotalPlayTimes() {
		return totalPlayTimes;
	}
	public void setTotalPlayTimes(Integer totalPlayTimes) {
		this.totalPlayTimes = totalPlayTimes;
	}
	public Integer getGoodCampTimes() {
		return goodCampTimes;
	}
	public void setGoodCampTimes(Integer goodCampTimes) {
		this.goodCampTimes = goodCampTimes;
	}
	public Integer getKillerCampTimes() {
		return killerCampTimes;
	}
	public void setKillerCampTimes(Integer killerCampTimes) {
		this.killerCampTimes = killerCampTimes;
	}
	public Integer getContractCampTimes() {
		return contractCampTimes;
	}
	public void setContractCampTimes(Integer contractCampTimes) {
		this.contractCampTimes = contractCampTimes;
	}
	public Integer getGoodCampWinTimes() {
		return goodCampWinTimes;
	}
	public void setGoodCampWinTimes(Integer goodCampWinTimes) {
		this.goodCampWinTimes = goodCampWinTimes;
	}
	public Integer getKillerCampWinTimes() {
		return killerCampWinTimes;
	}
	public void setKillerCampWinTimes(Integer killerCampWinTimes) {
		this.killerCampWinTimes = killerCampWinTimes;
	}
	public Integer getContractCampWinTimes() {
		return contractCampWinTimes;
	}
	public void setContractCampWinTimes(Integer contractCampWinTimes) {
		this.contractCampWinTimes = contractCampWinTimes;
	}
	public Integer getTiedTimes() {
		return tiedTimes;
	}
	public void setTiedTimes(Integer tiedTimes) {
		this.tiedTimes = tiedTimes;
	}
	
	
	
}
