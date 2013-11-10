package com.es.sewage.user.service;

import com.es.sewage.core.service.BaseService;
import com.es.sewage.user.model.CompanyModel;

public interface CompanyService extends BaseService<CompanyModel> {

	public boolean checkAndAdd(CompanyModel company);
}
