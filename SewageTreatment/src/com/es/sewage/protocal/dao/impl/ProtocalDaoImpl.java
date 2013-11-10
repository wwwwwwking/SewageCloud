package com.es.sewage.protocal.dao.impl;

import java.util.ArrayList;
import java.util.List;

import com.es.sewage.core.dao.BaseDaoImpl;
import com.es.sewage.protocal.dao.ProtocalDao;
import com.es.sewage.protocal.model.ProtocalModel;

public class ProtocalDaoImpl extends BaseDaoImpl<ProtocalModel> implements ProtocalDao {

	@Override
	public List list(Long companyId) {
		String jdoql = "select from " + ProtocalModel.class.getName() + " where companyId==" + companyId.toString();
		List list = query(jdoql);
		List<ProtocalModel> resultList = new ArrayList();
		if (list != null) {
			for (int i = 0; i < list.size(); ++i) {
				resultList.add((ProtocalModel) list.get(i));
			}
		}
		return resultList;
	}

}
