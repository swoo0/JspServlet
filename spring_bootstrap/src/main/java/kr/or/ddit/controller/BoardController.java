package kr.or.ddit.controller;

import java.sql.SQLException;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jsp.command.Criteria;
import com.jsp.dto.BoardVO;
import com.jsp.service.BoardService;

@Controller
@RequestMapping("/board")
public class BoardController {
	
	@Resource(name = "boardService")
	private BoardService service;
	
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String main() throws Exception {
		String url = "main.open";
		return url;
	}
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ModelAndView list(Criteria cri, ModelAndView mnv) throws SQLException {
		String url = "board/list.open";
		
		Map<String, Object> dataMap = service.getBoardList(cri);
		
		mnv.addObject("dataMap", dataMap);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping(value = "/registForm", method = RequestMethod.GET)
	public String registForm() throws Exception {
		String url = "board/registForm.open";
		return url;
	}
	
	@RequestMapping(value = "/regist", method = RequestMethod.POST)
	public String regist(BoardVO board, HttpServletRequest req, RedirectAttributes rttr) throws Exception {
		String url = "redirect:/board/list.do";
		
		board.setTitle((String)req.getAttribute("XSStitle"));
		
		service.regist(board);
		
		rttr.addFlashAttribute("from", "regist");
		
		return url;
	}
	
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public ModelAndView detail(int bno, String from, ModelAndView mnv) throws SQLException {
		String url = "board/detail.open";
		
		BoardVO board = null;
		if (from != null && from.equals("list")) {
			board = service.getBoard(bno);
			url = "redirect:/board/detail.do?bno=" + bno;
		} else {
			board = service.getBoardForModify(bno);
		}
		
		mnv.addObject("board", board);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	
	@RequestMapping(value = "modifyForm", method = RequestMethod.GET)
	public ModelAndView modifyFrom(int bno, ModelAndView mnv) throws Exception {
		String url = "board/modifyForm.open";
		
		BoardVO board = service.getBoardForModify(bno);
		
		mnv.addObject("board", board);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping(value = "modify", method = RequestMethod.POST)
	public String modify(BoardVO board, HttpServletRequest req, RedirectAttributes rttr) throws Exception {
		String url = "redirect:/board/detail.do";
		
		board.setTitle((String) req.getAttribute("XSStitle"));
		
		service.modify(board);
		
		rttr.addAttribute("bno", board.getBno());
		rttr.addFlashAttribute("from", "modify");
		
		return url;
	}
	
	@RequestMapping(value = "remove", method = RequestMethod.POST)
	public String remove(int bno, RedirectAttributes rttr) throws Exception {
		String url = "redirect:/board/detail.do";
		
		service.remove(bno);

		rttr.addAttribute("bno", bno);
		rttr.addFlashAttribute("from", "remove");
		
		return url;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
