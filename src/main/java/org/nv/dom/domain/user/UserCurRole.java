package org.nv.dom.domain.user;

public class UserCurRole {
	
	
	/** 用户Id */
	private long userId;
	/** 用户昵称 */
	private String userNickName;
	/** 用户对应玩家Id */
	private long playerId;
	/** 玩家当前状态 */
	private Integer status;
	/** 用户当前角色 */
	private String userCurRole;
	/** 游戏Id */
	private long gameId;
	/** 游戏名称 */
	private String gameDesc;
	/** 游戏状态 */
	private String gameStatus;
	public long getUserId() {
		return userId;
	}
	public void setUserId(long userId) {
		this.userId = userId;
	}
	public String getUserNickName() {
		return userNickName;
	}
	public void setUserNickName(String userNickName) {
		this.userNickName = userNickName;
	}
	public long getPlayerId() {
		return playerId;
	}
	public void setPlayerId(long playerId) {
		this.playerId = playerId;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public String getUserCurRole() {
		return userCurRole;
	}
	public void setUserCurRole(String userCurRole) {
		this.userCurRole = userCurRole;
	}
	public long getGameId() {
		return gameId;
	}
	public void setGameId(long gameId) {
		this.gameId = gameId;
	}
	public String getGameDesc() {
		return gameDesc;
	}
	public void setGameDesc(String gameDesc) {
		this.gameDesc = gameDesc;
	}
	public String getGameStatus() {
		return gameStatus;
	}
	public void setGameStatus(String gameStatus) {
		this.gameStatus = gameStatus;
	}

}
