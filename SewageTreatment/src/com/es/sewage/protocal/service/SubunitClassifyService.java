package com.es.sewage.protocal.service;

import com.es.sewage.core.service.BaseService;
import com.es.sewage.protocal.model.SubunitClassifyModel;

public interface SubunitClassifyService extends BaseService<SubunitClassifyModel> {
	public boolean checkAndAdd(SubunitClassifyModel subunit);	// 判断是否重复并保存
}
