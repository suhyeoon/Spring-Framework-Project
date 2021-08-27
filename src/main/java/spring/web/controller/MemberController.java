package spring.web.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import spring.web.dao.MemberDAO;
import spring.web.model.Member;

@Controller
public class MemberController {
	
	@Resource(name="memberDAO") 
    private MemberDAO memberDAO;   
    
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public String loginForm() {        		
		return "login/login_form";
	}
	
    @RequestMapping(value="/login", method=RequestMethod.POST)
    public String loginProc(Member member, HttpServletRequest req) {        
        
		Map<String, Boolean> errors = new HashMap<>();
		Map<String, Boolean> success = new HashMap<>();
		req.setAttribute("errors", errors);
		req.setAttribute("success", success);

		if(member.getId() == null || member.getId().isEmpty()){
			errors.put("idOrPwNotMatch", Boolean.TRUE);
		}
		if(member.getPw() == null  || member.getPw().isEmpty())
			errors.put("idOrPwNotMatch", Boolean.TRUE);
		
		if(!errors.isEmpty()){
			return "login/login_form";
		}
		
		try {
			String result = (String)memberDAO.login(null,member);
			member = memberDAO.selectByIdGrade(null, member);
			if(result!=null){
				req.getSession().setAttribute("authUser", member.getId());
				req.getSession().setAttribute("authPass", member.getPw());
				req.getSession().setAttribute("authGrade", member.getGrade());
				success.put("loginSuccess", Boolean.TRUE);
			}
			else
			{
				errors.put("idOrPwNotMatch", Boolean.TRUE);
			}
			//res.sendRedirect(req.getContextPath() + "/main.jsp");
			return "login/login_form";
		} catch (RuntimeException e){
			e.printStackTrace();
			errors.put("idOrPwNotMatch", Boolean.TRUE);
			return "login/login_form";
		}
    }
    
    @RequestMapping(value="/logout", method=RequestMethod.GET)
	public String logoutForm(HttpServletRequest req) {
    	HttpSession session = req.getSession(false);
		if (session != null){
			session.invalidate();
		}
		return "login/logout";
	}
    
    @RequestMapping(value="/myPageInfo", method=RequestMethod.GET)
	public String myPageInfoForm(HttpServletRequest req) {
    	String id = (String) req.getSession(false).getAttribute("authUser");

		try{
			Member member = new Member();
			member.setId(id);
			member = (Member)memberDAO.selectById(null,member);
			
			req.setAttribute("memberData", member);
			return "mypage/information_form";
			
		} catch (Exception e){
			e.printStackTrace();
			System.out.println("정보확인 오류");
			return null;
		}
	}
    
    @RequestMapping(value="/myPageInfo", method=RequestMethod.POST)
	public String myPageInfoProc(HttpServletRequest req,Member member) {
    	
    	String id = (String) req.getSession(false).getAttribute("authUser");

		try{
			member.setId(id);
			member = (Member)memberDAO.selectById(null,member);
			String[] tel = member.getTel().split("-");
			String[] email = member.getEmail().split("@");
			req.setAttribute("tel1", tel[0]);
			req.setAttribute("tel2", tel[1]);
			req.setAttribute("tel3", tel[2]);
			req.setAttribute("email1", email[0]);
			req.setAttribute("email2", email[1]);
			req.setAttribute("memberData", member);
			return "mypage/information_change_form";
			
		} catch (Exception e){
			e.printStackTrace();
			System.out.println("정보확인 오류");
			return null;
		}
	}
    
	@RequestMapping(value="/information_change", method=RequestMethod.POST)
	public String informationChangeProc(HttpServletRequest req,Member member) {
		member.setAddr(req.getParameter("addr1") + req.getParameter("addr2"));
		member.setTel(req.getParameter("tel1") +"-" + req.getParameter("tel2")+ "-" + req.getParameter("tel3"));
		member.setEmail(req.getParameter("email1") + "@" + req.getParameter("email2"));
		HashMap<String, Boolean> success = new HashMap<>();
		req.setAttribute("success", success);
		
		try{
			int result = (Integer)memberDAO.update(null, member);
			if(result > 0){
				success.put("modifySuccess", Boolean.TRUE);
				return "mypage/information_change_form";
			}
			else{
				return null;
			}
				
		} catch (Exception e){
			System.out.println("정보수정 실패");
			return null;
		}
	} 

	@RequestMapping(value="/changePwd", method=RequestMethod.GET)
	public String changePwdForm() {        		
		return "mypage/change_pwd_form";
	}
	
	@RequestMapping(value="/changePwd", method=RequestMethod.POST)
	public String changePwdProc(HttpServletRequest req) {        		
		
		String check = "";
		if (req.getParameter("check") != null){
			check = req.getParameter("check");
		}
		
		Map<String, Boolean> success = new HashMap<>();
		req.setAttribute("success", success);
		Map<String, Object> paramMap =  new HashMap<>();
		String id = (String)req.getSession().getAttribute("authUser");
		
		if(id == null){
			id = req.getParameter("pwdId");
		}
		
	    paramMap.put("id", id);
	    paramMap.put("curPwd", req.getParameter("curPwd"));
	    paramMap.put("newPwd", req.getParameter("newPwd"));
		
		if(paramMap.get("curPwd") == null || ((String)paramMap.get("curPwd")).isEmpty()) {
			success.put("curPwd", Boolean.TRUE);
		}
		if(paramMap.get("newPwd") == null || ((String)paramMap.get("newPwd")).isEmpty()) {
			success.put("newPwd", Boolean.TRUE);
		}
		if(!success.isEmpty()) {
			return (check == "1") ? "login/pwd_search_form" : "mypage/change_pwd_form";
		}

		try {
			int result = (Integer)memberDAO.passwordUpdate(null, paramMap);
			if(result>0){
				success.put("changePwSuccess", Boolean.TRUE);
				req.getSession().setAttribute("authPass", (String)paramMap.get("newPwd"));
				return (check == "1") ? "login/pwd_search_form" : "mypage/change_pwd_form";
			}
			else
			{
				success.put("changePwFault", Boolean.TRUE);
				return (check == "1") ? "login/pwd_search_form" : "mypage/change_pwd_form";
			}			
			
		} catch(Exception e) {
			e.printStackTrace();
			success.put("changePwFault", Boolean.TRUE);
			return (check == "1") ? "login/pwd_search_form" : "mypage/change_pwd_form";
		}
	}
	
	@RequestMapping(value="/agree", method=RequestMethod.GET)
	public String agreeForm() {        		
		return "join/agree";
	}
	
	@RequestMapping(value="/agree", method=RequestMethod.POST)
	public String agreeProc() {        		
		return "join/member_form";
	}
	
	@RequestMapping(value="/join", method=RequestMethod.POST)
	public String joinProc(HttpServletRequest req, Member member) {
		member.setAddr(req.getParameter("addr1") + req.getParameter("addr2"));
		member.setTel(req.getParameter("tel1") + "-" + req.getParameter("tel2")
						+ "-" + req.getParameter("tel3"));
		member.setEmail(req.getParameter("email1") + "@" + req.getParameter("email2"));
		
		try {
			int result = (Integer)memberDAO.insert(null, member);
			if(result > 0)
				return "join/member_proc";
			else{
				return "join/member_form";
			}
		} catch (RuntimeException e) {
			e.printStackTrace();
			return "join/member_form";
		}
	} 
	
	@RequestMapping(value="/IdCheck", method=RequestMethod.POST)
	public String IdCheckProc(Member member,HttpServletResponse res) {
		String result = (String)memberDAO.duplicateIdCheck(null, member);

		res.setContentType("text/html;charset=utf-8");
		PrintWriter out;
		try {
			out = res.getWriter();
			if (result!=null)	out.println("0");
			else	out.println("1");

			out.close();
			
			return null;
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	@RequestMapping(value="/joinSuccess", method=RequestMethod.GET)
	public String joinSuccessForm() {        		
		return "login/login_form";
	}
	
	@RequestMapping(value="/idSearch", method=RequestMethod.GET)
	public String idSearchForm() {        		
		return "login/id_search_form";
	}
	
	@RequestMapping(value="/idSearch", method=RequestMethod.POST)
	public String idSearchProc(Member member, HttpServletRequest req) {
		
		HashMap<String, Boolean> success = new HashMap<>();
		HashMap<String, Boolean> error = new HashMap<>();
		req.setAttribute("success", success);
		req.setAttribute("errorr", error);
		List<String> userId;
		try{
			userId = (List<String>)memberDAO.idSearch(null,member);
			
			if(userId.size() > 0){
				success.put("success", Boolean.TRUE);
			} else{
				error.put("errorr", Boolean.TRUE);
			}
			
			req.setAttribute("idValue", userId);

			return "login/id_search_form";
		} catch (Exception e){
			e.printStackTrace();
			System.out.println("아이디 찾기 오류");
			return "login/id_search_form";
		}
	}
	
	@RequestMapping(value="/pwdSearch", method=RequestMethod.GET)
	public String pwdSearchForm() {        		
		return "login/pwd_search_form";
	}
	
	@RequestMapping(value="/pwdSearch", method=RequestMethod.POST)
	public String pwdSearchProc(Member member, HttpServletRequest req) {       
		
		HashMap<String, Boolean> success = new HashMap<>();
		HashMap<String, Boolean> error = new HashMap<>();
		req.setAttribute("success", success);
		req.setAttribute("errorr", error);
		
		try{
			String pw = (String)memberDAO.pwdSearch(null,member);
			
			if(pw != null){
				success.put("success", Boolean.TRUE);
			} else{
				error.put("errorr", Boolean.TRUE);
			}
			
			req.setAttribute("pwdValue", pw);
			req.setAttribute("pwdId", req.getParameter("id"));
			
			return "login/pwd_search_form";
		} catch (Exception e){
			e.printStackTrace();
			System.out.println("비밀번호 찾기 오류");
			return "login/pwd_search_form";
		}
	}
	
	@RequestMapping(value="/memberDrop", method=RequestMethod.GET)
	public String memberDropForm() {        		
		return "mypage/drop_form";
	}
	
	@RequestMapping(value="/memberDropOk", method=RequestMethod.GET)
	public String memberDropOkForm(HttpServletRequest req){        		
		String pw = req.getParameter("pw");
        req.setAttribute("pw", pw);
        return "mypage/memberDrop";
	}
	
	@RequestMapping(value="/memberDropOk", method=RequestMethod.POST)
	public String memberDropOkProc(HttpServletRequest req, HttpServletResponse res){        
		Member member = new Member();
		
		String id = req.getParameter("id");
		String pw = req.getParameter("pw");
		String oPw = req.getParameter("oPw");
		member.setId(id);
		int result = 0;
		if(pw.equals(oPw)){
			result = (Integer)memberDAO.drop(null,member);
			memberDAO.dropUserReservationCancel(null, member);
		}
		else{
			result = 0;
		}
			
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









