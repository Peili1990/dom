package org.nv.dom.web.service.impl;

import java.io.FileOutputStream;
import java.io.OutputStream;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.codec.binary.Base64;
import org.apache.log4j.Logger;
import org.nv.dom.config.PageParamType;
import org.nv.dom.domain.message.OfflineMessage;
import org.nv.dom.domain.message.chat.ChatDetail;
import org.nv.dom.domain.message.chat.ChatInfo;
import org.nv.dom.domain.message.chat.OfflineChat;
import org.nv.dom.domain.message.speech.OfflineSpeech;
import org.nv.dom.domain.player.PlayerData;
import org.nv.dom.domain.player.PlayerDataDetail;
import org.nv.dom.domain.user.User;
import org.nv.dom.domain.user.UserCard;
import org.nv.dom.domain.user.UserCurRole;
import org.nv.dom.dto.message.GetChatRecordDTO;
import org.nv.dom.dto.user.UpdateUserProfileDTO;
import org.nv.dom.util.ConfigUtil;
import org.nv.dom.web.dao.statistic.StatisticMapper;
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
	
	@Autowired
	StatisticMapper statisticMapper;
	
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
	public Map<String, Object> getChatList(long userId) {
		Map<String, Object> result = new HashMap<String, Object>();
		try{
			List<ChatInfo> chatList = null;
			chatList = userMapper.getChatInfoDao(userId); 
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
	public Map<String, Object> getChatInfo(String chatId,String userId) {
		Map<String, Object> result = new HashMap<String, Object>();
		try{
			String[] temp = chatId.split("-");
			long toUserId = Long.parseLong(temp[0].equals(userId) ? temp[1] : temp[0]);
			ChatInfo chatInfo = userMapper.getChatInfoByUserIdDao(toUserId); 
			result.put("chatInfo", chatInfo);
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
	public Map<String, Object> updateProfile(UpdateUserProfileDTO updateUserProfileDTO) {
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			userMapper.updateUserProfileDao(updateUserProfileDTO);
			result.put("motto", updateUserProfileDTO.getMotto());
			result.put("qq", updateUserProfileDTO.getQq());
			result.put(PageParamType.BUSINESS_STATUS, 1);
			result.put(PageParamType.BUSINESS_MESSAGE, "个性签名修改成功");
		}catch(Exception e){
			result.put(PageParamType.BUSINESS_STATUS, -1);
			result.put(PageParamType.BUSINESS_MESSAGE, "系统异常");
		}
		return result;
	}

	@Override
	public Map<String, Object> getChatRecord(GetChatRecordDTO getChatRecordDTO) {
		Map<String, Object> result = new HashMap<String, Object>();
		try{
			if(getChatRecordDTO.getChatId().indexOf(String.valueOf(getChatRecordDTO.getUserId()))<0){
				result.put(PageParamType.BUSINESS_STATUS, -3);
				result.put(PageParamType.BUSINESS_MESSAGE, "无法获取非本人聊天记录");
			} else {
				getChatRecordDTO.setOffset(10*getChatRecordDTO.getPageNum());
				List<ChatDetail> chatDetails = userMapper.getChatRecordDao(getChatRecordDTO);
				if(getChatRecordDTO.getPageNum() == 0){
					userMapper.updateChatRecordDao(getChatRecordDTO);
				}
				result.put("chatDetails", chatDetails);
				result.put(PageParamType.BUSINESS_STATUS, 1);
				result.put(PageParamType.BUSINESS_MESSAGE, "获取聊天记录成功");
			}
		}catch(Exception e){
			logger.error(e.getMessage(),e);
			result.put(PageParamType.BUSINESS_STATUS, -1);
			result.put(PageParamType.BUSINESS_MESSAGE, "系统异常");
		}
		return result;
	}

	@Override
	public Map<String, Object> getPlayerData(long userId) {
		Map<String, Object> result = new HashMap<String, Object>();
		NumberFormat numberFormat = NumberFormat.getInstance();  
        numberFormat.setMaximumFractionDigits(2);  
		try {
			PlayerData playerData = statisticMapper.getPlayerDataDao(userId);
			List<PlayerDataDetail> details = new ArrayList<>();
			details.add(new PlayerDataDetail("总登场次数",playerData.getTotalPlayTimes()+"次"));
			details.add(new PlayerDataDetail("好人方次数",playerData.getGoodCampTimes()+"次"));
			details.add(new PlayerDataDetail("好人方概率",playerData.getTotalPlayTimes()==0 ? "N/A":numberFormat.format((float)playerData.getGoodCampTimes()/(float)playerData.getTotalPlayTimes()*100)+"%"));
			details.add(new PlayerDataDetail("杀手方次数",playerData.getKillerCampTimes()+"次"));
			details.add(new PlayerDataDetail("杀手方概率",playerData.getTotalPlayTimes()==0 ? "N/A":numberFormat.format((float)playerData.getKillerCampTimes()/(float)playerData.getTotalPlayTimes()*100)+"%"));
			details.add(new PlayerDataDetail("好人方胜利次数",playerData.getGoodCampWinTimes()+"次"));
			details.add(new PlayerDataDetail("好人方胜率",playerData.getGoodCampTimes()==0 ? "N/A": numberFormat.format((float)playerData.getGoodCampWinTimes()/(float)playerData.getGoodCampTimes()*100)+"%"));
			details.add(new PlayerDataDetail("杀手方胜利次数",playerData.getKillerCampWinTimes()+"次"));
			details.add(new PlayerDataDetail("杀手方胜率",playerData.getKillerCampTimes()==0 ? "N/A": numberFormat.format((float)playerData.getKillerCampWinTimes()/(float)playerData.getKillerCampTimes()*100)+"%"));
			details.add(new PlayerDataDetail("总胜利次数",(playerData.getGoodCampWinTimes()+playerData.getKillerCampWinTimes())+"次"));
			details.add(new PlayerDataDetail("总胜率",playerData.getTotalPlayTimes()==0 ? "N/A":numberFormat.format((float)(playerData.getGoodCampWinTimes()+playerData.getKillerCampWinTimes())/(float)playerData.getTotalPlayTimes()*100)+"%"));
			result.put("details", details);
			result.put(PageParamType.BUSINESS_STATUS, 1);
			result.put(PageParamType.BUSINESS_MESSAGE, "获取玩家数据成功");
		}catch(Exception e){
			logger.error(e.getMessage(),e);
			result.put(PageParamType.BUSINESS_STATUS, -1);
			result.put(PageParamType.BUSINESS_MESSAGE, "系统异常");
		}
		return result;
	}

	@Override
	public Map<String, Object> getUserCardList(long userId) {
		Map<String, Object> result = new HashMap<String, Object>();
		try{
			List<UserCard> cardList = userMapper.getUserCardList(userId);
			result.put("cardList", cardList);
			result.put(PageParamType.BUSINESS_STATUS, 1);
			result.put(PageParamType.BUSINESS_MESSAGE, "获取玩家卡片成功");
		}catch(Exception e){
			logger.error(e.getMessage(),e);
			result.put(PageParamType.BUSINESS_STATUS, -1);
			result.put(PageParamType.BUSINESS_MESSAGE, "系统异常");
		}
		return result;
	}

	@Override
	public Map<String, Object> getUserCardStatus(long userId) {
		Map<String, Object> result = new HashMap<String, Object>();
		try{
			Integer availableCardCount = userMapper.getAvailableCardCount(userId);
			availableCardCount = availableCardCount == null ? 0 : availableCardCount;
			result.put("cardNum", availableCardCount);
			result.put(PageParamType.BUSINESS_STATUS, 1);
			result.put(PageParamType.BUSINESS_MESSAGE, "获取玩家卡片成功");
		}catch(Exception e){
			logger.error(e.getMessage(),e);
			result.put(PageParamType.BUSINESS_STATUS, -1);
			result.put(PageParamType.BUSINESS_MESSAGE, "系统异常");
		}
		return result;
	}

}
