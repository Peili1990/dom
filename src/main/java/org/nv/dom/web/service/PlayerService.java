package org.nv.dom.web.service;

import java.util.Map;

import org.nv.dom.domain.player.PlayerInfo;
import org.nv.dom.dto.player.SubmitOpreationDTO;

public interface PlayerService {
	
	public PlayerInfo getPlayerInfoByUserId(long userId);
	
	public Map<String, Object> getPlayerOpreation(long playerId);
	
	public Map<String, Object> submitOpreation(SubmitOpreationDTO submitOpreationDTO);
	
	public Map<String, Object> getPlayerReplaceSkin(long playerId);

}
