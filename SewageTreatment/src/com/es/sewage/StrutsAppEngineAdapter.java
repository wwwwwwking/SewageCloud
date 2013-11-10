package com.es.sewage;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import ognl.OgnlRuntime;

public class StrutsAppEngineAdapter implements ServletContextListener {

	@Override
	public void contextDestroyed(ServletContextEvent arg0) {
		OgnlRuntime.setSecurityManager(null);
	}

	@Override
	public void contextInitialized(ServletContextEvent arg0) {
	}
}
