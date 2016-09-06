package org.nv.dom.web.service.impl;

import java.io.FileOutputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.codec.binary.Base64;
import org.apache.log4j.Logger;
import org.nv.dom.config.PageParamType;
import org.nv.dom.domain.message.OfflineMessage;
import org.nv.dom.domain.message.chat.ChatInfo;
import org.nv.dom.domain.message.chat.OfflineChat;
import org.nv.dom.domain.message.speech.OfflineSpeech;
import org.nv.dom.domain.user.User;
import org.nv.dom.domain.user.UserCurRole;
import org.nv.dom.dto.user.UpdateUserProfileDTO;
import org.nv.dom.util.ConfigUtil;
import org.nv.dom.web.dao.user.UserMapper;
import org.nv.dom.web.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service("userServiceImpl")
public class UserServiceImpl implements UserService {
	
	private static Logger logger = Logger.getLogger(UserServiceImpl.class);
	
	private String avatarPath = ConfigUtil.getVersionConfigProperty("img.filepath");
	
	@Autowired
	UserMapper userMapper;
	
	@Override
	public UserCurRole getUserCurRole(User user) {
		try{
			return userMapper.getUserCurRoleDao(user.getId());
		} catch (Exception e){
			logger.error(e.getMessage(), e);
			return null;
		}
	}

	@Override
	public Map<String, Object> getOfflineMessage(long userId) {
		Map<String, Object> result = new HashMap<String, Object>();
		try{
			List<OfflineSpeech> offlinespeech = userMapper.getOfflineSpeechDao(userId);
			List<OfflineChat> offlineChat = userMapper.getOfflineChatDao(userId);
			result.put("offlineSpeech",offlinespeech);
			result.put("offlineChat", offlineChat);
			result.put(PageParamType.BUSINESS_STATUS, 1);
			result.put(PageParamType.BUSINESS_MESSAGE, "获取离线消息数量成功");
		}catch(Exception e){
			logger.error(e.getMessage(),e);
			result.put(PageParamType.BUSINESS_STATUS, -1);
			result.put(PageParamType.BUSINESS_MESSAGE, "系统异常"); 
		}
		return result;
	}

	@Override
	public Map<String, Object> saveOfflineSpeech(OfflineMessage offlineMessage) {
		Map<String, Object> result = new HashMap<String, Object>();
		try{
			
			userMapper.saveOfflineMessageDao(offlineMessage);
			result.put(PageParamType.BUSINESS_STATUS, 1);
			result.put(PageParamType.BUSINESS_MESSAGE, "保存离线发言成功！");
		}catch(Exception e){
			result.put(PageParamType.BUSINESS_STATUS, -1);
			result.put(PageParamType.BUSINESS_MESSAGE, "系统异常");
		}
		return result;
	}

	@Override
	public Map<String, Object> getChatInfo(List<String> chatIdList, String userId) {
		Map<String, Object> result = new HashMap<String, Object>();
		List<Long> users = new ArrayList<>();
		for(String chatId : chatIdList){
			String[] temp = chatId.split("-");
			users.add(Long.parseLong(temp[0].equals(userId) ? temp[1] : temp[0]));
		}
		try{
			List<ChatInfo> chatList = null;
			if(!users.isEmpty()){
				chatList = userMapper.getChatInfoDao(users); 
			}
			result.put("chatList", chatList);
			result.put(PageParamType.BUSINESS_STATUS, 1);
			result.put(PageParamType.BUSINESS_MESSAGE, "获取聊天信息成功！");
		}catch(Exception e){
			result.put(PageParamType.BUSINESS_STATUS, -1);
			result.put(PageParamType.BUSINESS_MESSAGE, "系统异常");
		}
		return result;
	}

	@Override
	public Map<String, Object> avatarUpload(UpdateUserProfileDTO updateUserProfileDTO) {
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			String base64Str = updateUserProfileDTO.getAvatarFile().replace("data:image/jpeg;base64,", "");
			byte[] bytes = Base64.decodeBase64(base64Str.getBytes("UTF-8"));
			String imgFilePath = avatarPath+"userAvatar/"+updateUserProfileDTO.getUserId()+".jpg";// 新生成的图片
			OutputStream out = new FileOutputStream(imgFilePath);
			out.write(bytes);
			out.flush();
			out.close();
			updateUserProfileDTO.setAvatar("userAvatar/"+updateUserProfileDTO.getUserId()+".jpg");
			userMapper.updateUserProfileDao(updateUserProfileDTO);
			result.put("avatar", updateUserProfileDTO.getAvatar());
			result.put(PageParamType.BUSINESS_STATUS, 1);
			result.put(PageParamType.BUSINESS_MESSAGE, "上传头像成功");
		}catch(Exception e){
			logger.error(e.getMessage(),e);
			result.put(PageParamType.BUSINESS_STATUS, -1);
			result.put(PageParamType.BUSINESS_MESSAGE, "系统异常");
		}
		return result;
	}

	@Override
	public Map<String, Object> updateMotto(UpdateUserProfileDTO updateUserProfileDTO) {
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			userMapper.updateUserProfileDao(updateUserProfileDTO);
			result.put("motto", updateUserProfileDTO.getMotto());
			result.put(PageParamType.BUSINESS_STATUS, 1);
			result.put(PageParamType.BUSINESS_MESSAGE, "个性签名修改成功");
		}catch(Exception e){
			result.put(PageParamType.BUSINESS_STATUS, 1);
			result.put(PageParamType.BUSINESS_MESSAGE, "个性签名修改成功");
		}
		return result;
	}

	

}
