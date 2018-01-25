package org.nv.dom.plugin;

public class ModifiedDetail {
	
	private String columnName;
	
	private Object preValue;
	
	private Object afterValue;

	public String getColumnName() {
		return columnName;
	}

	public void setColumnName(String columnName) {
		this.columnName = columnName;
	}

	public Object getPreValue() {
		return preValue;
	}

	public void setPreValue(Object preValue) {
		this.preValue = preValue;
	}

	public Object getAfterValue() {
		return afterValue;
	}

	public void setAfterValue(Object afterValue) {
		this.afterValue = afterValue;
	}

}
