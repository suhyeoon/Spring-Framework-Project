package spring.web.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class InfoController {

	// 소개 컨트롤러
	@RequestMapping(value = "/info/info", method = RequestMethod.GET)
	public String infoForm(HttpServletRequest req) {
		String check = req.getParameter("check");
		System.out.println(check);
		req.setAttribute("check", check);
		return "info/info";
	}

	// 오시는길 컨트롤러
	@RequestMapping(value = "/info/map", method = RequestMethod.GET)
	public String mapForm(HttpServletRequest req) {

		return "info/map";
	}

	// 주변관광지 컨트롤러
	@RequestMapping(value = "/info/tour", method = RequestMethod.GET)
	public String tourForm(HttpServletRequest req) {

		return "info/tour";
	}

	// 배치도 컨트롤러
	@RequestMapping(value = "/info/blockPlan", method = RequestMethod.GET)
	public String blockPlanForm(HttpServletRequest req) {

		return "info/blockPlan";
	}

}
