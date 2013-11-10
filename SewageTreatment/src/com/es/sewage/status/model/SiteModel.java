package com.es.sewage.status.model;

import java.util.List;
import java.util.Map;

import com.es.sewage.core.model.BaseModel;

public class SiteModel extends BaseModel {
	private Long id;
	private String name;
	private Double lat;
	private Double lng;
	private List<SiteKeyValue> values;
	private Integer alarm;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Double getLat() {
		return lat;
	}

	public void setLat(Double lat) {
		this.lat = lat;
	}

	public Double getLng() {
		return lng;
	}

	public void setLng(Double lng) {
		this.lng = lng;
	}

	public List<SiteKeyValue> getValues() {
		return values;
	}

	public void setValues(List<SiteKeyValue> values) {
		this.values = values;
	}

	public Integer getAlarm() {
		return alarm;
	}

	public void setAlarm(Integer alarm) {
		this.alarm = alarm;
	}

}
