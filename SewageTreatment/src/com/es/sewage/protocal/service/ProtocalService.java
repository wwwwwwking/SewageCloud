package com.es.sewage.protocal.service;

import java.util.List;

import com.es.sewage.core.service.BaseService;
import com.es.sewage.protocal.model.ProtocalModel;

public interface ProtocalService extends BaseService<ProtocalModel> {
	public List list(Long companyId);
}
