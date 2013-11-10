package com.es.sewage.core.service.impl;

import com.es.sewage.core.dao.BaseDao;
import com.es.sewage.core.dao.QueryResult;
import com.es.sewage.core.service.BaseService;
import com.google.appengine.api.datastore.Key;

public class BaseServiceImpl<T> implements BaseService<T> {
	protected BaseDao<T> dao = null;

	public void setDao(BaseDao<T> dao) {
		this.dao = dao;
	}
	
	public BaseServiceImpl(BaseDao dao) {
		this.dao = dao;
	}

	@Override
	public T add(T entity) {
		return dao.add(entity);
	}

	@Override
	public T update(T entity) {
		return dao.update(entity);
	}

	@Override
	public void delete(T entity) {
		dao.delete(entity);
	}

	@Override
	public void delete(Long key) {
		dao.delete(key);
	}

	@Override
	public T get(Long pk) {
		return dao.get(pk);
	}

	@Override
	public QueryResult<T> getPaginationData(String filter, String ordering,
			long firstResult, long maxResult) {
		return dao.getPaginationData(filter, ordering, firstResult, maxResult);
	}

	@Override
	public QueryResult<T> getPaginationData(String filter, String ordering) {
		return dao.getPaginationData(filter, ordering);
	}

	@Override
	public QueryResult<T> getPaginationData(String filter, long firstResult,
			long maxResult) {
		return dao.getPaginationData(filter, firstResult, maxResult);
	}

	@Override
	public QueryResult<T> getPaginationData(long firstResult, long maxResult) {
		return dao.getPaginationData(firstResult, maxResult);
	}

	@Override
	public QueryResult<T> getPaginationData(String fileter) {
		return dao.getPaginationData(fileter);
	}

	@Override
	public QueryResult<T> getPaginationData() {
		return dao.getPaginationData();
	}
}
