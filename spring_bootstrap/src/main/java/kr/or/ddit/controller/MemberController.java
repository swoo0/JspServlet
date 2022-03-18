package kr.or.ddit.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.SQLException;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
	
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public void main() {}
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ModelAndView list(Criteria cri, ModelAndView mnv) throws SQLException {
		String url = "member/list";
		
		Map<String, Object> dataMap = null;
		
		try {
			dataMap = memberService.getSearchMemberList(cri);
		} catch (SQLException e) {
			e.printStackTrace();
			throw new SQLException();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		mnv.addObject("dataMap", dataMap);
//		mnv.addAllObjects(dataMap);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping(value = "/registForm", method = RequestMethod.GET)
	public void registForm() {}
	
	
	@Resource(name = "picturePath")
	private String picturePath;
	
	private String savePicture(String oldPicture, MultipartFile multi) throws Exception {
		String fileName = null;
		
		// 파일 유무 확인
		if (!(multi == null || multi.isEmpty() || multi.getSize() > 1024 * 1024 * 5)) {
			
			// 파일 저장 폴더 설정
			String uploadPath = picturePath;
			fileName = MakeFileName.toUUIDFileName(multi.getOriginalFilename(), "$$");
			File storeFile = new File(uploadPath, fileName);
			
			storeFile.mkdirs();
			
			// local HDD 에 저장.
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
	
	
	@RequestMapping(value = "picture", method = RequestMethod.POST, produces = "text/plain;charset=utf-8")
	@ResponseBody
	public ResponseEntity<String> picture(@RequestParam("pictureFile") MultipartFile multi,
																	   String oldPicture) throws Exception {
		ResponseEntity<String> entity = null;
		
		String result = "";
		HttpStatus status = null;
		
		// 파일저장확인
		if ((result = savePicture(oldPicture, multi)) == null) {
			result = "업로드 실패했습니다.!";
			status = HttpStatus.BAD_REQUEST;
		} else {
			status = HttpStatus.OK;
		}
		
		entity = new ResponseEntity<String>(result, status);
		
		return entity;
	}
	
	@RequestMapping(value = "/getPicture", produces = "text/plain;charset=utf-8")
	@ResponseBody
	public ResponseEntity<byte[]> getPicture(String id) throws Exception {
		
		String picture = memberService.getMember(id).getPicture();
		
		InputStream in = null;
		ResponseEntity<byte[]> entity = null;
		String imgPath = this.picturePath;
		
		try {
			in = new FileInputStream(new File(imgPath, picture));
			
			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), HttpStatus.CREATED);
			
		} catch (IOException e) {
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.INTERNAL_SERVER_ERROR);
		} finally {
			in.close();
		}
		
		return entity;
	}
	
	@RequestMapping("/idCheck")
	@ResponseBody
	public ResponseEntity<String> idCheck(String id) throws Exception {
		ResponseEntity<String> entity = null;
		
		try {
			MemberVO member = memberService.getMember(id);
			
			if (member != null) {
				entity = new ResponseEntity<String>("duplicated", HttpStatus.OK);
			} else {
				entity = new ResponseEntity<String>("", HttpStatus.OK);
			}
		} catch (SQLException e) {
			entity = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return entity;
	}
	
	@RequestMapping(value = "/regist", method = RequestMethod.POST)
	public String regist(MemberRegistCommand memberReq) throws Exception, IOException {
		String url = "member/regist_success";
		
		MemberVO member = memberReq.toMemberVO();
		memberService.regist(member);
		
		return url;
	}
	
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String detail(String id, Model model) throws Exception {
		String url = "member/detail";
		
		MemberVO member = memberService.getMember(id);
		model.addAttribute("member", member);
		
		return url;
	}
	
	@RequestMapping(value = "/modifyForm", method = RequestMethod.GET)
	public void modifyForm(String id, Model model) throws Exception {
		
		MemberVO member = memberService.getMember(id);
		
		String picture = MakeFileName.parseFileNameFromUUID(member.getPicture(), "\\$\\$");
		member.setPicture(picture);
		
		model.addAttribute("member", member);
		
	}
	
	
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String modify(MemberModifyCommand modifyReq, HttpSession session, RedirectAttributes rttr) throws Exception {
		String url = "redirect:/member/detail.do";

		MemberVO member = modifyReq.toMemberVO();
		
		// 신규 파일 변경 및 기존파일 삭제
		String oldPicture = memberService.getMember(member.getId()).getPicture();
		if (modifyReq.getUploadPicture() != null && !modifyReq.getUploadPicture().isEmpty()) {
			String fileName = savePicture(oldPicture, modifyReq.getPicture());
			member.setPicture(fileName);
		} else {
			member.setPicture(oldPicture);
		}
		
		// DB 내용 수정
		memberService.modify(member);
		
		// 로그인한 사용자의 경우 수정된 정보로 session 업로드
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
		
		// 이미지 파일을 삭제
		member = memberService.getMember(id);
		
		String savePath = this.picturePath;
		File imageFile = new File(savePath, member.getPicture());
		if (imageFile.exists()) {
			imageFile.delete();
		}
		
		// DB삭제
		memberService.remove(id);
		
		// 삭제되는 회원이 로그인 회원인 경우 로그아웃 해야함.
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