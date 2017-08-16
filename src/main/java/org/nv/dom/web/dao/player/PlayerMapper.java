package org.nv.dom.web.dao.player;

import java.util.List;

import org.nv.dom.domain.player.PlayerInfo;
import org.nv.dom.domain.player.PlayerOpreation;
import org.nv.dom.domain.player.PlayerReplaceSkin;
import org.nv.dom.dto.player.ChangeStatusDTO;
import org.nv.dom.dto.player.SelectCharacterDTO;
import org.nv.dom.dto.player.SubmitOpreationDTO;
import org.springframework.stereotype.Repository;

@Repository
public interface PlayerMapper {
	
	public PlayerInfo getPlayerInfo(long userId);
	
	public int changePlayerStatus(ChangeStatusDTO changeStatusDTO);
	
	public PlayerOpreation getPlayerOpreation(long playerId);

	public int submitOpreationDao(SubmitOpreationDTO submitOpreationDTO);
	
	public List<PlayerReplaceSkin> getPlayerReplaceSkinDao(long playerId);
	
	public int consumeUserCardDao(SelectCharacterDTO selectCharacterDTO); 

}
