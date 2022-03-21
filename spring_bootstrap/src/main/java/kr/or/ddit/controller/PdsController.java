package kr.or.ddit.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.IOUtils;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jsp.command.Criteria;
import com.jsp.dto.AttachVO;
import com.jsp.dto.PdsVO;
import com.jsp.service.PdsService;
import com.jsp.util.MakeFileName;

import kr.or.ddit.command.PdsRegistCommand;

@Controller
@RequestMapping("/pds")
public class PdsController {

	@Resource(name = "pdsService")
	private PdsService service;

	@Resource(name = "fileUploadPath")
	private String fileUploadPath;
	
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public void main() throws Exception {}
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void list(Criteria cri, Model model) throws Exception {
			
		Map<String, Object> dataMap = service.getList(cri);
		model.addAttribute("dataMap", dataMap);
	}
	
	@RequestMapping(value = "/registForm", method = RequestMethod.GET)
	public void registForm() throws Exception {}
	
	
	@RequestMapping(value = "/regist", method = RequestMethod.POST, produces = "text/plain;charset=utf-8")
	public String regist(PdsRegistCommand pdsCMD, HttpServletRequest req, RedirectAttributes rttr) throws Exception {
		String url = "redirect:/pds/list.do";
		
		PdsVO pds = pdsCMD.toPdsVO();
		
		List<MultipartFile> multiFiles = pdsCMD.getUploadFile();
		List<AttachVO> attachList = new ArrayList<AttachVO>();
		
		String savePath = this.fileUploadPath;
		if (multiFiles != null) for (MultipartFile multi : multiFiles) {
			String fileName = MakeFileName.toUUIDFileName(multi.getOriginalFilename(), "$$");
			File file = new File(savePath, fileName);
			
			file.mkdirs();
			
			multi.transferTo(file);
			
			AttachVO attach = new AttachVO();
			attach.setFileName(fileName);
			attach.setFileType(fileName.substring(fileName.lastIndexOf(".") + 1));
			attach.setUploadPath(savePath);
			
			attachList.add(attach);
		}
		
		pds.setAttachList(attachList);
		pdsCMD.setTitle((String) req.getAttribute("XSStitle"));
		
		// DB 저장
		service.regist(pds);
		
		rttr.addFlashAttribute("from", "regist");
		
		return url;
	}
	
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public ModelAndView detail(int pno, String from, ModelAndView mnv) throws Exception {
		String url = "pds/detail";
		
		PdsVO pds = null;
		if (from != null && from.equals("list")) {
			pds = service.read(pno);
			url = "redirect:/pds/detail.do?pno=" + pno;
		} else {
			pds = service.getPds(pno);
		}
		
		mnv.addObject("pds", pds);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping(value = "/getFile", method = RequestMethod.GET, produces = "text/plain;charset:utf-8")
	@ResponseBody
	public ResponseEntity<byte[]> getFile(int ano) throws Exception {
		
		ResponseEntity<byte[]> entity = null;

		AttachVO attach = service.getAttachByAno(ano);
		
		String fileName = attach.getFileName();
		String savedPath = this.fileUploadPath;
		
		InputStream in = null;
		try {
			in = new FileInputStream(new File(savedPath, fileName));
			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), HttpStatus.CREATED);
			
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.INTERNAL_SERVER_ERROR);
		} finally {
			in.close();
		}
		
		return entity;
	}
	
	@RequestMapping(value = "/modifyForm", method = RequestMethod.GET)
	public ModelAndView modifyForm(int pno, ModelAndView mnv) throws Exception {
		String url = "pds/modifyForm";
		
		PdsVO pds = service.getPds(pno);
		
		mnv.addObject("pds", pds);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String modify(PdsVO pds, int ano, HttpServletRequest req, RedirectAttributes rttr) throws Exception {
		String url = "redirect:/pds/detail.do";
		
		
		
		
		
		
		pds.setTitle((String) req.getAttribute("XSStitle"));
		
		service.modify(pds);
		
		rttr.addAttribute("pno", pds.getPno());
		rttr.addFlashAttribute("from", "modify");
		
		return url;
	}
	
	
	@RequestMapping(value = "/remove", method = RequestMethod.GET)
	public String remove(int pno, RedirectAttributes rttr) throws Exception {
		String url = "redirect:/pds/detail.do";
		
		service.remove(pno);
		
		rttr.addAttribute("pno", pno);
		rttr.addFlashAttribute("from", "remove");
		
		return url;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
