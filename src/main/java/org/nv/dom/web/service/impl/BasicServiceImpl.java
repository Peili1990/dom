package org.nv.dom.web.service.impl;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.nv.dom.cache.CacheData;
import org.nv.dom.config.PageParamType;
import org.nv.dom.domain.user.User;
import org.nv.dom.util.ConfigUtil;
import org.nv.dom.util.RedisClient;
import org.nv.dom.web.service.BasicService;
import org.springframework.stereotype.Service;

@Service("basicServiceImpl")
public class BasicServiceImpl implements BasicService {
	
	private String host = ConfigUtil.getVersionConfigProperty("redis.host");
	
	private String name = ConfigUtil.getVersionConfigProperty("redis.name");
	
	private int port = Integer.parseInt(ConfigUtil.getVersionConfigProperty("redis.port")); 

	protected RedisClient redisClient;
	
	@Override
	public Map<String, Object> getSessionUserService(HttpSession session) {
		Map<String, Object> result = new HashMap<String, Object>();
		if (session == null) {
			result.put(PageParamType.session_user, null);
			result.put(PageParamType.nav_show_name, "");
			return result;
		}
		User user = (User) session.getAttribute(PageParamType.user_in_session);
		String showName = "";
		if (user != null) {
			showName = user.getNickname();
		}
		result.put(PageParamType.session_user, user);
		result.put(PageParamType.nav_show_name, showName);
		result.put(PageParamType.CHAT_SERVER, ConfigUtil.getVersionConfigProperty("chat.server"));
		result.put(PageParamType.pic_server, ConfigUtil.getVersionConfigProperty("pic.server"));
		result.put(PageParamType.base_url, CacheData.getBaseUrl());
		return result;
	}
	
	public String redisGet(String key) {
		redisClient = new RedisClient(host, port, name);
		String str = redisClient.get(key,"");
		redisClient.close();
		return str;
	}
	
	public void redisSet(String key, String value) {
		redisClient = new RedisClient(host, port, name);
		redisClient.set(key, value);
		redisClient.close();
	}
	
	public void redisDel(String key) {
		redisClient = new RedisClient(host, port, name);
		redisClient.del(key);
		redisClient.close();
	}
	
	public String redisGetHSet(String domain, String key) {
		redisClient = new RedisClient(host, port, name);
		String str = redisClient.getHSet(domain, key);
		redisClient.close();
		return str;
	}
	
	public void redisSetHSet(String domain, String key, String value) {
		redisClient = new RedisClient(host, port, name);
		redisClient.setHSet(domain, key, value);
		redisClient.close();
	}
	
	public void redisDelHset(String domain, String key) {
		redisClient = new RedisClient(host, port, name);
		redisClient.delHSet(domain, key);
		redisClient.close();
	}
	

}
