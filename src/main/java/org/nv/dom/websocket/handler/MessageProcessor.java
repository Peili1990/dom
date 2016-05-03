package org.nv.dom.websocket.handler;


import org.springframework.web.socket.TextMessage;

import com.alibaba.fastjson.JSONObject;


public class MessageProcessor {
	
	public static TextMessage addAttr(TextMessage message, String key, String value){
		
		JSONObject object=JSONObject.parseObject(message.getPayload());
		object.put(key, value);		
		return new TextMessage(object.toJSONString());
		
	}

}
