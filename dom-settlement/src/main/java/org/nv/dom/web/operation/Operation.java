package org.nv.dom.web.operation;

import javax.annotation.PostConstruct;

import org.nv.dom.web.service.IEventService;
import org.springframework.beans.factory.annotation.Autowired;

public abstract class Operation {
	
	protected int operationId;
	
	@Autowired
	protected IEventService eventService;

	public int getOperationId() {
		return operationId;
	}

	public void setOperationId(int operationId) {
		this.operationId = operationId;
	}
	
	public abstract void settle(String param);
	
	@PostConstruct
	public abstract void registerEvent();

}
