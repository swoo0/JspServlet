package com.jsp.action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jsp.action.Action;
import com.jsp.controller.FileDownloadResolver;
import com.jsp.dto.MemberVO;
import com.jsp.service.MemberService;
import com.jsp.util.GetUploadPath;

public class MemberGetPictureAction implements Action {

	private MemberService memberService;
	public void setMemberService(MemberService memberService) {
		this.memberService = memberService;
	}
	
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String url=null;

		String id = request.getParameter("id");
		
		MemberVO member = memberService.getMember(id);
		
		String fileName = member.getPicture();		
		String savedPath = GetUploadPath.getUploadPath("member.picture.upload");	
		
		FileDownloadResolver.sendFile(fileName,savedPath,request,response);		
		
		return url;
	}

}






