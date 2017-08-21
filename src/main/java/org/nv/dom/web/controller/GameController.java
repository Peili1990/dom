package org.nv.dom.web.controller;

import java.util.List;
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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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
	@RequestMapping(value = "/getAllGames", method = RequestMethod.POST)
	public Map<String,Object> getAllGames(){
		return gameService.getAllGames();
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
	@RequestMapping(value = "/queryCharacter", method = RequestMethod.POST)
	public Map<String,Object> queryCharacter(@ModelAttribute("selectCharacterDTO") SelectCharacterDTO selectCharacterDTO, HttpSession session){
		selectCharacterDTO.setGameId((long) session.getAttribute(PageParamType.game_id_in_session));
		return gameService.queryCharacter(selectCharacterDTO);
	}
	
	@ResponseBody
	@RequestMapping(value = "/submitOperation", method = RequestMethod.POST)
	public Map<String, Object> submitOperation(@RequestBody List<SubmitOpreationDTO> submitOpreationDTO, HttpSession session){
		long playerId = (long) session.getAttribute(PageParamType.player_id_in_session);
		long gameId = (long) session.getAttribute(PageParamType.game_id_in_session);
		return playerService.submitOpreation(submitOpreationDTO, playerId , gameId);
	}
	
	@ResponseBody
	@RequestMapping(value = "/getPlayerOpreation", method = RequestMethod.POST)
	public Map<String, Object> getPlayerOpreation(HttpSession session){
		long playerId = (long) session.getAttribute(PageParamType.player_id_in_session);
		long gameId = (long) session.getAttribute(PageParamType.game_id_in_session); 
		return playerService.getPlayerOpreation(playerId, gameId);
	}
	
	@ResponseBody
	@RequestMapping(value = "/getOpreationTarget", method = RequestMethod.POST)
	public Map<String, Object> getOpreationTarget(@RequestParam("type")Integer type, HttpSession session){
		long gameId = (long) session.getAttribute(PageParamType.game_id_in_session); 
		return gameService.getOpreationTarget(gameId,type);
	}

}
