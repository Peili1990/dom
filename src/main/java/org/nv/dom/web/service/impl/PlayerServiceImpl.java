package org.nv.dom.web.service.impl;

import org.nv.dom.config.NVTermConstant;
import org.nv.dom.domain.player.PlayerInfo;
import org.nv.dom.enums.IdentityCode;
import org.nv.dom.web.dao.player.PlayerMapper;
import org.nv.dom.web.service.PlayerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("playerServiceImpl")
public class PlayerServiceImpl implements PlayerService {
	
	@Autowired
	PlayerMapper playerMapper;

	@Override
	public PlayerInfo getPlayerInfo(long playerId) {
		PlayerInfo playerInfo = playerMapper.getPlayerInfo(playerId);
		if(playerInfo == null){
			return null;
		}
		playerInfo.setCharacterName(playerInfo.getIsSp().equals(NVTermConstant.IS_SP) ? 
				"sp"+playerInfo.getCharacterName():playerInfo.getCharacterName());
		return playerInfo;
	}
	
	

}
