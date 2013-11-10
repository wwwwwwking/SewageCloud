package com.es.sewage.status.model;

import com.es.sewage.core.model.BaseModel;

public class SiteKeyValue extends BaseModel {
	public SiteKeyValue() {}
	public SiteKeyValue(String key, Object value) {
		this.key = key;
		this.value = value;
	}
	
	public String key;
	public Object value;
}
