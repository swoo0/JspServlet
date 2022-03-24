package kr.or.ddit.controller;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jsp.dto.MenuVO;
import com.jsp.service.LoginSearchMemberService;
import com.jsp.service.MenuService;

@Controller
public class CommonController {

	@Autowired
	private MenuService menuService;
	
	@Autowired
	private LoginSearchMemberService memberService;
	
//	@Resource(name = "memberService")
//	LoginSeachMemberService loginSeachMemberService;
	
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public void main() throws Exception {}
	
	
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String index(@RequestParam(defaultValue = "M000000") String mCode, Model model) throws Exception {
		String url = "common/indexPage";
		
		List<MenuVO> menuList = menuService.getMainMenuList();
		MenuVO menu = menuService.getMenuByMcode(mCode);
		
		model.addAttribute("menuList", menuList);
		model.addAttribute("menu", menu);
		
		return url;
	}
	
	@RequestMapping(value = "/common/loginTimeOut")
	public String loginTimeOut(Model model) throws Exception {
		String url = "security/loginTimeOut";
		
		model.addAttribute("message", "세션이 만료되었습니다.\\n다시 로그인 하세요!");
		
		return url;
	}
	
	@RequestMapping(value = "/security/accessDenied")
	public void accessDenied() {}
	
	@RequestMapping(value = "/common/loginForm", method = RequestMethod.GET)
	public String loginForm(@RequestParam(defaultValue = "") String error, HttpServletResponse resp) {
		String url = "common/loginForm";
		
		if (error.equals("1")) {
			resp.setStatus(302);
		}
		return url;
	}

	
/*
	@RequestMapping(value = "/common/login", method = RequestMethod.POST)
	public String login(HttpServletRequest req, String id, String pwd, Model model) throws Exception {
		String url = "redirect:/index.do";
		
		try {
			memberService.login(id, pwd);
			
			HttpSession session = req.getSession();
			session.setAttribute("loginUser", memberService.getMember(id));
			session.setMaxInactiveInterval(6 * 60 * 10);
			
		} catch (IdNotFoundException | InvalidPasswordException e) {
			model.addAttribute("message", e.getMessage());
			url = "common/login_fail";
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}

		return url;
	}
	
	@RequestMapping(value = "/common/logout", method = RequestMethod.GET)
	public String logout(HttpServletRequest req) throws Exception {
		String url = "redirect:/";
		
		HttpSession session = req.getSession();
		session.invalidate();
		
		return url;
	}
*/
	
	
	
	
	
	
	
	
	
	
	
	
	
	@RequestMapping(value = "/subMenu", method = RequestMethod.GET)
	@ResponseBody
	public ResponseEntity<List<MenuVO>> subMenu(HttpServletResponse resp, String mCode) throws Exception {
		ResponseEntity<List<MenuVO>> entity = null;
		
		List<MenuVO> subMenu = null;
		
		try {
			subMenu = menuService.getSubMenuList(mCode);
			
			entity = new ResponseEntity<List<MenuVO>>(subMenu, HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<List<MenuVO>>(HttpStatus.INTERNAL_SERVER_ERROR);
			e.printStackTrace();
			
		}
		
		return entity;
	}
	
	
	
	
	
	
	
	
	
}
