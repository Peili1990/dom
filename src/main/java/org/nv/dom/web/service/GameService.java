package org.nv.dom.web.service;


import java.util.Map;

import org.nv.dom.dto.game.ApplyDTO;

public interface GameService {
	
	public Map<String, Object> getApplyingGames();
	
	public Map<String, Object> applyForGame(ApplyDTO applyDTO);


}
