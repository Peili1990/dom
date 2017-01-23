package org.nv.dom.web.dao.user;

import java.util.List;

import org.nv.dom.domain.message.OfflineMessage;
import org.nv.dom.domain.message.chat.ChatDetail;
import org.nv.dom.domain.message.chat.ChatInfo;
import org.nv.dom.domain.message.chat.OfflineChat;
import org.nv.dom.domain.message.speech.OfflineSpeech;
import org.nv.dom.domain.user.UserCard;
import org.nv.dom.domain.user.UserCurRole;
import org.nv.dom.dto.message.GetChatRecordDTO;
import org.nv.dom.dto.user.EquipBadgeDTO;
import org.nv.dom.dto.user.UpdateUserProfileDTO;
import org.springframework.stereotype.Repository;

@Repository
public interface UserMapper {
	/**
	 * <p>查询玩家当前状态</p>
	 */
	public UserCurRole getUserCurRoleDao(long userId);
	
	/**
	 * <p>查询用户离线发言数量</p>
	 */
	
	public List<OfflineSpeech> getOfflineSpeechDao(long userId);
	
	/**
	 * <p>保存用户离线消息</p>
	 */
	
	public int saveOfflineMessageDao(OfflineMessage offlineMessage);
	
	/**
	 * <p>查询聊天会话信息</p>
	 */
	
	public List<ChatInfo> getChatInfoDao(long userId);
	
	/**
	 * <p>根据用户Id查询聊天会话信息</p>
	 */
	
	public ChatInfo getChatInfoByUserIdDao(long toUserId);
	
	/**
	 * <p>查询用户离线私聊信息</p>
	 */
	
	public List<OfflineChat> getOfflineChatDao(long userId);
	
	/**
	 * <p>更新用户资料</p>
	 */
	
	public int updateUserProfileDao(UpdateUserProfileDTO updateUserProfileDTO);
	
	
	/**
	 * <p>获取用户聊天记录</p>
	 */

	public List<ChatDetail> getChatRecordDao(GetChatRecordDTO getChatRecordDTO);
	
	/**
	 * <p>更新聊天记录状态</p>
	 */

	public int updateChatRecordDao(GetChatRecordDTO getChatRecordDTO);
	
	/**
	 * <p>获取卡片</p>
	 */

	public List<UserCard> getUserCardList(long userId);
	
	/**
	 * <p>获取用户报名能用卡片</p>
	 */
	
	public List<Integer> getAvailableCardCount(long userId);
	
	
	/**
	 * <p>获取用户拥有的徽章</p>
	 */

	public List<String> getUserBadge(long userId);
	
	/**
	 * <p>佩戴或取下徽章</p>
	 */
	
	public int equipBadge(EquipBadgeDTO equipBadgeDTO);
}
