package org.nv.dom.web.service.impl;

import javax.annotation.PostConstruct;

import org.nv.dom.util.ConfigUtil;
import org.nv.dom.util.RedisClient;
import org.nv.dom.util.ThreadUtil;
import org.nv.dom.web.listener.MyListener;
import org.nv.dom.web.service.IBasicService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

@Service("basicService")
public class BasicServiceImpl implements IBasicService {
	
	private String host = ConfigUtil.getVersionConfigProperty("redis.host");
	
	private String name = ConfigUtil.getVersionConfigProperty("redis.name");
	
	private int port = Integer.parseInt(ConfigUtil.getVersionConfigProperty("redis.port")); 

	protected RedisClient redisClient = new RedisClient(host, port, name);
	
	protected static Logger logger = LoggerFactory.getLogger(BasicServiceImpl.class);
	
	private String[] events = ConfigUtil.getStringArrayProperty("event.list",",") ;
	
	@PostConstruct
	private void subscribe(){
		ThreadUtil.fixedPool.execute(new Runnable() {			
			@Override
			public void run() {
				try {
					final MyListener listener = new MyListener();
					redisClient.subscribe(listener, events);
				}catch (Exception e) {
					logger.error(e.getMessage(),e);
				}
			}
		});
	}

}
