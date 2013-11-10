package com.es.sewage.user.dao;

import com.es.sewage.core.dao.BaseDao;
import com.es.sewage.user.model.UserModel;

public interface UserDao extends BaseDao<UserModel> {
	public UserModel login(Long companyId, String username);
}
