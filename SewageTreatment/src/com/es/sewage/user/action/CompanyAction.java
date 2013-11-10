package com.es.sewage.user.action;

import javax.annotation.Resource;

import com.es.sewage.core.dao.QueryResult;
import com.es.sewage.user.model.CompanyModel;
import com.es.sewage.user.service.CompanyService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class CompanyAction extends ActionSupport {

	@Resource
	private CompanyService companyService;
	private CompanyModel company;
	private Long id;

	public CompanyService getCompanyService() {
		return companyService;
	}

	public void setCompanyService(CompanyService companyService) {
		this.companyService = companyService;
	}

	public CompanyModel getCompany() {
		return company;
	}

	public void setCompany(CompanyModel company) {
		this.company = company;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	// 新增
	public String add() {
		boolean result = this.companyService.checkAndAdd(company);
		if (result) {
			return SUCCESS;
		} else {
			ActionContext.getContext().getSession().put("errorMsg", "公司名称已经存在或者公司添加失败");
			return ERROR;
		}
	}

	// 编辑
	public String edit() {
		if (id != null) {
			CompanyModel model = this.companyService.get(id);
			if (model != null) {
				ActionContext.getContext().getSession().put("value", model);
			}
		}
		return SUCCESS;
	}

	// 修改
	public String update() {
		if (company.getId() != null) {
			this.companyService.update(company);
		}
		return SUCCESS;
	}

	// 列举
	public String list() {
		QueryResult<CompanyModel> list = this.companyService.getPaginationData();
		ActionContext.getContext().getSession().put("value", list);
		return SUCCESS;
	}

	// 删除
	public String delete() {
		if (id != null) {
			this.companyService.delete(id);
		}
		return SUCCESS;
	}
}
