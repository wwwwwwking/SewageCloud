package com.es.sewage.sys.action;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.es.sewage.user.model.UserModel;

public class LoginFilter extends HttpServlet implements Filter {

	/**
	 * 通过判断session是否存在来判定用户是否已经登录
	 */
	@Override
	public void doFilter(ServletRequest arg0, ServletResponse arg1,
			FilterChain arg2) throws IOException, ServletException {
		HttpServletRequest request=(HttpServletRequest)arg0;
		HttpServletResponse response=(HttpServletResponse)arg1;
		HttpSession session=request.getSession();
		String isLogin="false";
		try{
			UserModel user = (UserModel) session.getAttribute("APPUSER");
			if (user == null || user.getUsername() == null || user.getId() == null) 
				response.sendRedirect("../sys/gotoLogin.do"); 
			else 
				arg2.doFilter(arg0, arg1);
		}
		catch(Exception e){}
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
	}

}
