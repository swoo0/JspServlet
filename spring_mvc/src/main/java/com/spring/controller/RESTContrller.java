package com.spring.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class RESTContrller {

	private Map<String, Object> dataMap = new HashMap<String, Object>();
	
	{
		dataMap.put("abc", "123");
		dataMap.put("ㄱㄴㄷ", "123");
		
		Map<String, String> tempMap = new HashMap<String, String>();
		tempMap.put("a", "1");
		tempMap.put("b", "2");
		tempMap.put("c", "3");
		tempMap.put("d", "4");
		
		dataMap.put("temp", tempMap);
	}
	
//	@RequestMapping(value = "/rest/old", method = RequestMethod.GET)
//	public void restOld(HttpServletResponse resp) throws Exception {
//		
//		// 출력
//		ObjectMapper mapper = new ObjectMapper();
//		
//		// content Type 결정
//		resp.setContentType("application/json;charset=utf-8");
//		
//		// 내보내기
//		PrintWriter out = resp.getWriter();
//		out.print(mapper.writeValueAsString(dataMap));
//		
//		// out 객체를 종료하고 환원.
//		out.close();
//	}
	
	@RequestMapping(value = "rest/spring", method = RequestMethod.GET)
	// @ResponseBody
	public Map<String, Object> restSpring() throws Exception {
		return dataMap;
	}
	
	@RequestMapping(value = "rest/best", method = RequestMethod.GET)
	// @ResponseBody
	public ResponseEntity<Map<String, Object>> restSpringBest() throws Exception {
		
		ResponseEntity<Map<String, Object>> result = null;
		
		try {
			if (1 == 1) throw new Exception();
			
			result = new ResponseEntity<Map<String, Object>>(dataMap, HttpStatus.OK);
		} catch (Exception e) {
			result = new ResponseEntity<Map<String, Object>>(dataMap, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return result;
	}
	
}





















