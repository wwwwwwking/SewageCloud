package com.es.sewage.core.dao;

import javax.jdo.JDOHelper;
import javax.jdo.PersistenceManagerFactory;

/**
 * 单例网络连接
 * @author youwc
 */
public final class PMF {
	private static final PersistenceManagerFactory pmfInstance = 
		JDOHelper.getPersistenceManagerFactory("transactions-optional");
	
	private PMF() {}
	
	public static  PersistenceManagerFactory getInstance() {
		return pmfInstance;
	}
}
