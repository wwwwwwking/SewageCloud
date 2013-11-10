package com.es.sewage.core.dao;

import java.util.ArrayList;
import java.util.List;

import javax.jdo.PersistenceManager;
import javax.jdo.Query;

import org.apache.jsp.ah.entityDetailsBody_jsp;

import com.es.sewage.core.util.GSQLUtil;
import com.es.sewage.core.util.GenericsUtil;
import com.google.appengine.api.datastore.Key;

public class BaseDaoImpl<T> implements BaseDao<T> {
	protected Class<?> entityClass = GenericsUtil.getSuperClassGenricType(this.getClass());
	
	@Override
	public T add(T entity) {
		PersistenceManager pm = PMF.getInstance().getPersistenceManager();
		try {
			// System.out.println(">>>>>>>>>>>>> " + entity.toString());
			entity = pm.makePersistent(entity);
		} catch (Exception e) {
			System.out.println("添加实体 " + entity.getClass().getName() + " 出错: " + e.getMessage());
		} finally {
			pm.close();
		}
		return entity;
	}

	@Override
	public T update(T entity) {
		PersistenceManager pm = PMF.getInstance().getPersistenceManager();
		try {
			entity = pm.makePersistent(entity);
		} catch (Exception e) {
			System.out.println("更新实体 " + entity.getClass().getName() + " 出错: " + e.getMessage());
		} finally {
			pm.close();
		}
		return entity;
	}
	
	@Override
	public void delete(Long key) {
		PersistenceManager pm = PMF.getInstance().getPersistenceManager();
		try {
			pm.deletePersistent(pm.getObjectById(entityClass, key));
		} catch (Exception e) {
			System.out.println("删除实体 " + entityClass.getName() + " 出错: " + e.getMessage());
		} finally {
			pm.close();
		}	
	}
	
	@Override
	public void delete(T entity) {
		PersistenceManager pm = PMF.getInstance().getPersistenceManager();
		try {
			pm.deletePersistent(entity);
		} catch (Exception e) {
			System.out.println("删除实体 " + entity.getClass().getName() + " 出错: " + e.getMessage());
		} finally {
			pm.close();
		}	
	}

	@Override
	public QueryResult<T> getPaginationData(String filter, String ordering,
			long firstResult, long maxResult) {
		PersistenceManager pm = PMF.getInstance().getPersistenceManager();
		QueryResult<T> qr = new QueryResult<T>();
		try {
			Query query = GSQLUtil.getSelectSqlStr(pm, entityClass, filter,
					ordering, firstResult, maxResult);
			Object obj = query.execute();
			if (obj != null) {
				List<T> list1 = (List<T>) obj;
				List<T> list = new ArrayList();
				if (list1 != null) {
					for (int i = 0; i < list1.size(); ++i) {
						list.add((T)list1.get(i));
					}
				}
				qr.setResultList(list);
				Query queryCount = GSQLUtil.getSelectSqlStr(pm, entityClass, filter);
				List<T> l = (List<T>) queryCount.execute();
				qr.setTotalRecord(l.size());
			} else {
				qr.setResultList(new ArrayList<T>());
				qr.setTotalRecord(0);
			}
		} catch (Exception e) {
			System.out.println("查询实体出错: " + e.getMessage());
		} finally {
			pm.close();
		}
		return qr;
	}

	@Override
	public QueryResult<T> getPaginationData(String filter, String ordering) {
		long min = -1;
		return getPaginationData(filter, ordering, min, min);
	}

	@Override
	public QueryResult<T> getPaginationData(String filter, long firstResult,
			long maxResult) {
		return getPaginationData(filter, null, firstResult, maxResult);
	}

	@Override
	public QueryResult<T> getPaginationData(long firstResult, long maxResult) {
		return getPaginationData(null, null, firstResult, maxResult);
	}

	@Override
	public QueryResult<T> getPaginationData(String fileter) {
		return getPaginationData(fileter, null);
	}

	@Override
	public QueryResult<T> getPaginationData() {
		return getPaginationData(null);
	}

	@Override
	public T get(Long pk) {
		PersistenceManager pm = PMF.getInstance().getPersistenceManager();
		try {
			T obj = (T) pm.getObjectById(entityClass, pk);
			return obj;
		} catch (Exception e) {
			System.out.println("查询实体出错: " + e.getMessage());
		} finally {
			pm.close();
		}
		return null;
	}

	@Override
	public List query(String djoql) {
		List obj = null;
		PersistenceManager pm = PMF.getInstance().getPersistenceManager();
		try {
			Query query =  pm.newQuery(djoql);
			obj = (List)query.execute();
		} catch (Exception e) {
			System.out.println("自由查询出错: " + e.getMessage());
		} finally {
			pm.close();
		}
		return obj;
	}

}
