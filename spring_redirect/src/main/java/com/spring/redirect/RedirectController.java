package com.spring.redirect;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class RedirectController {

	@RequestMapping(value = "/a")
	public String a(RedirectAttributes rttr) {
		String url = "redirect:receive";
		
//		rttr.addAttribute("name", "woo");
//		rttr.addAttribute("message", "배고파..");
		
		rttr.addFlashAttribute("name", "woo");
		
		return url;
	}
	
	@RequestMapping(value = "/receive")
	public void receive() { // String name, Model model
		// model.addAttribute("name", name);
	}
	
	

	
}
