package org.nv.dom.web.service.impl;

import java.util.HashMap;
import java.util.Map;

import org.nv.dom.web.operation.Operation;
import org.nv.dom.web.service.IEventService;
import org.springframework.stereotype.Service;

@Service("eventService")
public class EventServiceImpl implements IEventService {
	
	private Map<String, Map<Integer, Operation>> eventManager = new HashMap<>();

	@Override
	public void registerEvent(String event, Operation operation) {
		Map<Integer, Operation> observers = eventManager.getOrDefault(event, new HashMap<Integer, Operation>());
		observers.put(operation.getOperationId(), operation);
		eventManager.put(event, observers);
	}

	@Override
	public void cancelEvent(String event, Operation operation) {
		Map<Integer, Operation> observers = eventManager.get(event);
		if(observers != null) {
			observers.remove(operation.getOperationId());
			eventManager.put(event, observers);
		}
	}

	@Override
	public void notify(String event, String message) {
		Map<Integer, Operation> observers = eventManager.getOrDefault(event, new HashMap<Integer, Operation>());
		observers.keySet().stream().forEach(id -> observers.get(id).settle(message));	
	}

}
