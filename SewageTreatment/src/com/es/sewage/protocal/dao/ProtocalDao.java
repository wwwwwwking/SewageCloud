package com.es.sewage.protocal.dao;

import java.util.List;

import com.es.sewage.core.dao.BaseDao;
import com.es.sewage.protocal.model.ProtocalModel;

public interface ProtocalDao extends BaseDao<ProtocalModel> {
	public List list(Long companyId);
}
