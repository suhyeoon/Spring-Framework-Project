package spring.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class RoomController {
	
	//스탠다드
	@RequestMapping(value="/room/standard/standard", method=RequestMethod.GET)
	public String standardForm() {
		return "room/standard/standard";
	}
	
	@RequestMapping(value="/room/standard/deluxe", method=RequestMethod.GET)
	public String deluxeForm() {
		return "room/standard/deluxe";
	}

	@RequestMapping(value="/room/standard/terrace", method=RequestMethod.GET)
	public String terraceForm() {
		return "room/standard/terrace";
	}	
	
	//프리미어
	@RequestMapping(value="/room/premier/premier", method=RequestMethod.GET)
	public String pre_room_Form(){
		return "room/premier/premier";
	}
	@RequestMapping(value="/room/premier/preTerrace", method=RequestMethod.GET)
	public String pre_terrace_Form(){
		return "room/premier/preTerrace";
	}

	//스위트
	@RequestMapping(value="/room/suite/norSuite", method=RequestMethod.GET)
	public String nor_sweet_Form(){
		return "room/suite/norSuite";
	}
	@RequestMapping(value="/room/suite/preSuite", method=RequestMethod.GET)
	public String pre_sweet_Form(){
		return "room/suite/preSuite";
	}
	@RequestMapping(value="/room/suite/royalSuite", method=RequestMethod.GET)
	public String loyal_sweet_Form(){
		return "room/suite/royalSuite";
	}
	@RequestMapping(value="/room/suite/presiSuite", method=RequestMethod.GET)
	public String presi_sweet_Form(){
		return "room/suite/presiSuite";
	}
	
	
	// 전체 객실 보기 컨트롤러
	@RequestMapping(value="/room/all_rooms", method=RequestMethod.GET)
	public String roomsForm() {
		return "room/allRooms";
	}

}
