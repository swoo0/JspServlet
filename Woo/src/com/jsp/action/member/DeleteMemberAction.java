package com.jsp.action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jsp.action.Action;
import com.jsp.service.MemberService;

public class DeleteMemberAction implements Action {
	
	private MemberService memberService;
	public void setMemberService(MemberService memberService) {
		this.memberService = memberService;
	}
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		String url = "member/delete";
		
		String id = req.getParameter("id");
		
		try {
			memberService.remove(id);

//			req.setAttribute("memberList", memberList);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
		return url;
	}

	
}
