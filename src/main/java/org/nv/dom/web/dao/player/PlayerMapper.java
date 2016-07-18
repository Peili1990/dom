package org.nv.dom.web.dao.player;

import org.nv.dom.domain.player.PlayerInfo;
import org.nv.dom.dto.player.ChangeStatusDTO;
import org.springframework.stereotype.Repository;

@Repository
public interface PlayerMapper {
	
	public PlayerInfo getPlayerInfo(long playerId);
	
	public int changePlayerStatus(ChangeStatusDTO changeStatusDTO);

}
