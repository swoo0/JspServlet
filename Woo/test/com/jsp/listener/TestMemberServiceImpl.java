package com.jsp.listener;

import java.util.List;
import java.util.Map;

import org.junit.After;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;

import com.jsp.context.ApplicationContext;
import com.jsp.dto.MemberVO;
import com.jsp.service.MemberService;

public class TestMemberServiceImpl {

	private MemberService memberService;
	
	
	@Before
	public void init() throws Exception {
		MockApplicationContextInitListener listener = new MockApplicationContextInitListener();
		
		String beanConfigXml = "classpath:com/jsp/context/application-context.xml";
		
		listener.contextInitialized(beanConfigXml);
		
		memberService = (MemberService) ApplicationContext.getApplicationContext().get("memberService");
	}
	
	@Test
	public void testGetMemberList() throws Exception {
		List<MemberVO> memberList = memberService.getMemberList();
		
		Assert.assertEquals(5, memberList.size());
		
	}
	
	@After
	public void destroy() throws Exception {
		Map<String, Object> application = ApplicationContext.getApplicationContext() ;
		application = null;
	}
	
	
}
