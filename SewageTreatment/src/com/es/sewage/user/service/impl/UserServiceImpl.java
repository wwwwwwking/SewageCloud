package com.es.sewage.user.service.impl;

import com.es.sewage.core.dao.BaseDao;
import com.es.sewage.core.dao.QueryResult;
import com.es.sewage.core.service.impl.BaseServiceImpl;
import com.es.sewage.user.dao.UserDao;
import com.es.sewage.user.model.UserModel;
import com.es.sewage.user.service.UserService;

public class UserServiceImpl extends BaseServiceImpl<UserModel> implements
		UserService {

	private UserDao userDao;

	public UserDao getUserDao() {
		return userDao;
	}

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

	public UserServiceImpl(UserDao dao) {
		super(dao);
		this.userDao = dao;
	}

	@Override
	public boolean checkAndAdd(UserModel userModel) {
		QueryResult<UserModel> list = this.userDao.getPaginationData();
		if (list != null && list.getResultList() != null && list.getResultList().size() > 0) {
			for (int i = 0; i < list.getResultList().size(); ++i) {
				UserModel tmpModel = list.getResultList().get(i);
				if (tmpModel.getUsername().equals(userModel.getUsername()) &&
						tmpModel.getCompanyId().equals(userModel.getCompanyId())) {
					return false;
				}
			}
		}
		this.userDao.add(userModel);
		return true;
	}

	@Override
	public UserModel login(Long companyId, String username) {
		return userDao.login(companyId, username);
	}

}
