package com.es.sewage.status.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.es.sewage.status.model.SiteKeyValue;
import com.es.sewage.status.model.SiteModel;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class StatusMapAction extends ActionSupport {
	
	public String preLoad() {
		List<SiteModel> list = new ArrayList();
		for (int i = 0; i < 30; ++i) {
			SiteModel model = new SiteModel();
			model.setId(Long.parseLong(""+(i+1)));
			model.setName("监控站点" + (i+1));
			model.setLat(31.4830000 + Math.random() / 20);
			model.setLng(120.2670000 + Math.random() / 20);
			List<SiteKeyValue> ll = new ArrayList<SiteKeyValue>();
			ll.add(new SiteKeyValue("监控时间", "2013-5-2 16:57:08"));
			ll.add(new SiteKeyValue("T", "23.7"));
			ll.add(new SiteKeyValue("PH", "6.8"));
			ll.add(new SiteKeyValue("ORP", "12"));
			ll.add(new SiteKeyValue("LS", "高"));
			ll.add(new SiteKeyValue("污水泵", "停止"));
			ll.add(new SiteKeyValue("曝气泵", "停止"));
			model.setValues(ll);
			model.setAlarm(0);
			list.add(model);
		}
		
		list.get(0).setAlarm(1);
		
		// System.out.println(list);
		ActionContext.getContext().getSession().put("MONITORDATA", list);
		
		return SUCCESS;
	}
}
