package com.es.sewage.protocal.action;

import javax.annotation.Resource;

import com.es.sewage.core.dao.QueryResult;
import com.es.sewage.protocal.model.SubunitModel;
import com.es.sewage.protocal.model.SubunitClassifyModel;
import com.es.sewage.protocal.service.SubunitClassifyService;
import com.es.sewage.protocal.service.SubunitService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class SubunitAction extends ActionSupport {

	@Resource
	private SubunitClassifyService subunitClassifyService;
	@Resource
	private SubunitService subutilService;
	private SubunitModel subunit;
	private Long id;

	public SubunitClassifyService getSubunitClassifyService() {
		return subunitClassifyService;
	}

	public void setSubunitClassifyService(
			SubunitClassifyService subunitClassifyService) {
		this.subunitClassifyService = subunitClassifyService;
	}

	public SubunitService getSubutilService() {
		return subutilService;
	}

	public void setSubutilService(SubunitService subutilService) {
		this.subutilService = subutilService;
	}

	public SubunitModel getSubunit() {
		return subunit;
	}

	public void setSubunit(SubunitModel subunit) {
		this.subunit = subunit;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	// 新建
	public String create() {
		QueryResult<SubunitClassifyModel> result = (QueryResult<SubunitClassifyModel>) subunitClassifyService
				.getPaginationData();
		ActionContext.getContext().getSession().put("classify", result);
		return SUCCESS;
	}

	// 新增
	public String add() {
		// System.out.println(subunit.toString());
		this.subutilService.checkAndAdd(subunit);
		return SUCCESS;
	}

	// 查询
	public String list() {
		// System.out.println("+++ list subunit +++");
		QueryResult<SubunitModel> list = this.subutilService
				.getPaginationData();
		ActionContext.getContext().getSession().put("value", list);

		// REMARK 此处当心NULL的问题
		/*
		if (list != null && list.getResultList() != null
				&& list.getResultList().size() > 0) {
			for (int i = 0; i < list.getResultList().size(); ++i) {
				System.out.println(list.getResultList().get(i).toString());
			}
		}
		*/
		
		return SUCCESS;
	}

	// 单条
	public String edit() {
		QueryResult<SubunitClassifyModel> result = (QueryResult<SubunitClassifyModel>) subunitClassifyService
				.getPaginationData();
		ActionContext.getContext().getSession().put("classify", result);
		if (id != null) {
			SubunitModel unit;
			unit = subutilService.get(id);
			ActionContext.getContext().getSession().put("value", unit);
		}

		return SUCCESS;
	}

	// 删除
	public String delete() {
		if (id != null) {
			subutilService.delete(id);
		}

		return SUCCESS;
	}

	// 修改
	public String update() {
		if (subunit.getId() != null) {
			subutilService.update(subunit);
		}

		return SUCCESS;
	}
}
