package org.nv.dom.web.service;

import java.util.Map;

import org.nv.dom.domain.message.OfflineMessage;
import org.nv.dom.domain.user.User;
import org.nv.dom.domain.user.UserCurRole;
import org.nv.dom.dto.message.GetChatRecordDTO;
import org.nv.dom.dto.user.UpdateUserProfileDTO;

public interface UserService {
	
	public UserCurRole getUserCurRole(User user);
	
	public Map<String, Object> getOfflineMessage(long userId);

	public Map<String, Object> saveOfflineSpeech(OfflineMessage offlineMessage);
	
	public Map<String, Object> getChatList(long userId);

	public Map<String, Object> avatarUpload(UpdateUserProfileDTO updateUserProfileDTO);

	public Map<String, Object> updateProfile(UpdateUserProfileDTO updateUserProfileDTO);

	public Map<String, Object> getChatInfo(String chatId, String userId);

	public Map<String, Object> getChatRecord(GetChatRecordDTO getChatRecordDTO);

	public Map<String, Object> getPlayerData(long userId);

}
