package com.es.sewage.user.action;

import javax.annotation.Resource;

import com.es.sewage.core.action.BaseAction;
import com.es.sewage.core.dao.QueryResult;
import com.es.sewage.user.model.CompanyModel;
import com.es.sewage.user.model.UserModel;
import com.es.sewage.user.service.CompanyService;
import com.es.sewage.user.service.UserService;
import com.opensymphony.xwork2.ActionContext;

public class UserAction extends BaseAction {

	@Resource
	private CompanyService companyService;
	@Resource
	private UserService userService;
	private UserModel userModel;
	private Long id;

	public CompanyService getCompanyService() {
		return companyService;
	}

	public void setCompanyService(CompanyService companyService) {
		this.companyService = companyService;
	}

	public UserService getUserService() {
		return userService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	public UserModel getUserModel() {
		return userModel;
	}

	public void setUserModel(UserModel userModel) {
		this.userModel = userModel;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String create() {
		QueryResult<CompanyModel> list = this.companyService.getPaginationData();
		ActionContext.getContext().getSession().put("value", list);
		return SUCCESS;
	}

	public String add() {
		boolean result = this.userService.checkAndAdd(userModel);
		if (result == false) {
			ActionContext.getContext().getSession().put("errorMsg", "用户名已经存在或者添加用户失败");
			return ERROR;
		}
		return SUCCESS;
	}

	public String edit() {
		if (id != null) {
			QueryResult<CompanyModel> list = this.companyService.getPaginationData();
			ActionContext.getContext().getSession().put("companylist", list);
			
			UserModel user = this.userService.get(id);
			if (user != null && user.getId() != null) {
				ActionContext.getContext().getSession().put("value", user);
			}
		}
		return SUCCESS;
	}

	public String update() {
		if (this.userModel != null && this.userModel.getId() != null) {
			this.userService.update(userModel);
		}
		return SUCCESS;
	}

	public String list() {
		QueryResult<UserModel> list = this.userService.getPaginationData();
		if (list != null && list.getResultList() != null && list.getResultList().size()>0) {
			ActionContext.getContext().getSession().put("value", list);
		}
		return SUCCESS;
	}

	public String delete() {
		if (id != null) {
			this.userService.delete(id);
		}
		return SUCCESS;
	}
}
