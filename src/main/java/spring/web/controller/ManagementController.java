package spring.web.controller;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import spring.web.dao.ManagementDAO;
import spring.web.model.Article;
import spring.web.model.Management;
import spring.web.model.Management_Sub;
import spring.web.model.PackageContents;
import spring.web.model.Reservation;

@Controller
public class ManagementController {
	
	
	@Resource(name="managementDAO") 
    private ManagementDAO managementDAO;  
	
	public void initMenu(HttpServletRequest req){
		List<Management> codeBigList = (List<Management>)managementDAO.selectCodeBigAll(null, null);
		
		for(int i = 0 ; i < codeBigList.size() ; i++ ){
			List<Management_Sub> codeSmallList = (List<Management_Sub>)managementDAO.selectCodeSmallAll(null,codeBigList.get(i));
			codeBigList.get(i).setSub(codeSmallList);
		}
		req.setAttribute("codeBigList", codeBigList);
	}
	
	public void initRoomOption(HttpServletRequest req){
		
		Management management = new Management();
		
		management.setCodeBig("RG");
		List<Management_Sub> roomGrade = (List<Management_Sub>)managementDAO.selectRoomCodeSmallAll(null, management);
		
		management.setCodeBig("RL");
		List<Management_Sub> roomLevel = (List<Management_Sub>)managementDAO.selectRoomCodeSmallAll(null, management);
		
		management.setCodeBig("RT");
		List<Management_Sub> roomType = (List<Management_Sub>)managementDAO.selectRoomCodeSmallAll(null, management);
		
		management.setCodeBig("RV");
		List<Management_Sub> roomView = (List<Management_Sub>)managementDAO.selectRoomCodeSmallAll(null, management);
		
		management.setCodeBig("RS");
		List<Management_Sub> roomSize = (List<Management_Sub>)managementDAO.selectRoomCodeSmallAll(null, management);
		
		req.setAttribute("roomGrade", roomGrade);
		req.setAttribute("roomLevel", roomLevel);
		req.setAttribute("roomType", roomType);
		req.setAttribute("roomView", roomView);
		req.setAttribute("roomSize", roomSize);
		
	}
    
	@RequestMapping(value="/management", method=RequestMethod.GET)
	public String managementForm(HttpServletRequest req) {       
		
		initMenu(req);
		
		return "management/codeManagement";
	}

	@RequestMapping(value="/managementRead", method=RequestMethod.GET)
	public String managementReadForm(HttpServletRequest req) {       
		initMenu(req);
		Management management = new Management();
		management.setCodeBig(req.getParameter("big"));
		if(req.getParameter("small")==null){
			management = managementDAO.selectCodeBig(null, management);
			req.setAttribute("big", true);
		}
		else{
			management.setCodeSmall(req.getParameter("small"));
			management = managementDAO.selectCodeSmall(null, management);
			req.setAttribute("small", true);
		}
		req.setAttribute("contents", management);
		return "management/codeManagement";
	}
	
	@RequestMapping(value="/codeBigUpdate", method=RequestMethod.GET)
	public String codeBigUpdateForm(HttpServletRequest req) {       
		initMenu(req);
		Map<String, Object> paramMap =  new HashMap<>();
	    paramMap.put("codeBig", req.getParameter("codeBig"));
	    paramMap.put("nameBig", req.getParameter("nameBig"));
	    paramMap.put("oldCodeBig", req.getParameter("oldBig"));
	    int result = 0 ;
	    try{
	    	result = (Integer)managementDAO.updateCodeBig(null, paramMap);
	    }
	    catch(Exception e){
	    	
	    }
		if(result > 0){
			return "management/result";
		}
		else{
			req.setAttribute("codeBig", req.getParameter("oldBig"));
			req.setAttribute("fail", true);
			return "management/result";
		}
	}
	
	@RequestMapping(value="/codeBigDelete", method=RequestMethod.GET)
	public String codeBigDeleteForm(HttpServletRequest req,Management management) {       
		initMenu(req);
	    int result = 0 ;
	    try{
	    	result = (Integer)managementDAO.deleteCodeBig(null, management);
	    }
	    catch(Exception e){
	    	
	    }
		if(result > 0){
			return "management/result";
		}
		else{
			req.setAttribute("codeBig", req.getParameter("codeBig"));
			req.setAttribute("fail", true);
			return "management/result";
		}
	}
	
	@RequestMapping(value="/codeSmallInsert", method=RequestMethod.GET)
	public String codeSmallInsertForm(HttpServletRequest req, Management management) {       
		initMenu(req);
		
	    int result = 0 ;
	    try{
	    	result = (Integer)managementDAO.insertCodeSmall(null, management);
	    }
	    catch(Exception e){
	    	
	    }
		if(result > 0){
			return "management/result";
		}
		else{
			req.setAttribute("codeBig", req.getParameter("codeBig"));
			req.setAttribute("fail", "insert");
			return "management/result";
		}
	}
	
	@RequestMapping(value="/codeSmallUpdate", method=RequestMethod.GET)
	public String codeSmallUpdateForm(HttpServletRequest req) {       
		initMenu(req);
		Map<String, Object> paramMap =  new HashMap<>();
	    paramMap.put("codeBig", req.getParameter("codeBig"));
	    paramMap.put("codeSmall", req.getParameter("codeSmall"));
	    paramMap.put("nameSmall", req.getParameter("nameSmall"));
	    paramMap.put("oldCodeSmall", req.getParameter("oldSmall"));
	    int result = 0 ;
	    try{
	    	result = (Integer)managementDAO.updateCodeSmall(null, paramMap);
	    }
	    catch(Exception e){
	    	
	    }
		if(result > 0){
			return "management/result";
		}
		else{
			req.setAttribute("codeBig", req.getParameter("oldBig"));
			req.setAttribute("codeSmall", req.getParameter("oldSmall"));
			req.setAttribute("fail", true);
			return "management/result";
		}
	}
	
	@RequestMapping(value="/codeSmallDelete", method=RequestMethod.GET)
	public String codeSmallDeleteForm(HttpServletRequest req, Management management) {       
		initMenu(req);
		
	    int result = 0 ;
	    try{
	    	result = (Integer)managementDAO.deleteCodeSmall(null, management);
	    }
	    catch(Exception e){
	    	
	    }
		if(result > 0){
			return "management/result";
		}
		else{
			req.setAttribute("codeBig", req.getParameter("codeBig"));
			req.setAttribute("codeSmall", req.getParameter("codeSmall"));
			req.setAttribute("fail", true);
			return "management/result";
		}
	}
	
	@RequestMapping(value="/codeBigInsert", method=RequestMethod.GET)
	public String codeBigInsertForm(HttpServletRequest req, Management management) {       
		initMenu(req);
		
	    int result = 0 ;
	    try{
	    	result = (Integer)managementDAO.insertCodeBig(null, management);
	    }
	    catch(Exception e){
	    	
	    }
		if(result > 0){
			return "management/result";
		}
		else{
			req.setAttribute("codeBig", req.getParameter("big"));
			req.setAttribute("fail", "insert");
			return "management/result";
		}
	}
	
	@RequestMapping(value="/insertBig", method=RequestMethod.GET)
	public String insertBigForm(HttpServletRequest req) {       
		initMenu(req);
		
		req.setAttribute("big", true);
		req.setAttribute("insert", true);
		
		return "management/codeManagement";
	}
	
	@RequestMapping(value="/insertSmall", method=RequestMethod.GET)
	public String insertSmallForm(HttpServletRequest req) {       
		initMenu(req);
		
		req.setAttribute("small", true);
		req.setAttribute("insert", true);
		
		return "management/codeManagement";
	}
	
	@RequestMapping(value="/memberList", method=RequestMethod.GET)
	public String memberListForm(HttpServletRequest req) {       
		initMenu(req);
		
		List<Management> memberList = (List<Management>)managementDAO.selectMemberAll(null, null);
		for(int i = 0 ; i < memberList.size(); i++){
			if(memberList.get(i).isDropped())
				memberList.get(i).setStatus("탈퇴함");
			else
				memberList.get(i).setStatus("가입중");
		}
		List<Management_Sub> memberGrade = (List<Management_Sub>)managementDAO.selectMemberGradeAll(null, null);
		
		req.setAttribute("member", true);
		
		req.setAttribute("memberList", memberList);
		req.setAttribute("memberGrade", memberGrade);
		return "management/codeManagement";
	}
	
	@RequestMapping(value="/memberUpdate", method=RequestMethod.GET)
	public String memberUpdateForm(HttpServletRequest req, Management management) {       
		initMenu(req);
		
		int result = 0 ;
	    try{
	    	if(management.getStatus().equals("가입중"))
	    		management.setDropped(false);
	    	else
	    		management.setDropped(true);
	    	result = (Integer)managementDAO.updateMember(null, management);
	    }
	    catch(Exception e){
	    	e.printStackTrace();
	    }
	    req.setAttribute("member", true);
		if(result > 0){
			return "management/result";
		}
		else{
			req.setAttribute("fail", true);
			return "management/result";
		}
	}
	
	@RequestMapping(value="/memberDelete", method=RequestMethod.GET)
	public String memberDeleteForm(HttpServletRequest req, Management management) {       
		initMenu(req);
		
	    int result = 0 ;
	    try{
	    	result = (Integer)managementDAO.deleteMember(null, management);
	    }
	    catch(Exception e){
	    	e.printStackTrace();
	    }
	    req.setAttribute("member", true);
		if(result > 0){
			return "management/result";
		}
		else{
			req.setAttribute("fail", "delete");
			return "management/result";
		}
	}
	
	@RequestMapping(value="/roomList", method=RequestMethod.GET)
	public String roomListForm(HttpServletRequest req) {       
		initMenu(req);
		
		List<Management> roomList = (List<Management>)managementDAO.selectRoomAll(null, null);
		
		initRoomOption(req);
		
		req.setAttribute("room", true);
		
		req.setAttribute("roomList", roomList);
		
		return "management/codeManagement";
	}
	
	@RequestMapping(value="/roomUpdate", method=RequestMethod.GET)
	public String roomUpdateForm(HttpServletRequest req, Management management) {       
		initMenu(req);
		
		int result = 0 ;
	    try{
	    	result = (Integer)managementDAO.updateRoom(null, management);
	    }
	    catch(Exception e){
	    	e.printStackTrace();
	    }
	    req.setAttribute("room", true);
		if(result > 0){
			return "management/result";
		}
		else{
			req.setAttribute("fail", true);
			return "management/result";
		}
	}
	
	@RequestMapping(value="/roomDelete", method=RequestMethod.GET)
	public String roomDeleteForm(HttpServletRequest req, Management management) {       
		initMenu(req);
		
	    int result = 0 ;
	    try{
	    	result = (Integer)managementDAO.deleteRoom(null, management);
	    }
	    catch(Exception e){
	    	e.printStackTrace();
	    }
	    req.setAttribute("room", true);
		if(result > 0){
			return "management/result";
		}
		else{
			req.setAttribute("fail", true);
			return "management/result";
		}
	}
	
	@RequestMapping(value="/roomInsert", method=RequestMethod.GET)
	public String roomInsertForm(HttpServletRequest req) {       
		initMenu(req);
		
		List<Management> roomList = (List<Management>)managementDAO.selectRoomAll(null, null);
		
		initRoomOption(req);
		
		req.setAttribute("room", true);
		req.setAttribute("roomInsert", true);
		
		req.setAttribute("roomList", roomList);
		
		return "management/codeManagement";
	}
	
	@RequestMapping(value="/roomInsertData", method=RequestMethod.GET)
	public String roomInsertDataForm(HttpServletRequest req, Management management) {       
		initMenu(req);
		
		int result = 0 ;
	    try{
	    	result = (Integer)managementDAO.insertRoom(null, management);
	    }
	    catch(Exception e){
	    	e.printStackTrace();
	    }
	    req.setAttribute("room", true);
		if(result > 0){
			return "management/result";
		}
		else{
			req.setAttribute("fail", "insert");
			return "management/result";
		}
	}

	@RequestMapping(value="/packageList", method=RequestMethod.GET)
	public String packageListForm(HttpServletRequest req) {       
		initMenu(req);
		
		List<Management> packageList = (List<Management>)managementDAO.selectPackageAll(null, null);
		for(int i = 0 ; i < packageList.size() ; i++){
			packageList.get(i).setStartDate(packageList.get(i).getStartDate().substring(0,10));
			packageList.get(i).setEndDate(packageList.get(i).getEndDate().substring(0,10));
		}
		initRoomOption(req);
		
		req.setAttribute("packages", true);
		req.setAttribute("packageList", packageList);
		
		return "management/codeManagement";
	}
	
	@RequestMapping(value="/packageInsert", method=RequestMethod.GET)
	public String packageInsertForm(HttpServletRequest req) {       
		initMenu(req);
		
		List<Management> packageList = (List<Management>)managementDAO.selectPackageAll(null, null);
		for(int i = 0 ; i < packageList.size() ; i++){
			packageList.get(i).setStartDate(packageList.get(i).getStartDate().substring(0,10));
			packageList.get(i).setEndDate(packageList.get(i).getEndDate().substring(0,10));
		}
		
		initRoomOption(req);
		
		req.setAttribute("packages", true);
		req.setAttribute("packageInsert", true);
		req.setAttribute("packageList", packageList);
		
		return "management/codeManagement";
	}
	
	@RequestMapping(value="/packageUpdate", method=RequestMethod.GET)
	public String packageUpdateForm(HttpServletRequest req, Management management) {       
		initMenu(req);
		
		int result = 0 ;
	    try{
	    	result = (Integer)managementDAO.updatePackage(null, management);
	    }
	    catch(Exception e){
	    	e.printStackTrace();
	    }
	    req.setAttribute("packages", true);
		if(result > 0){
			return "management/result";
		}
		else{
			req.setAttribute("fail", true);
			return "management/result";
		}
	}
	
	@RequestMapping(value="/packageDelete", method=RequestMethod.GET)
	public String packageDeleteForm(HttpServletRequest req, Management management) {       
		initMenu(req);
		
	    int result = 0 ;
	    try{
	    	result = (Integer)managementDAO.deletePackage(null, management);
	    }
	    catch(Exception e){
	    	e.printStackTrace();
	    }
	    req.setAttribute("packages", true);
		if(result > 0){
			return "management/result";
		}
		else{
			req.setAttribute("fail", true);
			return "management/result";
		}
	}
	
	@RequestMapping(value="/packageInsertData", method=RequestMethod.GET)
	public String packageInsertDataForm(HttpServletRequest req, Management management) {       
		initMenu(req);
		
		int result = 0 ;
	    try{
	    	result = (Integer)managementDAO.insertPackage(null, management);
	    }
	    catch(Exception e){
	    	e.printStackTrace();
	    }
	    req.setAttribute("packages", true);
		if(result > 0){
			return "management/result";
		}
		else{
			req.setAttribute("fail", "insert");
			return "management/result";
			//return "redirect:/packageInsertData";
		}
	}
	
	
	@RequestMapping(value="/reservationList", method=RequestMethod.GET)
	public String reservationListForm(HttpServletRequest req) {       
		initMenu(req);
		
		List<Reservation> reservationList = (List<Reservation>)managementDAO.selectReservationAll(null, null);
		for(int i = 0 ; i < reservationList.size() ; i ++){
			reservationList.get(i).setStartDate(reservationList.get(i).getStartDate().substring(0,10));
			reservationList.get(i).setEndDate(reservationList.get(i).getEndDate().substring(0,10));
			reservationList.get(i).setReservationDate(reservationList.get(i).getReservationDate().substring(0,10));
			if(reservationList.get(i).isAddBed())
				reservationList.get(i).setStrBed("O");
			else
				reservationList.get(i).setStrBed("X");
			if(reservationList.get(i).isCanceled())
				reservationList.get(i).setStatus("취소");
			else
				reservationList.get(i).setStatus("예약중");
		}
		/*Management management = new Management();
		management.setCodeBig("CT");
		List<Management_Sub> cardType = (List<Management_Sub>)managementDAO.selectRoomCodeSmallAll(null, management);
		req.setAttribute("cardType", cardType);*/
		req.setAttribute("reservation", true);
		req.setAttribute("reservationList", reservationList);
		
		
		return "management/codeManagement";
	}
	
	@RequestMapping(value="/stayList", method=RequestMethod.GET)
	public String stayListForm(HttpServletRequest req) {       
		initMenu(req);
		
		List<Reservation> stayList = (List<Reservation>)managementDAO.selectStayAll(null, null);
		for(int i = 0 ; i < stayList.size() ; i ++){
			stayList.get(i).setStartDate(stayList.get(i).getStartDate().substring(0,10));
			stayList.get(i).setEndDate(stayList.get(i).getEndDate().substring(0,10));
			stayList.get(i).setReservationDate(stayList.get(i).getReservationDate().substring(0,10));
			if(stayList.get(i).isAddBed())
				stayList.get(i).setStrBed("O");
			else
				stayList.get(i).setStrBed("X");
			if(stayList.get(i).isCanceled())
				stayList.get(i).setStatus("취소");
			else
				stayList.get(i).setStatus("숙박중");
		}
		
		req.setAttribute("stay", true);
		req.setAttribute("stayList", stayList);
		
		return "management/codeManagement";
	}
	
	@RequestMapping(value="/reservationDelete", method=RequestMethod.GET)
	public String reservationDeleteForm(HttpServletRequest req, Reservation reservation) {       
		initMenu(req);
		reservation = managementDAO.selectReservation(null, reservation);
	    int result = 0 ;
	    try{
	    	reservation.setBeforeTable("reservation");
	    	if((Integer)managementDAO.insertStayDeleted(null, reservation)>0){
	    		result = (Integer)managementDAO.deleteReservation(null, reservation);
	    	}
	    }
	    catch(Exception e){
	    	e.printStackTrace();
	    }
	    req.setAttribute("res", true);
		if(result > 0){
			return "management/result";
		}
		else{
			req.setAttribute("fail", true);
			return "management/result";
		}
	}
	
	@RequestMapping(value="/checkIn", method=RequestMethod.GET)
	public String checkInForm(HttpServletRequest req, Reservation reservation) {       
		initMenu(req);
		reservation = managementDAO.selectReservation(null, reservation);
		int result = 0 ;
	    try{
	    	if((Integer)managementDAO.insertStay(null, reservation)>0){
	    		result = (Integer)managementDAO.deleteReservation(null, reservation);
	    	}
	    }
	    catch(Exception e){
	    	e.printStackTrace();
	    }
	    req.setAttribute("res", true);
		if(result > 0){
			return "management/result";
		}
		else{
			req.setAttribute("fail", "insert");
			return "management/result";
		}
	}
	
	@RequestMapping(value="/checkOut", method=RequestMethod.GET)
	public String checkOutForm(HttpServletRequest req, Reservation reservation) {       
		initMenu(req);
		reservation = managementDAO.selectStay(null, reservation);
		int result = 0 ;
	    try{
	    	if((Integer)managementDAO.insertStayHistory(null, reservation)>0){
	    		result = (Integer)managementDAO.deleteStay(null, reservation);
	    	}
	    }
	    catch(Exception e){
	    	e.printStackTrace();
	    }
	    req.setAttribute("stay", true);
		if(result > 0){
			return "management/result";
		}
		else{
			req.setAttribute("fail", "insert");
			return "management/result";
		}
	}
	
	@RequestMapping(value="/stayDelete", method=RequestMethod.GET)
	public String stayDeleteForm(HttpServletRequest req, Reservation reservation) {       
		initMenu(req);
		reservation = managementDAO.selectStay(null, reservation);
	    int result = 0 ;
	    try{
	    	reservation.setBeforeTable("stay");
	    	if((Integer)managementDAO.insertStayDeleted(null, reservation)>0){
	    		result = (Integer)managementDAO.deleteStay(null, reservation);
	    	}
	    }
	    catch(Exception e){
	    	e.printStackTrace();
	    }
	    req.setAttribute("stay", true);
		if(result > 0){
			return "management/result";
		}
		else{
			req.setAttribute("fail", true);
			return "management/result";
		}
	}
	
	@RequestMapping(value="/stayHistoryList", method=RequestMethod.GET)
	public String stayHistoryListForm(HttpServletRequest req) {       
		initMenu(req);
		
		List<Reservation> stayHistoryList = (List<Reservation>)managementDAO.selectStayHistoryAll(null, null);
		for(int i = 0 ; i < stayHistoryList.size() ; i ++){
			stayHistoryList.get(i).setStartDate(stayHistoryList.get(i).getStartDate().substring(0,10));
			stayHistoryList.get(i).setEndDate(stayHistoryList.get(i).getEndDate().substring(0,10));
			stayHistoryList.get(i).setReservationDate(stayHistoryList.get(i).getReservationDate().substring(0,10));
			if(stayHistoryList.get(i).isAddBed())
				stayHistoryList.get(i).setStrBed("O");
			else
				stayHistoryList.get(i).setStrBed("X");
		}
		
		req.setAttribute("stayHistory", true);
		req.setAttribute("stayHistoryList", stayHistoryList);
		
		return "management/codeManagement";
	}
	
	@RequestMapping(value="/checkOutCancel", method=RequestMethod.GET)
	public String checkOutCancelForm(HttpServletRequest req, Reservation reservation) {       
		initMenu(req);
		reservation = managementDAO.selectStayHistory(null, reservation);
		int result = 0 ;
	    try{
	    	if((Integer)managementDAO.insertStay(null, reservation)>0){
	    		result = (Integer)managementDAO.deleteStayHistory(null, reservation);
	    	}
	    }
	    catch(Exception e){
	    	e.printStackTrace();
	    }
	    req.setAttribute("stayHistory", true);
		if(result > 0){
			return "management/result";
		}
		else{
			req.setAttribute("fail", "insert");
			return "management/result";
		}
	}
	
	@RequestMapping(value="/stayHistoryDelete", method=RequestMethod.GET)
	public String stayHistoryDeleteForm(HttpServletRequest req, Reservation reservation) {       
		initMenu(req);
		reservation = managementDAO.selectStayHistory(null, reservation);
	    int result = 0 ;
	    try{
	    	reservation.setBeforeTable("stayHistory");
	    	if((Integer)managementDAO.insertStayDeleted(null, reservation)>0){
	    		result = (Integer)managementDAO.deleteStayHistory(null, reservation);
	    	}
	    }
	    catch(Exception e){
	    	e.printStackTrace();
	    }
	    req.setAttribute("stayHistory", true);
		if(result > 0){
			return "management/result";
		}
		else{
			req.setAttribute("fail", true);
			return "management/result";
		}
	}
	
	@RequestMapping(value="/stayDeletedList", method=RequestMethod.GET)
	public String stayDeletedListForm(HttpServletRequest req) {       
		initMenu(req);
		
		List<Reservation> stayDeletedList = (List<Reservation>)managementDAO.selectStayDeletedAll(null, null);
		for(int i = 0 ; i < stayDeletedList.size() ; i ++){
			stayDeletedList.get(i).setStartDate(stayDeletedList.get(i).getStartDate().substring(0,10));
			stayDeletedList.get(i).setEndDate(stayDeletedList.get(i).getEndDate().substring(0,10));
			stayDeletedList.get(i).setReservationDate(stayDeletedList.get(i).getReservationDate().substring(0,10));
			if(stayDeletedList.get(i).isAddBed())
				stayDeletedList.get(i).setStrBed("O");
			else
				stayDeletedList.get(i).setStrBed("X");
			if(stayDeletedList.get(i).isCanceled())
				stayDeletedList.get(i).setStatus("취소");
			else
				stayDeletedList.get(i).setStatus("숙박중");
		}
		
		req.setAttribute("stayDeleted", true);
		req.setAttribute("stayDeletedList", stayDeletedList);
		
		return "management/codeManagement";
	}
	
	@RequestMapping(value="/restore", method=RequestMethod.GET)
	public String restoreForm(HttpServletRequest req, Reservation reservation) {       
		initMenu(req);
		reservation = managementDAO.selectStayDeleted(null, reservation);
		int result = 0 ;
	    try{
	    	String beforeTable = reservation.getBeforeTable();
	    	if(beforeTable.equals("reservation"))
	    		result = (Integer)managementDAO.insertReservation(null, reservation);
	    	else if(beforeTable.equals("stay"))
	    		result = (Integer)managementDAO.insertStay(null, reservation);
	    	else if(beforeTable.equals("stayHistory"))
	    		result = (Integer)managementDAO.insertStayHistory(null, reservation);
	    	
	    	if(result > 0)
	    		managementDAO.deleteStayDeleted(null, reservation);
	    }
	    catch(Exception e){
	    	e.printStackTrace();
	    }
	    req.setAttribute("stayDeleted", true);
		if(result > 0){
			return "management/result";
		}
		else{
			req.setAttribute("fail", "insert");
			return "management/result";
		}
	}
	
	@RequestMapping(value="/stayDeletedDelete", method=RequestMethod.GET)
	public String stayDeletedDeleteForm(HttpServletRequest req, Reservation reservation) {       
		initMenu(req);
		reservation = managementDAO.selectStayDeleted(null, reservation);
	    int result = 0 ;
	    try{
	    	result = (Integer)managementDAO.deleteStayDeleted(null, reservation);
	    }
	    catch(Exception e){
	    	e.printStackTrace();
	    }
	    req.setAttribute("stayDeleted", true);
		if(result > 0){
			return "management/result";
		}
		else{
			req.setAttribute("fail", true);
			return "management/result";
		}
	}
	
	@RequestMapping(value="/imageUpdate", method=RequestMethod.POST)
	public String mainImageUpdateProc(HttpServletResponse res, HttpServletRequest req, 
			@ModelAttribute("writeForm") Article article){
		
		boolean imgChk = article.getImages() != null && article.getImages().size() > 0;
		if(imgChk){
			String upDir = req.getParameter("upDir");
			List<MultipartFile> images = article.getImages();
			int cnt = 1;
			
			for (MultipartFile multipartFile : images) {
				
				String fileName = multipartFile.getOriginalFilename();
				System.out.println(fileName);
				if(fileName.equals("1.jpg") || fileName.equals("2.jpg") || fileName.equals("3.jpg"))
					fileName = "a.jpg";
				String path = upDir + fileName;
				if(fileName != null && fileName != ""){
					File file = new File(path);
					
					if(!file.exists())
						file.mkdirs();
					try {
						// 삭제전 임시파일
						File dFile = new File(upDir+"delete.jpg");
						// 저장된 후 바뀔 이름
						File nFile = new File(upDir+cnt+".jpg");
						multipartFile.transferTo(file);
						
						if(file.exists()){
							nFile.renameTo(dFile); // 기존 파일을 삭제전 임시파일 이름으로 저장
							file.renameTo(nFile); // 방금 저장된 파일을 기존 파일 이름으로 저장
							dFile.delete(); // 임시 저장된 파일 삭제
						}
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
				cnt++;

			}
		}
		return "redirect:main";
		//return "main";
	}
	
	@RequestMapping(value="/main", method=RequestMethod.GET)
	public String mainForm(HttpServletRequest req){
		
		List<PackageContents> names = (List<PackageContents>)managementDAO.selectPackageNameAll(null, null);
		List<PackageContents> packages = (List<PackageContents>)managementDAO.selectPackageContentsAll(null, null);
		for(int i = 0 ; i < packages.size() ; i++){
			packages.get(i).setArrCont(packages.get(i).getContents().split(";"));
			packages.get(i).setStartDate(packages.get(i).getStartDate().substring(0,10));
			packages.get(i).setEndDate(packages.get(i).getEndDate().substring(0,10));
		}
		req.setAttribute("packages", packages);
		req.setAttribute("names", names);
		return "main";
	}
			
	@RequestMapping(value="/packageUpdate", method=RequestMethod.POST)
	public String packageUpdateProc(HttpServletRequest req, 
			@ModelAttribute("writeForm") PackageContents packageContents){
		
		boolean imgChk = packageContents.getImage() != null && packageContents.getImage().getSize() > 0;
		if(imgChk){
			String path = "C:/Users/Administrator/Documents/work/sources/Spring/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/Resort/images/contents/main_img/";
			MultipartFile image = packageContents.getImage();
			
			File file = new File(path+packageContents.getNo()+".jpg");
			File dFile = new File(path+"delete.jpg");
			
			if(file.exists()){
				file.renameTo(dFile);
			}
			try {
				image.transferTo(file);
				dFile.delete();
			} 
			catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		String strCont = "";
		for(int i = 0; i < packageContents.getArrCont().length; i++){
			if(i==0)
				strCont += packageContents.getArrCont()[i];
			else
				strCont += ";"+packageContents.getArrCont()[i];
		}
		packageContents.setContents(strCont);
		managementDAO.updatePackageContents(null, packageContents);
		
		return "redirect:main";
	}
	
	@RequestMapping(value="/packageInsert", method=RequestMethod.POST)
	public String packageInsertProc(HttpServletRequest req, 
			@ModelAttribute("writeForm") PackageContents packageContents){
		boolean imgChk = packageContents.getImage() != null && packageContents.getImage().getSize() > 0;
		if(imgChk){
			String path = "C:/Users/Administrator/Documents/work/sources/Spring/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/Resort/images/contents/main_img/";
			MultipartFile image = packageContents.getImage();
			
			File file = new File(path+(packageContents.getNo()+1)+".jpg");
			
			try {
				if(file.exists()){
					file.delete();
				}
				image.transferTo(file);
				
				String strCont = "";
				for(int i = 0; i < packageContents.getArrCont().length; i++){
					if(i==0)
						strCont += packageContents.getArrCont()[i];
					else
						strCont += ";"+packageContents.getArrCont()[i];
				}
				packageContents.setContents(strCont);
				managementDAO.insertPackageContents(null, packageContents);
			} 
			catch (Exception e) {
				e.printStackTrace();
			}
		}

		return "redirect:main";
	}
	
	@RequestMapping(value="/packageContentsDelete", method=RequestMethod.GET)
	public String packageContentsDeleteForm(PackageContents packageContents){
		
		managementDAO.deletePackageContents(null, packageContents);
		return "redirect:main";
	}
}









