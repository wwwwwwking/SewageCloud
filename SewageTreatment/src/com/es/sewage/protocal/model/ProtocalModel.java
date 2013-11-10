package com.es.sewage.protocal.model;

import java.util.List;

import javax.jdo.annotations.IdGeneratorStrategy;
import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;
import javax.jdo.annotations.PrimaryKey;

import com.es.sewage.core.model.BaseModel;

/**
 * 用户上传协议 上传时需要追加： 时间 站点ID 公司ID 长度 数据 校验
 * 
 * @author youwc
 * 
 */

@PersistenceCapable
public class ProtocalModel extends BaseModel {

	@PrimaryKey
	@Persistent(valueStrategy = IdGeneratorStrategy.IDENTITY)
	private Long id;

	@Persistent
	private Long companyId;

	@Persistent
	private List<Long> subunitList;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Long getCompanyId() {
		return companyId;
	}

	public void setCompanyId(Long companyId) {
		this.companyId = companyId;
	}

	public List<Long> getSubunitList() {
		return subunitList;
	}

	public void setSubunitList(List<Long> subunitList) {
		this.subunitList = subunitList;
	}
}
