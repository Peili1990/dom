package org.nv.dom.web.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.nv.dom.config.PageParamType;
import org.nv.dom.domain.essay.Essay;
import org.nv.dom.domain.user.User;
import org.nv.dom.dto.essay.UpdateEssayStatusDTO;
import org.nv.dom.dto.essay.GetEssayListDTO;
import org.nv.dom.dto.essay.SubmitCommentDTO;
import org.nv.dom.web.service.EssayService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class EssayController {
	
	@Autowired
	EssayService essayService;

	@ResponseBody
	@RequestMapping(value = "/publishEssay", method = RequestMethod.POST)
	public Map<String, Object> publish(@ModelAttribute("essay") Essay essay, HttpSession session) {
		User user = (User) session.getAttribute(PageParamType.user_in_session);
		essay.setUserId(user.getId());
		return essayService.publishEssay(essay);
	} 
	
	@ResponseBody
	@RequestMapping(value = "/getEssayDetail", method = RequestMethod.POST)
	public Map<String, Object> getEssayDetail(@RequestParam("essayId") long essayId, HttpSession session) {
		return essayService.getEssayDetail(essayId);
	}
	
	@ResponseBody
	@RequestMapping(value = "/submitComment", method = RequestMethod.POST)
	public Map<String, Object> submitComment(@ModelAttribute("submitCommentDTO") SubmitCommentDTO submitCommentDTO, HttpSession session) {
		User user = (User) session.getAttribute(PageParamType.user_in_session);
		submitCommentDTO.setUserId(user.getId());
		return essayService.submitComment(submitCommentDTO);
	}
	
	@ResponseBody
	@RequestMapping(value = "/getEssayList", method = RequestMethod.POST)
	public Map<String, Object> getEssayList(@ModelAttribute("getEssayListDTO") GetEssayListDTO getEssayListDTO,HttpSession session) {
		return essayService.getEssayList(getEssayListDTO);
	}
	
	@ResponseBody
	@RequestMapping(value = "/deleteEssay", method = RequestMethod.POST)
	public Map<String, Object> deleteEssay(@ModelAttribute("updateEssayStatusDTO") UpdateEssayStatusDTO updateEssayStatusDTO,HttpSession session) {
		User user = (User) session.getAttribute(PageParamType.user_in_session);
		updateEssayStatusDTO.setUserId(user.getId());
		return essayService.updateEssayStatus(updateEssayStatusDTO);
	}

}
