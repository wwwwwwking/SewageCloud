package com.es.sewage.user.dao.impl;

import java.util.List;

import com.es.sewage.core.dao.BaseDaoImpl;
import com.es.sewage.user.dao.UserDao;
import com.es.sewage.user.model.UserModel;

public class UserDaoImpl extends BaseDaoImpl<UserModel> implements UserDao {

	@Override
	public UserModel login(Long companyId, String username) {
		String jdoql = "select from " + UserModel.class.getName() + 
			" where companyId==" + companyId.toString() + " && username=='"+ username +"'";
		List list = query(jdoql);
		if (list != null && list.size() > 0) {
			return (UserModel)list.get(0);
		}
		return null;
	}

}
