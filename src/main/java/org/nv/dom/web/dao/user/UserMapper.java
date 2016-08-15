package org.nv.dom.web.dao.user;

import java.util.List;

import org.nv.dom.domain.message.OfflineMessage;
import org.nv.dom.domain.message.chat.ChatInfo;
import org.nv.dom.domain.message.chat.OfflineChat;
import org.nv.dom.domain.message.speech.OfflineSpeech;
import org.nv.dom.domain.user.UserCurRole;
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
	 * <p>保存聊天会话信息</p>
	 */
	
	public List<ChatInfo> getChatInfoDao(List<Long> users);
	
	/**
	 * <p>查询用户离线私聊信息</p>
	 */
	
	public List<OfflineChat> getOfflineChatDao(long userId);

}
