package com.jsp.action.common;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jsp.action.Action;
import com.jsp.dto.MenuVO;
import com.jsp.service.MenuService;

public class IndexPageAction implements Action {

	private MenuService menuService;
	public void setMenuService(MenuService menuService) {
		this.menuService = menuService;
	}
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse reps) throws Exception {
		String url = "common/indexPage";
		
		try {
			List<MenuVO> menuList = menuService.getMainMenuList();

			req.setAttribute("menuList", menuList);
		} catch (Exception e) {
			e.printStackTrace();
			// Exception 처리 : log 기록...
			throw e;
		}
		
		
		return url;
	}
}