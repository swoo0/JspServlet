package com.jsp.controller;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import com.josephoconnell.html.HTMLInputFilter;

public class XSSResolver {

	public static void parseXSS(HttpServletRequest req) throws IOException,ServletException {
		
		Enumeration<String> crossParamNames = req.getParameterNames();
		
		String paramName = crossParamNames.nextElement();
		String[] paramValue = req.getParameterValues(paramName);
		
		System.out.println(paramName + ":" + paramValue.length);
		if (paramValue != null) for (int i = 0; i < paramValue.length; i++) {
			paramValue[i] = HTMLInputFilter.htmlSpecialChars(paramValue[i]);
		}
		
		req.setAttribute("XSS" + paramName, paramValue);
	}
	
}
