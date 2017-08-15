package org.nv.dom.web.service;

import org.nv.dom.web.operation.Operation;

public interface IEventService {
	
	void registerEvent(String event, Operation operation);
	
	void cancelEvent(String event, Operation operation);
	
	void notify(String event, String message);

}
