package com.es.sewge.protocal.action;

import java.util.List;

import javax.jdo.PersistenceManager;

import com.es.sewage.core.dao.PMF;
import com.es.sewage.core.dao.QueryResult;
import com.es.sewage.protocal.dao.SubunitClassifyDao;
import com.es.sewage.protocal.dao.impl.SubunitClassifyDaoImpl;
import com.es.sewage.protocal.model.SubunitClassifyModel;
import com.es.sewage.protocal.service.SubunitClassifyService;
import com.es.sewage.protocal.service.impl.SubunitClassifyServiceImpl;
import com.es.sewage.sys.dao.UserDao;
import com.es.sewage.sys.dao.impl.UserDaoImpl;
import com.es.sewage.sys.model.User;
import com.google.appengine.api.datastore.Key;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

/**
 * Hello World 测试方法
 * @author youwc
 *
 */
public class HelloWorldAction extends ActionSupport {
	private static final long serialVersionUID = 1L;

	// helloWorld方法，测试session
	public String helloWorld() {
		
		/*
		UserDao dao = new UserDaoImpl();
		User user = new User();
		user.setUsername("username");
		user.setPassword("password");
		dao.add(user);
		
		QueryResult<User> users = dao.getPaginationData();
		
		/*
		List<User> list = users.getResultList();
		for (int i= 0; i < list.size(); ++i) {
			dao.delete(list.get(i).getId());
		}
		
		users = dao.getPaginationData();
		*/
		
		/*
		SubunitClassifyService service = new SubunitClassifyServiceImpl(new SubunitClassifyDaoImpl());
		SubunitClassify classify = new SubunitClassify();
		classify.setDesc("哈哈");
		service.add(classify);
		
		QueryResult<SubunitClassify> list = service.getPaginationData();
		*/
		ActionContext.getContext().getSession().put("string", "HelloWorld");
		return SUCCESS;
	}
}
