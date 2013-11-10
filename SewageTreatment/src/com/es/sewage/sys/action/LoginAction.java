package com.es.sewage.sys.action;

import javax.annotation.Resource;

import com.es.sewage.core.dao.QueryResult;
import com.es.sewage.user.model.CompanyModel;
import com.es.sewage.user.model.UserModel;
import com.es.sewage.user.service.CompanyService;
import com.es.sewage.user.service.UserService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.sun.org.apache.bcel.internal.generic.FADD;
import com.sun.xml.internal.bind.v2.runtime.reflect.opt.FieldAccessor_Integer;

public class LoginAction extends ActionSupport {

	@Resource
	private CompanyService companyService;
	@Resource
	private UserService userService;

	private Long companyId;
	private String userName;
	private String password;

	public CompanyService getCompanyService() {
		return companyService;
	}

	public void setCompanyService(CompanyService companyService) {
		this.companyService = companyService;
	}

	public Long getCompanyId() {
		return companyId;
	}

	public void setCompanyId(Long companyId) {
		this.companyId = companyId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public UserService getUserService() {
		return userService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	// 跳转到登录页面
	public String gotoLogin() {
		// 得到所有公司信息
		ActionContext.getContext().getSession().put("loginMsg", "");
		ActionContext.getContext().getSession().put("APPUSER", null);
		QueryResult<CompanyModel> companys = companyService.getPaginationData();
		ActionContext.getContext().getSession().put("values", companys);
		return SUCCESS;
	}

	// 用户登录
	public String doLogin() {
		boolean success = true;
		String loginMsg = "";
		
		ActionContext.getContext().getSession().put("loginMsg", "");
		ActionContext.getContext().getSession().put("APPUSER", null);
		if (companyId == null) {
			success = false;
			loginMsg = "选择公司";
		} else if (userName == null || userName.trim() == "") {
			success = false;
			loginMsg = "用户名出错";
		} else if (password == null || password.trim() == "") {
			success = false;
			loginMsg = "密码错误";
		}

		if (!success) {
			ActionContext.getContext().getSession().put("loginMsg", loginMsg);
			return ERROR;
		}

		UserModel user = userService.login(companyId, userName);

		if (user != null) {
			if (user.getPassword().equals(password)) {
				ActionContext.getContext().getSession().put("APPUSER", user);
				return SUCCESS;
			} else {
				ActionContext.getContext().getSession().put("loginMsg", "错误的用户密码");
				return ERROR;
			}
		} else {
			ActionContext.getContext().getSession().put("loginMsg", "错误的用户名");
			return ERROR;
		}
	}

	// 用户登出
	public String doLogout() {
		ActionContext.getContext().getSession().put("APPUSER", null);
		return SUCCESS;
	}
}
