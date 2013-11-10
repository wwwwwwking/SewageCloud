package com.es.sewage.user.service;

import com.es.sewage.core.service.BaseService;
import com.es.sewage.core.service.impl.BaseServiceImpl;
import com.es.sewage.user.model.UserModel;

public interface UserService extends BaseService<UserModel> {
	public boolean checkAndAdd(UserModel userModel);
	public UserModel login(Long companyId, String username);
}
