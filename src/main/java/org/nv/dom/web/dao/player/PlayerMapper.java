package org.nv.dom.web.dao.player;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.nv.dom.domain.player.PlayerInfo;
import org.nv.dom.domain.player.PlayerOperationRecord;
import org.nv.dom.domain.player.PlayerReplaceSkin;
import org.nv.dom.dto.player.ChangeStatusDTO;
import org.nv.dom.dto.player.SelectCharacterDTO;
import org.nv.dom.dto.player.SubmitOpreationDTO;
import org.springframework.stereotype.Repository;

@Repository
public interface PlayerMapper {
	
	public PlayerInfo getPlayerInfo(long userId);
	
	public int changePlayerStatus(ChangeStatusDTO changeStatusDTO);
	
	public PlayerOperationRecord getPlayerOpreation(long playerId);

	public int submitOpreationDao(SubmitOpreationDTO submitOpreationDTO);
	
	public List<PlayerReplaceSkin> getPlayerReplaceSkinDao(long playerId);
	
	public int consumeUserCardDao(SelectCharacterDTO selectCharacterDTO); 
	
	public List<PlayerOperationRecord> getPlayerOperationRecord(long gameId);
	
	public int updateTest(@Param("list")List<Long> playerIds,@Param("playerId")Long playerId);

}
