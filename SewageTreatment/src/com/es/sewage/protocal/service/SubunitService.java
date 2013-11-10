package com.es.sewage.protocal.service;

import com.es.sewage.core.service.BaseService;
import com.es.sewage.protocal.model.SubunitModel;

public interface SubunitService extends BaseService<SubunitModel> {
	public boolean checkAndAdd(SubunitModel subunit);
}
