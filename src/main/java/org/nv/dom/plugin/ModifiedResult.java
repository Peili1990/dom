package org.nv.dom.plugin;

import java.util.ArrayList;
import java.util.List;

public class ModifiedResult {
	
	private Long primaryKeyValue;
	
	private List<ModifiedDetail> detail;

	public Long getPrimaryKeyValue() {
		return primaryKeyValue;
	}

	public void setPrimaryKeyValue(Long primaryKeyValue) {
		this.primaryKeyValue = primaryKeyValue;
	}

	public List<ModifiedDetail> getDetail() {
		return detail;
	}

	public void setDetail(List<ModifiedDetail> detail) {
		this.detail = detail;
	}

	public ModifiedResult(Long primaryKeyValue) {
		super();
		this.primaryKeyValue = primaryKeyValue;
		this.detail = new ArrayList<>();
	}
	
	

}
