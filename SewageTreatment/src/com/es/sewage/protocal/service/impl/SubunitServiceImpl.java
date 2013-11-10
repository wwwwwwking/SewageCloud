package com.es.sewage.protocal.service.impl;

import com.es.sewage.core.dao.QueryResult;
import com.es.sewage.core.service.impl.BaseServiceImpl;
import com.es.sewage.protocal.dao.SubunitDao;
import com.es.sewage.protocal.model.SubunitModel;
import com.es.sewage.protocal.service.SubunitService;

public class SubunitServiceImpl extends BaseServiceImpl<SubunitModel> implements
		SubunitService {

	private SubunitDao subunitDao;

	public SubunitServiceImpl(SubunitDao dao) {
		super(dao);
		this.subunitDao = dao;
	}

	@Override
	public boolean checkAndAdd(SubunitModel subunit) {
		QueryResult<SubunitModel> list = subunitDao.getPaginationData();
		if (list != null && list.getResultList() != null && list.getResultList().size() > 0) {
			for (int i = 0; i < list.getResultList().size(); ++i) {
				if (list.getResultList().get(i).getName().equals(subunit.getName())) {
					return false;
				}
			}
		}
		this.subunitDao.add(subunit);
		return true;
	}

}
