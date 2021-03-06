package org.nv.dom.web.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.nv.dom.config.PageParamType;
import org.nv.dom.domain.user.User;
import org.nv.dom.dto.message.GetCurDaySpeechListDTO;
import org.nv.dom.dto.message.GetSpeechListDTO;
import org.nv.dom.util.json.JacksonJSONUtils;
import org.nv.dom.web.service.AssembleService;
import org.nv.dom.web.service.EssayService;
import org.nv.dom.web.service.PlayerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AssembleController extends BaseController {
	
	@Autowired
	AssembleService assembleService;
	
	@Autowired
	PlayerService playerService;
	
	@Autowired
	EssayService essayService;
		
	@RequestMapping(value = "/assemble", method = RequestMethod.GET)
	public ModelAndView assembleView(@Param(value = "gameId")Long gameId,HttpSession session) throws Exception {
		ModelAndView mav = new ModelAndView("assemble/assemble");
		User user = (User) session.getAttribute(PageParamType.user_in_session);
		mav.addObject("playerInfoStr",JacksonJSONUtils.beanToJSON(playerService.getPlayerInfoByUserId(user.getId())));
		mav.addAllObjects(assembleService.getNewspaperList(user.getId(),gameId));
		mav.addObject("replayEssay",essayService.getReplayEssay(user.getId(),gameId));		
		mav.addAllObjects(basicService.getSessionUserService(session));
		return mav;
	}
	
	@ResponseBody
	@RequestMapping(value = "/getAssembleDetail", method = RequestMethod.POST)
	public Map<String, Object> getNewspaperDetail(@ModelAttribute("getSpeechListDTO") GetSpeechListDTO getSpeechListDTO, HttpSession session) {
		User user = (User) session.getAttribute(PageParamType.user_in_session);
		getSpeechListDTO.setUserId(user.getId());	
		Map<String, Object> result = assembleService.getNewspaperDetail(getSpeechListDTO);
		if(session.getAttribute(PageParamType.player_id_in_session)!=null){
			result.putAll(playerService.getPlayerReplaceSkin((long) session.getAttribute(PageParamType.player_id_in_session)));
		}
		return result;	
	}
	
	@ResponseBody
	@RequestMapping(value = "/wordCount", method = RequestMethod.POST)
	public Map<String, Object> wordCount(@ModelAttribute("getCurDayListDTO") GetCurDaySpeechListDTO getCurDaySpeechListDTO, HttpSession session) {
		getCurDaySpeechListDTO.setPlayerId((long) session.getAttribute(PageParamType.player_id_in_session));
		return assembleService.wordCount(getCurDaySpeechListDTO);
	}

}
