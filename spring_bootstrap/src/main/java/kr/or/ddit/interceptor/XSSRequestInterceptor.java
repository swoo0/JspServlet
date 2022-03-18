package kr.or.ddit.interceptor;

import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.josephoconnell.html.HTMLInputFilter;

public class XSSRequestInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest req, HttpServletResponse resp, Object handler) throws Exception {
		
		Enumeration<String> crossParamNames = req.getParameterNames();
		
		while (crossParamNames.hasMoreElements()) {
			
			String paramName = crossParamNames.nextElement();
			String paramValue = req.getParameter(paramName);
			
			req.setAttribute("XSS" + paramName, HTMLInputFilter.htmlSpecialChars(paramValue));
		}
		
		return true;
	}
}