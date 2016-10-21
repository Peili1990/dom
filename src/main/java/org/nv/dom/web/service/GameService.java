package org.nv.dom.web.service;


import java.util.Map;

import org.nv.dom.dto.game.ApplyDTO;
import org.nv.dom.dto.player.GetCharacterListDTO;
import org.nv.dom.dto.player.SelectCharacterDTO;

public interface GameService {
	
	public Map<String, Object> getApplyingGames();
	
	public Map<String, Object> getAllGames();
	
	public Map<String, Object> applyForGame(ApplyDTO applyDTO);
	
	public Map<String, Object> getCharacterListThree(GetCharacterListDTO getCharacterListDTO);

	public Map<String, Object> selectCharacter(SelectCharacterDTO selectCharacterDTO);
	
}
