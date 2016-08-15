package org.nv.dom.web.service;

import java.util.List;
import java.util.Map;

import org.nv.dom.domain.message.OfflineMessage;
import org.nv.dom.domain.user.User;
import org.nv.dom.domain.user.UserCurRole;

public interface UserService {
	
	public UserCurRole getUserCurRole(User user);
	
	public Map<String, Object> getOfflineMessage(long userId);

	public Map<String, Object> saveOfflineSpeech(OfflineMessage offlineMessage);
	
	public Map<String, Object> getChatInfo(List<String> chatList, String userId);

}
