package com.es.sewage.core.dao;

import java.io.Serializable;
import java.util.List;

/**
 * 封装查询结果
 * @author youwc
 */
public class QueryResult<T> implements Serializable {
	private List<T> resultList;
	private long totalRecord;

	public List<T> getResultList() {
		return resultList;
	}

	public void setResultList(List<T> resultList) {
		this.resultList = resultList;
	}

	public long getTotalRecord() {
		return totalRecord;
	}

	public void setTotalRecord(long totalRecord) {
		this.totalRecord = totalRecord;
	}
}
