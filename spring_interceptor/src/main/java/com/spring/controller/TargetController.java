package com.spring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

@Controller
public class TargetController {

	@RequestMapping(value = "/target")
	public String test(int num, Model model) throws Exception {
		String url = "/test/main";
		
		if (num == 1) {
			throw new Exception("from TestController");
		}
		
		model.addAttribute("message", "To the victory!");
		
		return url;
	}
}