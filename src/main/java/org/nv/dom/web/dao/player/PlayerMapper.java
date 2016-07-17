package org.nv.dom.web.dao.player;

import org.nv.dom.domain.player.PlayerInfo;
import org.springframework.stereotype.Repository;

@Repository
public interface PlayerMapper {
	
	public PlayerInfo getPlayerInfo(long playerId);

}
