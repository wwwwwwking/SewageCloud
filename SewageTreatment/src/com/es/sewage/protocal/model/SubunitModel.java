package com.es.sewage.protocal.model;

import javax.jdo.annotations.IdGeneratorStrategy;
import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;
import javax.jdo.annotations.PrimaryKey;

import com.es.sewage.core.model.BaseModel;

/**
 * 组件库
 * 
 * @author youwc
 * 
 */
@PersistenceCapable
public class SubunitModel extends BaseModel {

	@PrimaryKey
	@Persistent(valueStrategy = IdGeneratorStrategy.IDENTITY)
	private Long id;

	@Persistent
	private Long subunitClassify;

	@Persistent
	private String name;

	@Persistent
	private String dateType;

	@Persistent
	private Double minValue;

	@Persistent
	private Double maxValue;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Long getSubunitClassify() {
		return subunitClassify;
	}

	public void setSubunitClassify(Long subunitClassify) {
		this.subunitClassify = subunitClassify;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDateType() {
		return dateType;
	}

	public void setDateType(String dateType) {
		this.dateType = dateType;
	}

	public Double getMinValue() {
		return minValue;
	}

	public void setMinValue(Double minValue) {
		this.minValue = minValue;
	}

	public Double getMaxValue() {
		return maxValue;
	}

	public void setMaxValue(Double maxValue) {
		this.maxValue = maxValue;
	}

}
