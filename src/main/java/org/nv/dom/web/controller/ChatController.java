package org.nv.dom.web.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.nv.dom.config.PageParamType;
import org.nv.dom.domain.user.User;
import org.nv.dom.dto.message.GetChatRecordDTO;
import org.nv.dom.util.StringUtil;
import org.nv.dom.web.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ChatController extends BaseController{
	
	@Autowired
	UserService userService;
	
	@RequestMapping(value = "/chat", method = RequestMethod.GET)
	public ModelAndView chatView(HttpSession session) throws Exception {
		ModelAndView mav = new ModelAndView("chat/chat");
		mav.addAllObjects(basicService.getSessionUserService(session));
		return mav;
	}
	
	@ResponseBody
	@RequestMapping(value = "/getChatInfo", method = RequestMethod.POST)
	public Map<String, Object> getChatInfo(@Param(value = "chatId")String chatId,HttpSession session){
		User user = (User) session.getAttribute(PageParamType.user_in_session);
		if(StringUtil.isNullOrEmpty(chatId)){
			return userService.getChatList(user.getId());
		} else {
			return userService.getChatInfo(chatId,String.valueOf(user.getId()));
		}
	}
	
	@ResponseBody
	@RequestMapping(value = "/getChatRecord", method = RequestMethod.POST)
	public Map<String, Object> getChatRecord(@ModelAttribute("getChatRecordDTO")GetChatRecordDTO getChatRecordDTO, HttpSession session){
		User user = (User) session.getAttribute(PageParamType.user_in_session);
		getChatRecordDTO.setUserId(user.getId());
		return userService.getChatRecord(getChatRecordDTO);
	}

}
