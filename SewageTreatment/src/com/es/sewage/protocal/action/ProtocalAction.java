package com.es.sewage.protocal.action;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.mail.Session;

import org.springframework.context.ApplicationContext;

import com.es.sewage.core.action.BaseAction;
import com.es.sewage.core.dao.QueryResult;
import com.es.sewage.protocal.model.ProtocalModel;
import com.es.sewage.protocal.model.SubunitModel;
import com.es.sewage.protocal.service.ProtocalService;
import com.es.sewage.protocal.service.SubunitClassifyService;
import com.es.sewage.protocal.service.SubunitService;
import com.es.sewage.user.model.UserModel;
import com.opensymphony.xwork2.ActionContext;

public class ProtocalAction extends BaseAction {
	@Resource
	private ProtocalService protocalService;
	@Resource
	private SubunitClassifyService subunitClassifyService;
	@Resource
	private SubunitService subunitService;

	private ProtocalModel protocalModel; // 模型

	private Long id;
	private Long subunitId; // SUBUNIT的ID
	private Integer subunitPos; // SUBUNIT的位置

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Long getSubunitId() {
		return subunitId;
	}

	public void setSubunitId(Long subunitId) {
		this.subunitId = subunitId;
	}

	public Integer getSubunitPos() {
		return subunitPos;
	}

	public void setSubunitPos(Integer subunitPos) {
		this.subunitPos = subunitPos;
	}

	public ProtocalService getProtocalService() {
		return protocalService;
	}

	public void setProtocalService(ProtocalService protocalService) {
		this.protocalService = protocalService;
	}

	public SubunitClassifyService getSubunitClassifyService() {
		return subunitClassifyService;
	}

	public void setSubunitClassifyService(
			SubunitClassifyService subunitClassifyService) {
		this.subunitClassifyService = subunitClassifyService;
	}

	public SubunitService getSubunitService() {
		return subunitService;
	}

	public void setSubunitService(SubunitService subunitService) {
		this.subunitService = subunitService;
	}

	public ProtocalModel getProtocalModel() {
		return protocalModel;
	}

	public void setProtocalModel(ProtocalModel protocalModel) {
		this.protocalModel = protocalModel;
	}

	// 查
	public String list() {
		UserModel appUser = (UserModel) ActionContext.getContext().getSession()
				.get("APPUSER");
		if (appUser == null || appUser.getCompanyId() == null) {
			ActionContext.getContext().getSession().put("errorMsg", "用户尚未登录");
			return SUCCESS;
		}

		List list = protocalService.list(appUser.getCompanyId());
		ActionContext.getContext().getSession().put("values", list);

		return SUCCESS;
	}

	public String save() {
		String result = SUCCESS;
		protocalModel = (ProtocalModel) ActionContext.getContext().getSession()
				.get("cachedProtocal");
		if (protocalModel.getId() != null) {
			result = update();
		} else {
			result = add();
		}
		return result;
	}

	// 增
	public String add() {
		UserModel appUser = (UserModel) ActionContext.getContext().getSession()
				.get("APPUSER");
		if (appUser == null || appUser.getCompanyId() == null) {
			ActionContext.getContext().getSession().put("errorMsg", "用户尚未登录");
			return ERROR;
		}

		protocalModel = (ProtocalModel) ActionContext.getContext().getSession()
				.get("cachedProtocal");
		if (protocalModel == null) {
			ActionContext.getContext().getSession().put("errorMsg", "协议尚未定制");
			return ERROR;
		}

		protocalModel.setCompanyId(appUser.getCompanyId());
		protocalService.add(protocalModel);
		return SUCCESS;
	}

	// 改
	public String update() {
		UserModel appUser = (UserModel) ActionContext.getContext().getSession()
				.get("APPUSER");
		if (appUser == null || appUser.getCompanyId() == null) {
			ActionContext.getContext().getSession().put("errorMsg", "用户尚未登录");
			return ERROR;
		}

		protocalModel = (ProtocalModel) ActionContext.getContext().getSession()
				.get("cachedProtocal");
		if (protocalModel == null) {
			ActionContext.getContext().getSession().put("errorMsg", "协议尚未定制");
			return ERROR;
		}

		protocalModel.setCompanyId(appUser.getCompanyId());
		protocalService.update(protocalModel);
		return SUCCESS;
	}

	// 删
	public String delete() {
		UserModel appUser = (UserModel) ActionContext.getContext().getSession()
				.get("APPUSER");
		if (appUser == null || appUser.getCompanyId() == null) {
			ActionContext.getContext().getSession().put("errorMsg", "用户尚未登录");
			return ERROR;
		}

		if (id != null) {
			this.protocalService.delete(id);
		}
		return SUCCESS;
	}

	// 缓存增
	public String cacheAdd() {
		try {
			this.protocalModel = (ProtocalModel) ActionContext.getContext()
					.getSession().get("cachedProtocal");
		} catch (Exception e) {
		}
		if (this.protocalModel == null)
			this.protocalModel = new ProtocalModel();

		if (subunitId != null) {
			if (this.protocalModel.getSubunitList() == null) {
				this.protocalModel.setSubunitList(new ArrayList<Long>());
			}
			this.protocalModel.getSubunitList().add(subunitId);
		}
		ActionContext.getContext().getSession()
				.put("cachedProtocal", this.protocalModel);
		return SUCCESS;
	}

	// 缓存修改
	public String cacheUpdate() {
		try {
			this.protocalModel = (ProtocalModel) ActionContext.getContext()
					.getSession().get("cachedProtocal");
			if (this.protocalModel != null && this.subunitId != null
					&& this.protocalModel.getSubunitList().size() > subunitPos) {
				this.protocalModel.getSubunitList().add(subunitPos.intValue(),
						subunitId);
				this.protocalModel.getSubunitList().remove(subunitPos + 1);
				ActionContext.getContext().getSession()
						.put("cachedProtocal", this.protocalModel);
			}
		} catch (Exception e) {
		}
		return SUCCESS;
	}

	// 缓存删除
	public String cacheDelete() {
		try {
			this.protocalModel = (ProtocalModel) ActionContext.getContext()
					.getSession().get("cachedProtocal");
			if (this.protocalModel != null
					&& this.protocalModel.getSubunitList().size() > subunitPos) {
				this.protocalModel.getSubunitList().remove(
						this.subunitPos.intValue());
				ActionContext.getContext().getSession()
						.put("cachedProtocal", this.protocalModel);
			}
		} catch (Exception e) {
		}
		return SUCCESS;
	}

	// 缓存列表
	public String cacheList() {
		// 将当前所有的组件类型列出来
		QueryResult<SubunitModel> allSubunits = this.subunitService
				.getPaginationData();
		ActionContext.getContext().getSession().put("allSubunit", allSubunits);
		ActionContext.getContext().getSession().put("cacheProtocalList", null);
		ActionContext.getContext().getSession().put("cachedProtocal", null);

		return SUCCESS;
		
		/*
		List<SubunitModel> list = new ArrayList<SubunitModel>();
		try {
			this.protocalModel = (ProtocalModel) ActionContext.getContext()
					.getSession().get("cachedProtocal");
			if (this.protocalModel != null
					&& this.protocalModel.getSubunitList().size() > 0) {
				for (int i = 0; i < this.protocalModel.getSubunitList().size(); ++i) {
					SubunitModel model = this.subunitService
							.get(this.protocalModel.getSubunitList().get(i));
					if (model != null) {
						list.add(model);
					}
				}
			}
		} catch (Exception e) {
		}
		ActionContext.getContext().getSession().put("cacheProtocalList", list);
		return SUCCESS;
		*/
	}
	
	// 初始化已有缓存
	public String cacheInit() {
		QueryResult<SubunitModel> allSubunits = this.subunitService.getPaginationData();
		ActionContext.getContext().getSession().put("allSubunit", allSubunits);
		
		if (id == null) {
			return SUCCESS;
		}
		
		List<SubunitModel> list = new ArrayList<SubunitModel>();
		try {
			this.protocalModel = this.protocalService.get(id);
			ActionContext.getContext().getSession().put("cachedProtocal", protocalModel);
			if (this.protocalModel != null
					&& this.protocalModel.getSubunitList().size() > 0) {
				for (int i = 0; i < this.protocalModel.getSubunitList().size(); ++i) {
					SubunitModel model = this.subunitService
							.get(this.protocalModel.getSubunitList().get(i));
					if (model != null) {
						list.add(model);
					}
				}
			}
		} catch (Exception e) {
		}
		
		ActionContext.getContext().getSession().put("cacheProtocalList", list);
		return SUCCESS;
	}
}
