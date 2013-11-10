package com.es.sewage.protocal.action;

import javax.annotation.Resource;

import com.es.sewage.core.action.BaseAction;
import com.es.sewage.core.dao.QueryResult;
import com.es.sewage.protocal.model.SubunitClassifyModel;
import com.es.sewage.protocal.service.SubunitClassifyService;
import com.opensymphony.xwork2.ActionContext;

public class SubunitClassifyAction extends BaseAction {

	@Resource
	private SubunitClassifyService subunitClassifyService;

	private Long id;
	private SubunitClassifyModel subunitClassify;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public SubunitClassifyModel getSubunitClassify() {
		return subunitClassify;
	}

	public void setSubunitClassify(SubunitClassifyModel subunitClassify) {
		this.subunitClassify = subunitClassify;
	}

	public SubunitClassifyService getSubunitClassifyService() {
		return subunitClassifyService;
	}

	public void setSubunitClassifyService(
			SubunitClassifyService subunitClassifyService) {
		this.subunitClassifyService = subunitClassifyService;
	}

	public String add() {
		if (subunitClassifyService.checkAndAdd(subunitClassify))
			return SUCCESS;
		ActionContext.getContext().getSession().put("errorMsg", "类别已存在或存储类别失败");
		return ERROR;
	}
	
	public String edit() {
		if (id != null) {
			subunitClassify = subunitClassifyService.get(id);
			ActionContext.getContext().getSession().put("value", subunitClassify);
		}
		return SUCCESS;
	}

	public String update() {
		if (subunitClassify.getId() != null) {
			subunitClassifyService.update(subunitClassify);
		}
		
		return SUCCESS;
	}

	public String list() {
		QueryResult<SubunitClassifyModel> list = subunitClassifyService
				.getPaginationData();
		ActionContext.getContext().getSession().put("subunitClassify", list);
		return SUCCESS;
	}

	public String delete() {
		if (id != null) {
			subunitClassifyService.delete(id);
		}
		return SUCCESS;
	}
}
