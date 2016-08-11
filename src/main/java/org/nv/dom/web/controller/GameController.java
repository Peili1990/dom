package org.nv.dom.web.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.nv.dom.config.PageParamType;
import org.nv.dom.domain.user.User;
import org.nv.dom.dto.game.ApplyDTO;
import org.nv.dom.dto.player.GetCharacterListDTO;
import org.nv.dom.dto.player.SelectCharacterDTO;
import org.nv.dom.dto.player.SubmitOpreationDTO;
import org.nv.dom.web.service.GameService;
import org.nv.dom.web.service.PlayerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping(value = "/game")
public class GameController extends BaseController{
	
	@Autowired
	GameService gameService;
	
	@Autowired
	PlayerService playerService;
	
	
	@ResponseBody
	@RequestMapping(value = "/getApplyingGames", method = RequestMethod.POST)
	public Map<String,Object> getApplyingGames(){
		return gameService.getApplyingGames();
	}
	
	@ResponseBody
	@RequestMapping(value = "/apply", method = RequestMethod.POST)
	public Map<String,Object> apply(@ModelAttribute("applyDTO") ApplyDTO applyDTO, HttpSession session){
		User user = (User)session.getAttribute(PageParamType.user_in_session);
		applyDTO.setUserId(user.getId());
		return gameService.applyForGame(applyDTO);
	}
	
	@ResponseBody
	@RequestMapping(value = "/getCharacterListThree", method = RequestMethod.POST)
	public Map<String,Object> getCurStatus(@ModelAttribute("getCharacterListDTO") GetCharacterListDTO getCharacterListDTO, HttpSession session){
		getCharacterListDTO.setGameId((long) session.getAttribute(PageParamType.game_id_in_session));
		getCharacterListDTO.setPlayerId((long) session.getAttribute(PageParamType.game_id_in_session));
		return gameService.getCharacterListThree(getCharacterListDTO);
	}
	
	@ResponseBody
	@RequestMapping(value = "/selectCharacter", method = RequestMethod.POST)
	public Map<String,Object> selectCharacter(@ModelAttribute("selectCharacterDTO") SelectCharacterDTO selectCharacterDTO, HttpSession session){
		selectCharacterDTO.setPlayerId((long) session.getAttribute(PageParamType.player_id_in_session));
		selectCharacterDTO.setGameId((long) session.getAttribute(PageParamType.game_id_in_session));
		return gameService.selectCharacter(selectCharacterDTO);
	}
	
	@ResponseBody
	@RequestMapping(value = "/submitOpreation", method = RequestMethod.POST)
	public Map<String, Object> submitOpreation(@ModelAttribute("submitOpreationDTO") SubmitOpreationDTO submitOpreationDTO, HttpSession session){
		submitOpreationDTO.setPlayerId((long) session.getAttribute(PageParamType.player_id_in_session));
		return playerService.submitOpreation(submitOpreationDTO);
	}
	
	@ResponseBody
	@RequestMapping(value = "/getPlayerOpreation", method = RequestMethod.POST)
	public Map<String, Object> getPlayerOpreation(HttpSession session){
		Long playerId = (long) session.getAttribute(PageParamType.player_id_in_session);
		return playerService.getPlayerOpreation(playerId);
	}

}
