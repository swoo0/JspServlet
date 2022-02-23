package com.jsp.action.member;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jsp.action.Action;
import com.jsp.dto.MemberVO;
import com.jsp.service.MemberService;

public class MemberListAction implements Action {

	private MemberService memberService;
	public void setMemberService(MemberService memberService) {
		this.memberService = memberService;
	}
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		String url = "member/list";
		
		try {

			List<MemberVO> memberList = memberService.getMemberList();
			req.setAttribute("memberList", memberList);
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
		return url;
	}
}
