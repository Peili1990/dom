package org.nv.dom.web.service;

import java.util.Map;

import org.nv.dom.domain.player.PlayerInfo;

public interface PlayerService {
	
	public PlayerInfo getPlayerInfo(long playerId);
	
	public Map<String, Object> getPlayerOpreation(long playerId);

}
