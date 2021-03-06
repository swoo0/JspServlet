package kr.or.ddit.controller;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jsp.command.Criteria;
import com.jsp.command.MemberRegistCommand;
import com.jsp.dto.MemberVO;
import com.jsp.service.LoginSearchMemberService;
import com.jsp.util.MakeFileName;

import kr.or.ddit.command.MemberModifyCommand;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Autowired
	private LoginSearchMemberService memberService;
	
	@Autowired
	private ExceptionLoggerHelper exceptionLogger;
	
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String main() {
		String url = "member/main.open";
		return url;
	}
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ModelAndView list(Criteria cri, HttpServletRequest req, ModelAndView mnv) throws SQLException {
		String url = "member/list.open";
		
		Map<String, Object> dataMap = null;
		
		try {
			dataMap = memberService.getSearchMemberList(cri);
//			if (1 == 1) throw new SQLException();
		} catch (SQLException e) {
			exceptionLogger.write(req, e, memberService.toString());
			throw e;
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		mnv.addObject("dataMap", dataMap);
//		mnv.addAllObjects(dataMap);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping(value = "/registForm", method = RequestMethod.GET)
	public String registForm() {
		String url = "member/registForm.open";
		return url;
	}
	
	
	@Resource(name = "picturePath")
	private String picturePath;
	
	
	
	@RequestMapping(value = "/regist", method = RequestMethod.POST)
	public String regist(MemberRegistCommand memberReq) throws Exception, IOException {
		String url = "member/regist_success";
		
		MemberVO member = memberReq.toMemberVO();
		memberService.regist(member);
		
		return url;
	}
	
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String detail(String id, Model model) throws Exception {
		String url = "member/detail.open";
		
		MemberVO member = memberService.getMember(id);
		model.addAttribute("member", member);
		
		return url;
	}
	
	@RequestMapping(value = "/modifyForm", method = RequestMethod.GET)
	public ModelAndView modifyForm(String id, ModelAndView mnv) throws Exception {
		String url = "member/modifyForm.open";
		
		MemberVO member = memberService.getMember(id);
		
		String picture = MakeFileName.parseFileNameFromUUID(member.getPicture(), "\\$\\$");
		member.setPicture(picture);
		
		mnv.addObject("member", member);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	private String savePicture(String oldPicture, MultipartFile multi) throws Exception {
		String fileName = null;
		
		// ?????? ?????? ??????
		if (!(multi == null || multi.isEmpty() || multi.getSize() > 1024 * 1024 * 5)) {
			
			// ?????? ?????? ?????? ??????
			String uploadPath = picturePath;
			fileName = MakeFileName.toUUIDFileName(multi.getOriginalFilename(), "$$");
			File storeFile = new File(uploadPath, fileName);
			
			storeFile.mkdirs();
			
			// local HDD ??? ??????.
			multi.transferTo(storeFile);
			
			if (oldPicture != null && !oldPicture.isEmpty()) {
				File oldFile = new File(uploadPath, oldPicture);
				if (oldFile.exists()) {
					oldFile.delete();
				}
			}
		}
		return fileName;
	}
	
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String modify(MemberModifyCommand modifyReq, HttpSession session, RedirectAttributes rttr) throws Exception {
		String url = "redirect:/member/detail.do";

		MemberVO member = modifyReq.toMemberVO();
		
		// ?????? ?????? ?????? ??? ???????????? ??????
		String oldPicture = memberService.getMember(member.getId()).getPicture();
		if (modifyReq.getUploadPicture() != null && !modifyReq.getUploadPicture().isEmpty()) {
			String fileName = savePicture(oldPicture, modifyReq.getPicture());
			member.setPicture(fileName);
		} else {
			member.setPicture(oldPicture);
		}
		
		// DB ?????? ??????
		memberService.modify(member);
		
		// ???????????? ???????????? ?????? ????????? ????????? session ?????????
		rttr.addFlashAttribute("parentReload", false);
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		if (loginUser != null && member.getId().contentEquals(loginUser.getId())) {
			session.setAttribute("loginUser", member);
			rttr.addFlashAttribute("parentReload", true);
		}
		
		rttr.addAttribute("id", member.getId());
		rttr.addAttribute("from", "modify");
		rttr.addFlashAttribute("member", memberService.getMember(modifyReq.getId()));
		
		return url;
	}
	
	@RequestMapping(value = "/remove", method = RequestMethod.GET)
	public String remove(String id, HttpSession session, RedirectAttributes rttr) throws Exception {
		String url = "redirect:/member/detail.do";
		
		MemberVO member;
		
		// ????????? ????????? ??????
		member = memberService.getMember(id);
		
		String savePath = this.picturePath;
		File imageFile = new File(savePath, member.getPicture());
		if (imageFile.exists()) {
			imageFile.delete();
		}
		
		// DB??????
		memberService.remove(id);
		
		// ???????????? ????????? ????????? ????????? ?????? ???????????? ?????????.
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		if (loginUser.getId().equals(member.getId())) {
			session.invalidate();
		}
		
		rttr.addFlashAttribute("removeMember", member);
		
		rttr.addAttribute("from", "remove");
		rttr.addAttribute("id", id);
		
		
		return url;
	}
	
}