package kr.or.ddit.controller;

import java.sql.SQLException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jsp.command.Criteria;
import com.jsp.dto.NoticeVO;
import com.jsp.service.NoticeService;

@Controller
@RequestMapping("/notice")
public class NoticeController {

	@Autowired
	private NoticeService noticeService;
	
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String main() throws Exception {
		String url = "notice/main.open";
		return url;
	}
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ModelAndView list(Criteria cri, ModelAndView mnv) throws Exception {
		String url = "notice/list.open";
		
		Map<String, Object> dataMap = noticeService.getNoticeList(cri);
		mnv.addObject("dataMap", dataMap);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping(value = "/registForm", method = RequestMethod.GET)
	public String registForm() {
		String url = "notice/registForm.open";
		return url;
	}
	
	@RequestMapping(value = "/regist", method = RequestMethod.POST)
	public String regist(NoticeVO notice, HttpServletRequest req, RedirectAttributes rttr) throws Exception {
		String url = "redirect:/notice/list";
		
		notice.setTitle((String)req.getAttribute("XSStitle"));
		
		noticeService.regist(notice);;
		
		rttr.addFlashAttribute("from", "regist");
		
		return url;
	}
	
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public ModelAndView detail(int nno, @RequestParam(defaultValue = "") String from,
							   HttpServletRequest req, ModelAndView mnv) throws SQLException {
		String url = "notice/detail.open";
		
		NoticeVO notice = null;
		
		if (!from.equals("list")) {
			notice = noticeService.getNoticeForModify(nno);
		} else {
			notice = noticeService.getNotice(nno);
			url = "redirect:/notice/detail.do?nno=" + nno;
		}
		
		mnv.addObject("notice", notice);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping(value = "/modifyForm", method = RequestMethod.GET)
	public ModelAndView modifyForm(int nno, ModelAndView mnv) throws Exception {
		String url = "notice/modifyForm.open";
		
		NoticeVO notice = noticeService.getNoticeForModify(nno);
		
		mnv.addObject("notice", notice);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String modify(NoticeVO notice, HttpServletRequest req, RedirectAttributes rttr) throws Exception {
		String url = "redirect:/notice/detail.do";
		
//		notice.setTitle(HTMLInputFilter.htmlSpecialChars(notice.getTitle()));
		notice.setTitle((String)req.getAttribute("XSStitle"));
		
		noticeService.modify(notice);

		rttr.addAttribute("nno", notice.getNno());
		rttr.addFlashAttribute("from", "modify");
		
		return url;
	}
	
	@RequestMapping(value="/remove", method=RequestMethod.GET)
	public String remove(int nno, RedirectAttributes rttr) throws Exception {
		String url = "redirect:/notice/detail.do";
		
		noticeService.remove(nno);
		
		rttr.addAttribute("nno", nno);
		rttr.addFlashAttribute("from", "remove");
		
		return url;
	}
	
}
