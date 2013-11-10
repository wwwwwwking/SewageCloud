package com.es.sewage.protocal.service.impl;

import java.util.List;

import com.es.sewage.core.service.impl.BaseServiceImpl;
import com.es.sewage.protocal.dao.ProtocalDao;
import com.es.sewage.protocal.model.ProtocalModel;
import com.es.sewage.protocal.service.ProtocalService;

public class ProtocalServiceImpl extends BaseServiceImpl<ProtocalModel> implements ProtocalService {
	private ProtocalDao protocalDao;
	
	public ProtocalServiceImpl(ProtocalDao dao) {
		super(dao);
		this.protocalDao = dao;
	}

	@Override
	public List list(Long companyId) {
		return this.protocalDao.list(companyId);
	}

}
