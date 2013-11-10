package com.es.sewage.core.util;

import javax.jdo.PersistenceManager;
import javax.jdo.Query;

public class GSQLUtil {
	public static Query getSelectSqlStr(PersistenceManager pm, Class<?> c,
			String filter, String ordering, long firstResult, long maxResult) {
		Query query = pm.newQuery(c);
		if (filter != null) {
			query.setFilter(filter);
		}
		if (ordering != null) {
			query.setOrdering(ordering);
		}
		if (firstResult != -1 && maxResult != -1) {
			query.setRange(firstResult, maxResult);
		}
		return query;
	}
	
	public static Query getSelectSqlStr(PersistenceManager pm, Class<?> c, String filter,
			String ordering) {
		long min = -1;
		return getSelectSqlStr(pm, c, filter, ordering, min, min);
	}
	
	public static Query getSelectSqlStr(PersistenceManager pm, Class<?> c, String filter) {
		return getSelectSqlStr(pm, c, filter, null);
	}
	
	public static Query getSelectSqlStr(PersistenceManager pm, Class<?> c) {
		return getSelectSqlStr(pm, c, null);
	}
}
