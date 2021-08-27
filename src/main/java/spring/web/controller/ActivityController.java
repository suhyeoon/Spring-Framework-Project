package spring.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ActivityController {

	
	@RequestMapping(value="/activity/camp", method=RequestMethod.GET)
	public String campForm(){
		return "activity/camp";
	}	

	@RequestMapping(value="/activity/fitness", method=RequestMethod.GET)
	public String fitnessForm(){
		return "activity/fitness";
	}
	
	@RequestMapping(value="/activity/winebar", method=RequestMethod.GET)
	public String winebarForm(){
		return "activity/wineBar";
	}
	
	@RequestMapping(value="/activity/gamezone", method=RequestMethod.GET)
	public String gamezoneForm(){
		return "activity/gameZone";
	}
	
	
}