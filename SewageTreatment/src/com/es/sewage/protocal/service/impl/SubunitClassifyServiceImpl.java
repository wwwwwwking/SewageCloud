package com.es.sewage.protocal.service.impl;

import com.es.sewage.core.dao.QueryResult;
import com.es.sewage.core.service.impl.BaseServiceImpl;
import com.es.sewage.protocal.dao.SubunitClassifyDao;
import com.es.sewage.protocal.model.SubunitClassifyModel;
import com.es.sewage.protocal.service.SubunitClassifyService;

public class SubunitClassifyServiceImpl extends BaseServiceImpl<SubunitClassifyModel> implements SubunitClassifyService {

	private SubunitClassifyDao dao;
	
	public SubunitClassifyServiceImpl(SubunitClassifyDao dao) {
		super(dao);
		this.dao = dao;
	}

	public boolean checkAndAdd(SubunitClassifyModel subunit) {
		// 检测类型是否已经存在
		QueryResult<SubunitClassifyModel> classifyAll = dao.getPaginationData();
		for (int i = 0; i < classifyAll.getResultList().size(); ++i) {
			if (classifyAll.getResultList().get(i).getDesc().equals(subunit.getDesc())) {
				return false;
			}
		}
		// 永久存储
		subunit = dao.add(subunit);
		if (subunit.getId() == null) 
			return false;
		return true;
	}
}
