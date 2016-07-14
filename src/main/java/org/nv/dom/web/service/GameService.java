package org.nv.dom.web.service;


import java.util.Map;

import org.nv.dom.dto.game.ApplyDTO;
import org.nv.dom.dto.player.GetCharacterListDTO;

public interface GameService {
	
	public Map<String, Object> getApplyingGames();
	
	public Map<String, Object> applyForGame(ApplyDTO applyDTO);
	
	public Map<String, Object> getCharacterListThree(GetCharacterListDTO getCharacterListDTO);


}
