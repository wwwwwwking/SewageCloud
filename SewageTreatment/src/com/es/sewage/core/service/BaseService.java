package com.es.sewage.core.service;

import com.es.sewage.core.dao.QueryResult;
import com.google.appengine.api.datastore.Key;

public interface BaseService<T> {
	public abstract T add(T entity);			// 增
	public abstract T update(T entity);		// 改
	public abstract void delete(T entity);	// 删
	public abstract void delete(Long key);	// 删
	public abstract T get(Long pk);			// 查
	public abstract QueryResult<T> getPaginationData(String filter, String ordering, 
			long firstResult, long maxResult);
	public abstract QueryResult<T> getPaginationData(String filter, String ordering);
	public abstract QueryResult<T> getPaginationData(String filter, long firstResult,
			long maxResult);
	public abstract QueryResult<T> getPaginationData(long firstResult, long maxResult);
	public abstract QueryResult<T> getPaginationData(String fileter);
	public abstract QueryResult<T> getPaginationData();
}
