package kr.or.ddit.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class SessionExpiredCheckFilter implements Filter {

	public void destroy() {}

	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws IOException, ServletException {
		String url = "/WEB-INF/views/security/sessionOut.jsp";
		
		String message = "중복 로그인이 확인되었습니다.\\n다시 로그인하면 다른 장치에서 로그인은 취소됩니다.";
		
		req.setAttribute("message", message);
		
		req.getRequestDispatcher(url).forward(req, resp);
	}
	
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {}
	
}
