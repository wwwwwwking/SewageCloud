package com.es.sewage.user.service.impl;

import com.es.sewage.core.dao.QueryResult;
import com.es.sewage.core.service.impl.BaseServiceImpl;
import com.es.sewage.user.dao.CompanyDao;
import com.es.sewage.user.model.CompanyModel;
import com.es.sewage.user.service.CompanyService;

public class CompanyServiceImpl extends BaseServiceImpl<CompanyModel> implements
		CompanyService {

	private CompanyDao companyDao;

	public CompanyDao getCompanyDao() {
		return companyDao;
	}

	public void setCompanyDao(CompanyDao companyDao) {
		this.companyDao = companyDao;
	}

	public CompanyServiceImpl(CompanyDao dao) {
		super(dao);
		this.companyDao = dao;
	}

	@Override
	public boolean checkAndAdd(CompanyModel company) {
		// 检测类型是否已经存在
		QueryResult<CompanyModel> classifyAll = companyDao.getPaginationData();
		if (classifyAll != null && classifyAll.getResultList() != null && classifyAll.getResultList().size() > 0) {			
			for (int i = 0; i < classifyAll.getResultList().size(); ++i) {
				if (classifyAll.getResultList().get(i).getCompanyName().equals(company.getCompanyName())) {
					return false;
				}
			}
		}
		// 永久存储
		company = companyDao.add(company);
		if (company.getId() == null) 
			return false;
		return true;
	}

}
