package kr.or.ddit.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jsp.service.MemberService;

@Controller
public class MemberController {

	@Autowired
	private MemberService memberService;
	
	
}
