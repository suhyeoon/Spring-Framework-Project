<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="<%=request.getContextPath()%>/css/common.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/css/join_tb.css" rel="stylesheet" type="text/css">
<script type="text/javascript">

	function move(){
		var fail = document.getElementById("fail").value;
		var member = document.getElementById("member").value;
		var codeBig = document.getElementById("codeBig").value;
		var codeSmall = document.getElementById("codeSmall").value;
		var room = document.getElementById("room").value;
		var packages = document.getElementById("packages").value;
		var reservation = document.getElementById("reservation").value;
		var stay = document.getElementById("stay").value;
		var stayHistory = document.getElementById("stayHistory").value;
		var stayDeleted = document.getElementById("stayDeleted").value;
		if(fail == null || fail == ""){
			alert("작업을 완료 했습니다.")
			if(member=="true")
				location.href = "memberList";
			else if(room=="true")
				location.href = "roomList";
			else if(packages=="true")
				location.href = "packageList";
			else if(reservation=="true")
				location.href = "reservationList";
			else if(stay=="true")
				location.href = "stayList";
			else if(stayHistory=="true")
				location.href = "stayHistoryList";
			else if(stayDeleted=="true")
				location.href = "stayDeletedList";
			else
				location.href = "management";	
		}		
		else{
			if(fail =="insert"){
				if(room=="true"){
					alert("객실 번호가 이미 사용중 입니다.");
					location.href = "roomList";
				}
				else if(packages){
					alert("패키지 번호가 이미 사용중 입니다.");
					location.href = "packageList";
				}
				else{
					alert("코드명이 이미 사용중 입니다. 다른 코드명으로 바꿔주세요.");
					location.href = "management";
				}
			}
			else{
				if(member=="true"){
					alert("회원 정보 변경에 실패했습니다.");
					location.href = "memberList";
				}
				else if(room=="true"){
					alert("객실 정보 변경에 실패했습니다.");
					location.href = "roomList";
				}
				else if(packages=="true"){
					alert("패키지 정보 변경에 실패했습니다.");
					location.href = "packageList";
				}
				else{
					alert("코드를 삭제 또는 수정을 할 경우 이미 사용중인 코드를 다른 코드로 바꿔주세요.");
					if(codeSmall == null || codeSmall ==""){
						location.href = "managementRead?big="+codeBig;	
					}
					else{
						location.href = "managementRead?big="+codeBig+"&small="+codeSmall;
					}
				}
			}
			
		}
		
	}
</script>
<title>result</title>
</head>

<body onload="move()">
<input type="hidden" id="codeBig" name="codeBig" value="${codeBig }">
<input type="hidden" id="codeSmall" name="codeSmall" value="${codeSmall }">
<input type="hidden" id="fail" name="fail" value="${fail }">
<input type="hidden" id="member" name="member" value="${member }">
<input type="hidden" id="room" name="room" value="${room }">
<input type="hidden" id="packages" name="packages" value="${packages }">
<input type="hidden" id="reservation" name="reservation" value="${res}">
<input type="hidden" id="stay" name="stay" value="${stay}">
<input type="hidden" id="stayHistory" name="stayHistory" value="${stayHistory}">
<input type="hidden" id="stayDeleted" name="stayDeleted" value="${stayDeleted}">
<center>
<c:import url="/WEB-INF/common/top.jsp"></c:import>
<c:import url="/WEB-INF/common/menu.jsp"></c:import>


<p style="height:500px;"></p>
<c:import url="/WEB-INF/common/footer.jsp"></c:import>
</center>
</body>
</html>