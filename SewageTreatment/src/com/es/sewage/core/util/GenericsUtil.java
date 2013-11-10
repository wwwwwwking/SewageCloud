package com.es.sewage.core.util;

import java.lang.reflect.Method;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;

public class GenericsUtil {
	public static Class getSuperClassGenricType(Class clazz, int index) {
		Type genType = clazz.getGenericSuperclass();
		if (!(genType instanceof ParameterizedType)) {
			return Object.class;
		}
		
		Type[] params = ((ParameterizedType) genType).getActualTypeArguments();
		if (index >= params.length || index < 0) {
			throw new RuntimeException("索引出错");
		}
		
		if (!(params[index] instanceof Class)) {
			return Object.class;
		}
		
		return (Class) params[index];
	}
	
	public static Class getSuperClassGenricType(Class clazz) {
		return getSuperClassGenricType(clazz, 0);
	}
	
	public static Class getMethodGenericReturnType(Method method, int index) {
		Type returnType = method.getGenericReturnType();
		if (returnType instanceof ParameterizedType) {
			ParameterizedType type = (ParameterizedType)returnType;
			Type[] typeArguments = type.getActualTypeArguments();
			if (index > typeArguments.length || index < 0) {
				throw new RuntimeException("索引出错");
			}
			
			return (Class) typeArguments[index];
		}
		return Object.class;
	}
}
