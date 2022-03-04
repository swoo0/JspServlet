package com.jsp.controller;

import java.lang.reflect.Method;

import javax.servlet.http.HttpServletRequest;

public class XSSHttpRequestParameterAdapter extends HttpRequestParameterAdapter {
	
	// 상속 받았지만 클래스가 다르기 때문에 오버로딩은 아니다.
	public static Object execute(HttpServletRequest req, Class<?> className, boolean xss) throws Exception {
		
		Object result = null;
		
		if (xss) {
			XSSResolver.parseXSS(req);
			
			// 의존성 확인 및 조립
			Method[] methods = className.getMethods();

			// 인스턴스 성성
			result = className.newInstance();

			// setter 확인
			for (Method method : methods) {
				if (method.getName().indexOf("set") == 0) {
					String requestParamName = method.getName().replace("set", "");
					requestParamName = (requestParamName.charAt(0) + "").toLowerCase() + requestParamName.substring(1);

					String[] paramValues = (String[]) req.getAttribute("XSS" + requestParamName);

					if (paramValues != null && paramValues.length > 0) {
						if (method.getParameterTypes()[0].isArray()) {
							method.invoke(result, new Object[] { paramValues });
						} else {
							method.invoke(result, paramValues[0]);
						}
					}
				}
			}
			
		} else {
			result = HttpRequestParameterAdapter.execute(req, className);
		}
		
		
		return result;
	}
	
}
