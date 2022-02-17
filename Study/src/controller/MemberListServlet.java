package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSessionFactory;

import dao.MemberDAO;
import dto.MemberVO;
import service.MemberService;
import service.MemberServiceImpl;

public class MemberListServlet extends HttpServlet {
	
	private MemberService memberService;
	
	@Override
	public void init(ServletConfig config) throws ServletException {
		
		String memberServiceStr = config.getInitParameter("memberService");
		String memberDAOStr = config.getInitParameter("memberDAO");
		String SqlSessionFactoryStr = config.getInitParameter("sqlSessionFactory");
		
		try {
			memberService = (MemberService) Class.forName(memberServiceStr).newInstance();
			MemberDAO memberDAO = (MemberDAO) Class.forName(memberDAOStr).newInstance();
			SqlSessionFactory sqlSessionFactory = (SqlSessionFactory) Class.forName(SqlSessionFactoryStr).newInstance();
				
			if (memberService instanceof MemberServiceImpl) {
				MemberServiceImpl memberServiceImpl = (MemberServiceImpl) memberService;
				memberServiceImpl.setSqlSessionFactory(sqlSessionFactory);
				memberServiceImpl.setMemberDAO(memberDAO);;
				
				System.out.println("memberService injection clear!");
			}
		} catch (Exception e) {
			System.out.println("초기화 실패입니다.");
			e.printStackTrace();
		}
		
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String url = "/WEB-INF/views/grid.jsp";
		
		List<MemberVO> memberList = null;
		try {
			memberList = memberService.getMemberList();
		} catch (Exception e) {
			url = "/WEB-INF/views/grid_fail.jsp";
			e.printStackTrace();
		}
		
		req.setAttribute("memberList", memberList);
		
		req.getRequestDispatcher(url).forward(req, resp);
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		super.doGet(req, resp);
	}
	
	
}
