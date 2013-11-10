package com.es.sewage.API;

import java.util.Map;

import com.es.sewage.core.action.BaseAction;
import com.opensymphony.xwork2.ActionContext;

public class TestAPIAction extends BaseAction {
	public String test() {
		ActionContext.getContext().getSession().put("RESULT", "I'm English");
		return SUCCESS;
	}
}
