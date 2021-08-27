package spring.web.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import spring.web.dao.ManagementDAO;
import spring.web.dao.MemberDAO;
import spring.web.dao.ReservationDAO;
import spring.web.model.Management;
import spring.web.model.Management_Sub;
import spring.web.model.Member;
import spring.web.model.Reservation;

@Controller
public class ReservationController {
	
	@Resource(name="reservationDAO") 
    private ReservationDAO reservationDAO;   
	
	@Resource(name="memberDAO") 
    private MemberDAO memberDAO;  
	
	@Resource(name="managementDAO")
	private ManagementDAO managementDAO;
    
	@RequestMapping(value="/reservationStep01", method=RequestMethod.GET)
	public String reservationStep01Form(HttpServletRequest req) {       

		if(req.getSession(false).getAttribute("authUser") == null ||
				(String)req.getSession(false).getAttribute("authUser") == ""){
			return "noLogin";
		}
			
		return "reservation/reservationStep01";
	}
	
	@RequestMapping(value="/search", method=RequestMethod.POST)
	public String searchProc(HttpServletRequest req,Reservation reservation){        		
		
		List<Reservation> roomList = (List<Reservation>)reservationDAO.selectRoomAll(null, reservation);
		List<Reservation> packageList = (List<Reservation>)reservationDAO.selectPackageAll(null, reservation);
		
		for(int i = 0 ; i < roomList.size() ; i++){
			String sPrice = String.valueOf(roomList.get(i).getPrice());
			String rPrice = "";
			for(int j = 0; j < sPrice.length(); j++){
				if(j%3==0 && j != 0)
					rPrice = sPrice.charAt(sPrice.length()-j-1) + "," + rPrice;
				else
					rPrice = sPrice.charAt(sPrice.length()-j-1) + rPrice;
			}
			roomList.get(i).setsPrice(rPrice);
		}
		
		for(int i = 0 ; i < packageList.size() ; i++){
			String sPrice = String.valueOf(packageList.get(i).getPrice());
			String rPrice = "";
			for(int j = 0; j < sPrice.length(); j++){
				if(j%3==0 && j != 0)
					rPrice = sPrice.charAt(sPrice.length()-j-1) + "," + rPrice;
				else
					rPrice = sPrice.charAt(sPrice.length()-j-1) + rPrice;
			}
			packageList.get(i).setsPrice(rPrice);
		}
		
		
		req.setAttribute("room", roomList);
		req.setAttribute("package2", packageList);
		
		req.setAttribute("data", reservation);
		return "reservation/reservationStep01";
	}
   
	@RequestMapping(value="/reservationStep02", method=RequestMethod.GET)
	public String reservationStep02Form(HttpServletRequest req) {    
		Reservation reservation = new Reservation();
		reservation.setStartDate(req.getParameter("startDate"));
		reservation.setEndDate(req.getParameter("endDate"));
		reservation.setRoomGrade(req.getParameter("rg"));
		reservation.setRoomLevel(req.getParameter("rl"));
		List<Reservation> data = null;
		if(req.getParameter("gubun").equals("room")){
			data = (List<Reservation>)reservationDAO.selectRoomType(null, reservation);
		}
		else if(req.getParameter("gubun").equals("package")){
			reservation.setName(req.getParameter("name"));
			data = (List<Reservation>)reservationDAO.selectPackageType(null, reservation);
		}
		for(int i = 0 ; i < data.size() ; i++){
			String sPrice = String.valueOf(data.get(i).getPrice());
			String rPrice = "";
			for(int j = 0; j < sPrice.length(); j++){
				if(j%3==0 && j != 0)
					rPrice = sPrice.charAt(sPrice.length()-j-1) + "," + rPrice;
				else
					rPrice = sPrice.charAt(sPrice.length()-j-1) + rPrice;
			}
			data.get(i).setsPrice(rPrice);
		}
		req.setAttribute("data", data);
		return "reservation/reservationStep02";
	}
	
	@RequestMapping(value="/reservationStep03", method=RequestMethod.POST)
	public String reservationStep03Proc(HttpServletRequest req,Reservation reservation){        		
		
		Management management = new Management();
		management.setCodeBig("CT");
		List<Management_Sub> cardType = (List<Management_Sub>)managementDAO.selectRoomCodeSmallAll(null, management);
		req.setAttribute("cardType", cardType);
		
		req.setAttribute("data", reservation);
		req.setAttribute("bPrice", req.getParameter("bPrice"));
		req.setAttribute("rPrice", req.getParameter("rPrice"));
		req.setAttribute("chPrice", req.getParameter("chPrice"));
		req.setAttribute("adPrice", req.getParameter("adPrice"));
		req.setAttribute("tiPrice", req.getParameter("tiPrice"));
		req.setAttribute("taPrice", req.getParameter("taPrice"));
		return "reservation/reservationStep03";
	}
	
	@RequestMapping(value="/reservationStep04", method=RequestMethod.POST)
	public String reservationStep04Proc(HttpServletRequest req,Reservation reservation){  
		
		Reservation room = reservationDAO.selectRoom(null, reservation);
		reservation.setRoomNo(room.getRoomNo());
		reservation.setId((String)req.getSession(false).getAttribute("authUser"));
		reservation.setMemo(reservation.getMemo().replace("\n", "<br>"));
		reservation.setCardNum(req.getParameter("cardNum1")+"-"+req.getParameter("cardNum2")+"-"
								+req.getParameter("cardNum3")+"-"+req.getParameter("cardNum4"));
		reservation.setCardEndDate(req.getParameter("cardYear")+"-"+req.getParameter("cardMonth"));
		int result = (Integer)reservationDAO.insertReservation(null, reservation);
		
		
		req.setAttribute("data", reservation);
		req.setAttribute("bPrice", req.getParameter("bPrice"));
		req.setAttribute("rPrice", req.getParameter("rPrice"));
		req.setAttribute("chPrice", req.getParameter("chPrice"));
		req.setAttribute("adPrice", req.getParameter("adPrice"));
		req.setAttribute("tiPrice", req.getParameter("tiPrice"));
		req.setAttribute("taPrice", req.getParameter("taPrice"));
		if(result>0){
			return "reservation/reservationStep04";
		}
		else{
			return "reservation/reservationFalse";
		}
		
	}
	
	@RequestMapping(value="/info_reservation", method=RequestMethod.GET)
	public String info_reservationForm(HttpServletRequest req) {    
		Reservation reservation = new Reservation();
		reservation.setId((String)req.getSession(false).getAttribute("authUser"));
		List<Reservation> data = (List<Reservation>)reservationDAO.selectReservation(null, reservation);
		for(int i = 0 ; i < data.size() ; i++){
			data.get(i).setStartDate(data.get(i).getStartDate().substring(0,10));
			data.get(i).setEndDate(data.get(i).getEndDate().substring(0,10));
			
			String sPrice = String.valueOf(data.get(i).getPrice());
			String rPrice = "";
			for(int j = 0; j < sPrice.length(); j++){
				if(j%3==0 && j != 0)
					rPrice = sPrice.charAt(sPrice.length()-j-1) + "," + rPrice;
				else
					rPrice = sPrice.charAt(sPrice.length()-j-1) + rPrice;
			}
			data.get(i).setsPrice(rPrice);
		}
		
		req.setAttribute("data", data);
		return "mypage/information_reservation";
	}
	
	@RequestMapping(value="/detail_reservation", method=RequestMethod.GET)
	public String detail_reservationForm(HttpServletRequest req) {    
		Reservation reservation = new Reservation();
		reservation.setNo(Integer.parseInt(req.getParameter("no")));
		reservation = reservationDAO.selectReservationDetail(null, reservation);
		reservation.setStartDate(reservation.getStartDate().substring(0,10));
		reservation.setEndDate(reservation.getEndDate().substring(0,10));
		reservation.setReservationDate(reservation.getReservationDate().substring(0,10));
		String price;
		if(reservation.getPackageNo()!=null){
			price = (String)reservationDAO.packagePrice(null, reservation);
		}
		else{
			price = (String)reservationDAO.roomPrice(null, reservation);
		}
		int date = reservation.getDateCnt();
		int adult = reservation.getAdultBreakfast();
		int child = reservation.getChildBreakfast();
		int tax = Integer.parseInt(price) * date + adult * 32000 * date + child * 23000 * date;
		if(reservation.isAddBed()){
			tax += 40000 * date;
		}
		tax = tax * 21 / 100;
		
		String[] arrCardNum = reservation.getCardNum().split("-");
		String[] arrCardEndDate = reservation.getCardEndDate().split("-");
		
		String cardNum = "************"+arrCardNum[3];
		
		String id = (String)req.getSession(false).getAttribute("authUser");
		
		Member member = memberDAO.selectById(null, id);
		req.setAttribute("tax", tax);
		req.setAttribute("cardNum", cardNum);
		req.setAttribute("cardYear", arrCardEndDate[0]);
		req.setAttribute("cardMonth", arrCardEndDate[1]);
		req.setAttribute("price", price);
		req.setAttribute("data", reservation);
		req.setAttribute("member", member);
		return "mypage/detail_reservation";
	}
	
	@RequestMapping(value="/reservationCancel", method=RequestMethod.GET)
	public String qnaCommentDeleteForm(HttpServletRequest req){        		
		int no = Integer.parseInt(req.getParameter("no"));
        req.setAttribute("reservationNo", no);
        return "mypage/reservationCancel";
	}
	
	@RequestMapping(value="/reservationCancel", method=RequestMethod.POST)
	public String reservationCancelProc(HttpServletRequest req, HttpServletResponse res){        
		
        Reservation reservation = new Reservation();
        reservation.setNo(Integer.parseInt(req.getParameter("no")));
        int result = (Integer)reservationDAO.reservationCancel(null,reservation);
        if(result>0)
        {
        	res.setContentType("text/html;charset=euc-kr");
        	PrintWriter out;
			try {
				out = res.getWriter();
				out.println(result);
	        	out.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
        }

        return null;    
	}
}









