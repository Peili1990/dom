package org.nv.dom.web.dao.statistic;

import org.nv.dom.domain.player.PlayerData;
import org.springframework.stereotype.Repository;

@Repository
public interface StatisticMapper {
	
	public PlayerData getPlayerDataDao(long userId);
	
	public Integer getTotalPlayTimes(long userId);
	
	public Integer getGoodCampTimes(long userId);
	
	public Integer getKillerCampTimes(long userId);
	
	public Integer getGoodCampWinTimes(long userId);
	
	public Integer getKillerCampWinTimes(long userId);
	
	public Integer getTiedTimes(long userId);
	
	

}
