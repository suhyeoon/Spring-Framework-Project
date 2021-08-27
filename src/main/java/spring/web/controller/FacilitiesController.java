package spring.web.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class FacilitiesController {

	// 스파 컨트롤러
	@RequestMapping(value="/spa", method=RequestMethod.GET)
	public String spaForm(HttpServletRequest req) {
		return "facilities/spa";
	}
	
	// 라운지 컨트롤러
	@RequestMapping(value="/lounge", method=RequestMethod.GET)
	public String loungeForm(HttpServletRequest req) {
		return "facilities/lounge";
	}
	
	// 갤러리 컨트롤러
	@RequestMapping(value="/gallery", method=RequestMethod.GET)
	public String galleryForm(HttpServletRequest req) {
		return "facilities/gallery";
	}
	
	// 비지니스 센터 컨트롤러
	@RequestMapping(value="/business", method=RequestMethod.GET)
	public String businessForm(HttpServletRequest req) {
		return "facilities/business";
	}
}
