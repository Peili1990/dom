package org.nv.dom.web.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.nv.dom.config.PageParamType;
import org.nv.dom.domain.message.OfflineMessage;
import org.nv.dom.domain.user.User;
import org.nv.dom.dto.user.UpdateUserProfileDTO;
import org.nv.dom.web.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;




@Controller
public class UserController extends BaseController{
	
	@Autowired
	UserService userService;
	
	@RequestMapping(value = "/mine", method = RequestMethod.GET)
	public ModelAndView mineView(HttpSession session){
		ModelAndView mav = new ModelAndView("mine/mine");
		mav.addAllObjects(basicService.getSessionUserService(session));
		return mav;
	}
	
	@RequestMapping(value = "/getOfflineMessage", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> getOfflineMessage(HttpSession session){
		User user = (User) session.getAttribute(PageParamType.user_in_session);
		return userService.getOfflineMessage(user.getId());
	}
	
	@ResponseBody
	@RequestMapping(value = "/saveOfflineSpeech", method = RequestMethod.POST)
	public Map<String, Object> saveOfflineSpeech(@ModelAttribute("offlineMessage") OfflineMessage offlineMessage , HttpSession session) {
		User user = (User) session.getAttribute(PageParamType.user_in_session);
		offlineMessage.setUserId(user.getId());
		return userService.saveOfflineSpeech(offlineMessage);
	}
	
	@ResponseBody
	@RequestMapping(value = "/avatarUpload", method = RequestMethod.POST)
	public Map<String, Object> avatarUploadAction(@ModelAttribute("updateUserProfileDTO") UpdateUserProfileDTO updateUserProfileDTO , HttpSession session) {
		User user = (User) session.getAttribute(PageParamType.user_in_session);
		updateUserProfileDTO.setUserId(user.getId());
		Map<String, Object> result = userService.avatarUpload(updateUserProfileDTO);
		if((int)result.get("status")==1){
			user.setAvatar((String) result.get("avatar"));
			session.setAttribute(PageParamType.user_in_session, user);
		}
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value = "/updateProfile", method = RequestMethod.POST)
	public Map<String, Object> updateMotto(@ModelAttribute("updateUserProfileDTO") UpdateUserProfileDTO updateUserProfileDTO , HttpSession session) {
		User user = (User) session.getAttribute(PageParamType.user_in_session);
		updateUserProfileDTO.setUserId(user.getId());
		Map<String, Object> result = userService.updateProfile(updateUserProfileDTO);
		if((int)result.get("status")==1){
			user.setMotto((String) result.get("motto"));
			user.setQq((String) result.get("qq"));
			session.setAttribute(PageParamType.user_in_session, user);
		}
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value = "/getPlayerData", method = RequestMethod.POST)
	public Map<String, Object> getPlayerData(HttpSession session) {
		User user = (User) session.getAttribute(PageParamType.user_in_session);		
		return userService.getPlayerData(user.getId());
	}
	
	@ResponseBody
	@RequestMapping(value = "/getUserCardList", method = RequestMethod.POST)
	public Map<String, Object> getUserCardList(HttpSession session) {
		User user = (User) session.getAttribute(PageParamType.user_in_session);		
		return userService.getUserCardList(user.getId());
	}
	
	@ResponseBody
	@RequestMapping(value = "/getUserCardStatus", method = RequestMethod.POST)
	public Map<String, Object> getUserCardStatus(HttpSession session) {
		User user = (User) session.getAttribute(PageParamType.user_in_session);		
		return userService.getUserCardStatus(user.getId());
	}

}
