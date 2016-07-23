package org.nv.dom.web.controller;

import java.util.Map;

import org.nv.dom.dto.game.ApplyDTO;
import org.nv.dom.dto.player.GetCharacterListDTO;
import org.nv.dom.dto.player.SelectCharacterDTO;
import org.nv.dom.dto.player.SubmitOpreationDTO;
import org.nv.dom.web.service.GameService;
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
	
	
	@ResponseBody
	@RequestMapping(value = "/getApplyingGames", method = RequestMethod.POST)
	public Map<String,Object> getApplyingGames(){
		return gameService.getApplyingGames();
	}
	
	@ResponseBody
	@RequestMapping(value = "/apply", method = RequestMethod.POST)
	public Map<String,Object> apply(@ModelAttribute("applyDTO") ApplyDTO applyDTO){
		return gameService.applyForGame(applyDTO);
	}
	
	@ResponseBody
	@RequestMapping(value = "/getCharacterListThree", method = RequestMethod.POST)
	public Map<String,Object> getCurStatus(@ModelAttribute("getCharacterListDTO") GetCharacterListDTO getCharacterListDTO){
		return gameService.getCharacterListThree(getCharacterListDTO);
	}
	
	@ResponseBody
	@RequestMapping(value = "/selectCharacter", method = RequestMethod.POST)
	public Map<String,Object> selectCharacter(@ModelAttribute("selectCharacterDTO") SelectCharacterDTO selectCharacterDTO){
		return gameService.selectCharacter(selectCharacterDTO);
	}
	
	@ResponseBody
	@RequestMapping(value = "/submitOpreation", method = RequestMethod.POST)
	public Map<String, Object> submitOpreation(@ModelAttribute("submitOpreationDTO") SubmitOpreationDTO submitOpreationDTO){
		return gameService.submitOpreation(submitOpreationDTO);
	}

}
