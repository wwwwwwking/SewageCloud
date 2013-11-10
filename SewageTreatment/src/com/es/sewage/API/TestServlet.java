package com.es.sewage.API;

import java.io.IOException;
import java.net.InetSocketAddress;
import java.util.Enumeration;
import java.util.concurrent.Executor;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.appengine.api.oauth.OAuthService;
import com.google.appengine.api.oauth.OAuthServiceFactory;
import com.google.appengine.api.users.User;

public class TestServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		resp.setContentType("text/plain;charset=utf-8");
		String method = req.getParameter("method");
		
		// OAuth 测试
		if (method.equals("user")) {
			User user = null;
			try {
				OAuthService oauth = OAuthServiceFactory.getOAuthService();
				user = oauth.getCurrentUser();
				resp.getWriter().println(user.getEmail());
			} catch(Exception e) {
				resp.getWriter().println(e.getMessage());
			}
		}
		
		// 简单的测试
		else {
			resp.getWriter().println(method);
			Enumeration<String> parameters = req.getParameterNames();
			while (parameters.hasMoreElements()) {
				String element = parameters.nextElement();
				resp.getWriter().print(element);
				resp.getWriter().println(" --> " + req.getParameter(element));
			}
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doGet(req, resp);
	}	
}
