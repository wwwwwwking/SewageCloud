package com.es.sewage.sys.action;

import com.es.sewage.user.model.UserModel;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.MethodFilterInterceptor;

public class AuthorityInterceptor extends MethodFilterInterceptor {

	@Override
	protected String doIntercept(ActionInvocation arg0) throws Exception {
		UserModel user = (UserModel) ActionContext.getContext().getSession().get("APPUSER");
		if (user == null || user.getId() == null || user.getName() == null) {
			return Action.LOGIN;
		} else {
			return arg0.invoke();
		}
	}

}
