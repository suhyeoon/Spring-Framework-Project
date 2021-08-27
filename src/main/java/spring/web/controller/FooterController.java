package spring.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class FooterController {
	
	// 사이트맵
	@RequestMapping(value="/siteMap", method=RequestMethod.GET)
	public String siteMapForm(){        		
		return "footer/siteMap";
	}	
	
	// 개인정보처리방침 컨트롤러
	@RequestMapping(value="/privacy", method=RequestMethod.GET)
	public String privacyForm() {
		return "/footer/privacy";
	}
	
	// 회원등급
	@RequestMapping(value="/gradeInfo", method=RequestMethod.GET)
	public String gradeInfoForm(){        		
		return "footer/gradeInfo";
	}
}
