package com.es.sewage.core.dao;

import com.google.appengine.api.datastore.Key;

/**
 * 数据处理的基础接口
 * @author youwc
 */
public interface BaseDao<T> {
	public T add(T entity);			// 增
	public T update(T entity);		// 改
	public void delete(T entity);	// 删
	public void delete(Long key);	// 删
	public T get(Long pk);			// 查
	public QueryResult<T> getPaginationData(String filter, String ordering, 
			long firstResult, long maxResult);
	public QueryResult<T> getPaginationData(String filter, String ordering);
	public QueryResult<T> getPaginationData(String filter, long firstResult,
			long maxResult);
	public QueryResult<T> getPaginationData(long firstResult, long maxResult);
	public QueryResult<T> getPaginationData(String fileter);
	public QueryResult<T> getPaginationData();
	
	public Object query(String djoql);	// 自由查询
}
