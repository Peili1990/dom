package org.nv.dom.web.controller;

import javax.annotation.Resource;

import org.nv.dom.web.service.BasicService;

public class BaseController {
	
	@Resource(name = "basicServiceImpl")
	protected BasicService basicService;

}
