package org.nv.dom.web.controller;

import java.util.Map;

import org.nv.dom.dto.game.ApplyDTO;
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

}
