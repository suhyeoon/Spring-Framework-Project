<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>코드 관리 페이지</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link href="<%=request.getContextPath()%>/css/common.css" rel="stylesheet" type="text/css">
<style type="text/css">
.sidebarmenu{
	float:left;
	width: 180px;
}

.sidebarmenu ul{
margin: 0;
padding: 0;
list-style-type: none;
font: bold 13px Verdana;
width: 180px; /* Main Menu Item widths */
border-bottom: 1px solid #ccc;
}
 
.sidebarmenu ul li{
position: relative;
}

/* Top level menu links style */
.sidebarmenu ul li a{
display: block;
overflow: auto; /*force hasLayout in IE7 */
color: white;
text-decoration: none;
padding: 6px;
border-bottom: 1px solid #778;
border-right: 1px solid #778;
}

.sidebarmenu ul li a:link, .sidebarmenu ul li a:visited, .sidebarmenu ul li a:active{
background-color: #012D58; /*background of tabs (default state)*/
}

.sidebarmenu ul li a:visited{
color: white;
}

.sidebarmenu ul li a:hover{
background-color: black;
}

/*Sub level menu items */
.sidebarmenu ul li ul{
position: absolute;
width: 250px; /*Sub Menu Items width */
top: 0;
visibility: hidden;
}

.sidebarmenu a.subfolderstyle{
background: url(./images/right.gif) no-repeat 97% 50%;
}

 
/* Holly Hack for IE \*/
* html .sidebarmenu ul li { float: left; height: 1%; }
* html .sidebarmenu ul li a { height: 1%; }
/* End */

.bigCode {
	overflow: auto;
	margin-right: 280px;
	margin-left: 100px;

}
.
.bigTable{
	border-top: 1px solid #ccbd8f;
}

.bigTable th{
	border-bottom: 1px solid #e5e4e1;
    border-right: 1px solid #e5e4e1; 
	color: #666;
	font-weight: bold;
	text-align: center;
	background: #f0efeb;
}

.bigTable td {
	border-bottom: 1px solid #e5e4e1;
	border-right: 1px solid #e5e4e1;
	height: 25px;
	color: #666;
}

.insertTd{
	border-bottom: 1px solid #e5e4e1;
    border-right: 1px solid #e5e4e1; 
	color: #666;
	font-weight: bold;
	background: #f0efeb;
}

</style>

<script type="text/javascript">

//Nested Side Bar Menu (Mar 20th, 09)
//By Dynamic Drive: http://www.dynamicdrive.com/style/

$(function(){
	var gradeChk = document.getElementById("gradeChk").value;
	if(gradeChk!='관리자'){
		alert("잘못된 접근입니다.")
		location.href="main.jsp";
	}
});

var menuids=["sidebarmenu1"] //Enter id(s) of each Side Bar Menu's main UL, separated by commas

function initsidebarmenu(){
for (var i=0; i<menuids.length; i++){
  var ultags=document.getElementById(menuids[i]).getElementsByTagName("ul")
    for (var t=0; t<ultags.length; t++){
    ultags[t].parentNode.getElementsByTagName("a")[0].className+=" subfolderstyle"
  if (ultags[t].parentNode.parentNode.id==menuids[i]) //if this is a first level submenu
   ultags[t].style.left=ultags[t].parentNode.offsetWidth+"px" //dynamically position first level submenus to be width of main menu item
  else //else if this is a sub level submenu (ul)
    ultags[t].style.left=ultags[t-1].getElementsByTagName("a")[0].offsetWidth+"px" //position menu to the right of menu item that activated it
    ultags[t].parentNode.onmouseover=function(){
    this.getElementsByTagName("ul")[0].style.display="block"
    }
    ultags[t].parentNode.onmouseout=function(){
    this.getElementsByTagName("ul")[0].style.display="none"
    }
    }
  for (var t=ultags.length-1; t>-1; t--){ //loop through all sub menus again, and use "display:none" to hide menus (to prevent possible page scrollbars
  ultags[t].style.visibility="visible"
  ultags[t].style.display="none"
  }
  }
}

function modify(chk){
	if(chk==1){
		document.getElementById("codeBig").readOnly = false;
		document.getElementById("nameBig").readOnly = false;
	}
	else if(chk==2){
		document.getElementById("codeSmall").readOnly = false;
		document.getElementById("nameSmall").readOnly = false;
		document.getElementById("codeBigSelect").disabled = false;
	}
	else if(chk==3){
		var no = document.getElementById("memberNo").value;
		if(no == ""){
			alert("수정할 회원을 선택해주세요.")
		}
		else{
			document.getElementById("name"+no).readOnly = false;
			document.getElementById("tel"+no).readOnly = false;
			document.getElementById("addr"+no).readOnly = false;
			document.getElementById("email"+no).readOnly = false;
			document.getElementById("mileage"+no).readOnly = false;
			document.getElementById("gender"+no).readOnly = false;
			document.getElementById("status"+no).readOnly = false;
			document.getElementById("memberGrade"+no).disabled = false;
		}
	}
	else if(chk==4){
		var no = document.getElementById("selectRoomNo").value;
		if(no == ""){
			alert("수정할 객실을 선택해주세요.")
		}
		else{
			document.getElementById("roomNo"+no).readOnly = false;
			document.getElementById("price"+no).readOnly = false;
			document.getElementById("floor"+no).readOnly = false;
			document.getElementById("roomGrade"+no).disabled = false;
			document.getElementById("roomLevel"+no).disabled = false;
			document.getElementById("roomType"+no).disabled = false;
			document.getElementById("roomView"+no).disabled = false;
			document.getElementById("roomSize"+no).disabled = false;
		}
	}
	else if(chk==5){
		var no = document.getElementById("selectPackageNo").value;
		if(no == ""){
			alert("수정할 패키지를 선택해주세요.")
		}
		else{
			document.getElementById("packageNo"+no).readOnly = false;
			document.getElementById("price"+no).readOnly = false;
			document.getElementById("name"+no).readOnly = false;
			document.getElementById("startDate"+no).disabled = false;
			document.getElementById("endDate"+no).disabled = false;
			document.getElementById("roomGrade"+no).disabled = false;
			document.getElementById("roomLevel"+no).disabled = false;
			document.getElementById("roomType"+no).disabled = false;
			document.getElementById("roomView"+no).disabled = false;
		}
	}
}

function success(chk){
	if(chk==1){
		var oldBig = document.getElementById("oldBig").value;
		var codeBig = document.getElementById("codeBig").value;
		var nameBig = document.getElementById("nameBig").value;
		location.href="codeBigUpdate?oldBig="+oldBig+"&codeBig="+codeBig+"&nameBig="+nameBig;
	}
	else if(chk==2){
		var oldBig = document.getElementById("oldBig").value;
		var oldSmall = document.getElementById("oldSmall").value;
		var codeBig = document.getElementById("newBig").value;
		var codeSmall = document.getElementById("codeSmall").value;
		var nameSmall = document.getElementById("nameSmall").value;
		if(codeBig == codeSmall.substring(0,2)){
			location.href="codeSmallUpdate?oldBig="+oldBig+"&oldSmall="+oldSmall+
							"&codeBig="+codeBig+"&codeSmall="+codeSmall+"&nameSmall="+nameSmall;
		}
		else{
			alert("코드 규칙에 어긋납니다. 하위 코드명의 앞의 두글자는 상위 코드명을 써주세요.");
		}
	}
	else if(chk==3){
		var no = document.getElementById("memberNo").value;
		if(no == ""){
			alert("수정 또는 등록 완료한 회원을 선택해주세요.");
		}
		else{
			if(isNaN(document.getElementById("mileage"+no).value)){
				alert("마일리지는 숫자로 입력해주세요.");
				return;
			}
			var id = document.getElementById("id"+no).value;
			var name = document.getElementById("name"+no).value;
			var tel = document.getElementById("tel"+no).value;
			var addr = document.getElementById("addr"+no).value;
			var email = document.getElementById("email"+no).value;
			var mileage = document.getElementById("mileage"+no).value;
			var gender = document.getElementById("gender"+no).value;
			var status = document.getElementById("status"+no).value;
			var grade = document.getElementById("memberGrade"+no).value;
			
			location.href="memberUpdate?id="+id+"&name="+name+
			"&tel="+tel+"&addr="+addr+"&email="+email+"&mileage="+mileage+
			"&gender="+gender+"&status="+status+"&codeSmall="+grade;
		}
	}
	else if(chk==4){
		var no = document.getElementById("selectRoomNo").value;
		
		if(no=="true"){
			if(document.getElementById("roomNo").value=="" || document.getElementById("floor").value=="" ||
					document.getElementById("price").value ==""){
				alert("빈 칸을 모두 채워주세요.");
				return;
			}
			var roomNo = document.getElementById("roomNo").value;
			var floor = document.getElementById("floor").value;
			var price = document.getElementById("price").value;
			var roomGrade = document.getElementById("roomGrade").value;
			var roomLevel = document.getElementById("roomLevel").value;
			var roomType = document.getElementById("roomType").value;
			var roomView = document.getElementById("roomView").value;
			var roomSize = document.getElementById("roomSize").value;
			
			location.href="roomInsertData?roomNo="+roomNo+"&floor="+floor+
			"&price="+price+"&roomGrade="+roomGrade+"&roomLevel="+roomLevel+"&roomType="+roomType+
			"&roomView="+roomView+"&roomSize="+roomSize;
		}
		else{
			var oldRoomNo = document.getElementById("oldRoomNo").value;
			if(no == ""){
				alert("수정 또는 등록 완료한 객실을 선택해주세요.");
			}
			else{

				var roomNo = document.getElementById("roomNo"+no).value;
				var floor = document.getElementById("floor"+no).value;
				var price = document.getElementById("price"+no).value;
				var roomGrade = document.getElementById("roomGrade"+no).value;
				var roomLevel = document.getElementById("roomLevel"+no).value;
				var roomType = document.getElementById("roomType"+no).value;
				var roomView = document.getElementById("roomView"+no).value;
				var roomSize = document.getElementById("roomSize"+no).value;
				
				location.href="roomUpdate?roomNo="+roomNo+"&floor="+floor+
				"&price="+price+"&roomGrade="+roomGrade+"&roomLevel="+roomLevel+"&roomType="+roomType+
				"&roomView="+roomView+"&roomSize="+roomSize+"&strNo="+oldRoomNo;
			}
		}
	}
	else if(chk==5){
		var no = document.getElementById("selectPackageNo").value;
		
		
		if(no=="true"){
			if(document.getElementById("packageNo").value=="" || document.getElementById("name").value=="" ||
					document.getElementById("price").value =="" || document.getElementById("startDate").value =="" ||
					document.getElementById("endDate").value ==""){
					alert("빈 칸을 모두 채워주세요.");
					return;
				}
				if(isNaN(document.getElementById("price").value)){
					alert("가격은 숫자로 입력해주세요.");
					return;
				}
			var packageNo = document.getElementById("packageNo").value;
			var name = document.getElementById("name").value;
			var price = document.getElementById("price").value;
			var roomGrade = document.getElementById("roomGrade").value;
			var roomLevel = document.getElementById("roomLevel").value;
			var roomType = document.getElementById("roomType").value;
			var roomView = document.getElementById("roomView").value;
			var startDate = document.getElementById("startDate").value;
			var endDate = document.getElementById("endDate").value;
			
			location.href="packageInsertData?packageNo="+packageNo+"&name="+name+
			"&price="+price+"&roomGrade="+roomGrade+"&roomLevel="+roomLevel+"&roomType="+roomType+
			"&roomView="+roomView+"&startDate="+startDate+"&endDate="+endDate;
		}
		else{
			var oldPackageNo = document.getElementById("oldPackageNo").value;
			if(no == ""){
				alert("수정 또는 등록 완료한 패키지를 선택해주세요.");
			}
			else{

				var packageNo = document.getElementById("packageNo"+no).value;
				var name = document.getElementById("name"+no).value;
				var price = document.getElementById("price"+no).value;
				var roomGrade = document.getElementById("roomGrade"+no).value;
				var roomLevel = document.getElementById("roomLevel"+no).value;
				var roomType = document.getElementById("roomType"+no).value;
				var roomView = document.getElementById("roomView"+no).value;
				var startDate = document.getElementById("startDate"+no).value;
				var endDate = document.getElementById("endDate"+no).value;
				
				location.href="packageUpdate?packageNo="+packageNo+"&name="+name+
				"&price="+price+"&roomGrade="+roomGrade+"&roomLevel="+roomLevel+"&roomType="+roomType+
				"&roomView="+roomView+"&startDate="+startDate+"&endDate="+endDate+"&strNo="+oldPackageNo;
			}
		}
	}
	else if(chk==6){
		var no = document.getElementById("reservationNo").value;
		if(no == ""){
			alert("체크인할 예약정보를 선택해주세요.");
		}
		else{
			location.href="checkIn?no="+no;
		}
	}
	else if(chk==7){
		var no = document.getElementById("stayNo").value;
		if(no == ""){
			alert("체크아웃할 숙박정보를 선택해주세요.");
		}
		else{
			location.href="checkOut?no="+no;
		}
	}
	else if(chk==8){
		var no = document.getElementById("stayNo").value;
		if(no == ""){
			alert("체크아웃 취소할 숙박정보를 선택해주세요.");
		}
		else{
			location.href="checkOutCancel?no="+no;
		}
	}
	else if(chk==9){
		var no = document.getElementById("stayNo").value;
		if(no == ""){
			alert("복원할 숙박정보를 선택해주세요.");
		}
		else{
			location.href="restore?no="+no;
		}
	}
}

function deleteCode(chk){
	if(chk==1){
		var oldBig = document.getElementById("oldBig").value;
		location.href="codeBigDelete?codeBig="+oldBig;
	}
	if(chk==2){
		var oldBig = document.getElementById("oldBig").value;
		var oldSmall = document.getElementById("oldSmall").value;
		location.href="codeSmallDelete?codeBig="+oldBig+"&codeSmall="+oldSmall;
	}
	if(chk==3){
		var no = document.getElementById("memberNo").value;
		
		if(no == ""){
			alert("삭제할 회원을 선택해주세요.");
		}
		else{
			var id = document.getElementById("id"+no).value;
			location.href="memberDelete?id="+id;
		}
	}
	if(chk==4){
		var no = document.getElementById("selectRoomNo").value;
		
		if(no == ""){
			alert("삭제할 객실을 선택해주세요.");
		}
		else{
			var roomNo = document.getElementById("roomNo"+no).value;
			location.href="roomDelete?roomNo="+roomNo;
		}
	}
	if(chk==5){
		var no = document.getElementById("selectPackageNo").value;
		
		if(no == ""){
			alert("삭제할 패키지를 선택해주세요.");
		}
		else{
			var packageNo = document.getElementById("packageNo"+no).value;
			location.href="packageDelete?packageNo="+packageNo;
		}
	}
	else if(chk==6){
		var no = document.getElementById("reservationNo").value;
		if(no == ""){
			alert("삭제할 예약정보를 선택해주세요.");
		}
		else{
			location.href="reservationDelete?no="+no;
		}
	}
	else if(chk==7){
		var no = document.getElementById("stayNo").value;
		if(no == ""){
			alert("삭제할 숙박정보를 선택해주세요.");
		}
		else{
			location.href="stayDelete?no="+no;
		}
	}
	else if(chk==8){
		var no = document.getElementById("stayNo").value;
		if(no == ""){
			alert("삭제할 숙박정보를 선택해주세요.");
		}
		else{
			location.href="stayHistoryDelete?no="+no;
		}
	}
	else if(chk==9){
		var no = document.getElementById("stayNo").value;
		if(no == ""){
			alert("완전 삭제할 숙박정보를 선택해주세요.");
		}
		else{
			location.href="stayDeletedDelete?no="+no;
		}
	}
}

function insert(chk){
	if(chk==1){
		if(document.getElementById("codeBig").value=="" || document.getElementById("nameBig").value==""){
			alert("빈 칸을 모두 채워주세요.");
			return;
		}
		var codeBig = document.getElementById("codeBig").value;
		var nameBig = document.getElementById("nameBig").value;
		location.href="codeBigInsert?codeBig="+codeBig+"&nameBig="+nameBig;
	}
	else if(chk==2){
		if(document.getElementById("newBig").value=="" || document.getElementById("codeSmall").value=="" ||
				document.getElementById("nameSmall").value ==""){
			alert("빈 칸을 모두 채워주세요.");
			return;
		}
		var newBig = document.getElementById("newBig").value;
		var codeSmall = document.getElementById("codeSmall").value;
		var nameSmall = document.getElementById("nameSmall").value;
		
		if(newBig == codeSmall.substring(0,2)){
			location.href="codeSmallInsert?codeSmall="+codeSmall+
							"&nameSmall="+nameSmall+"&codeBig="+newBig;
		}
		else{
			alert("코드 규칙에 어긋납니다. 하위 코드명의 앞의 두글자는 상위 코드명을 써주세요.")
		}
	}
	else if(chk==4){
		
		location.href="roomInsert";
	}
	else if(chk==5){
		
		location.href="packageInsert";
	}
}

function selectCodeBig(val){
	document.getElementById("newBig").value = val;
}

function selectMember(val){
	var no = document.getElementById("memberNo").value;
	if(no != ""){
		document.getElementById("name"+no).readOnly = true;
		document.getElementById("tel"+no).readOnly = true;
		document.getElementById("addr"+no).readOnly = true;
		document.getElementById("email"+no).readOnly = true;
		document.getElementById("mileage"+no).readOnly = true;
		document.getElementById("gender"+no).readOnly = true;
		document.getElementById("status"+no).readOnly = true;
		document.getElementById("memberGrade"+no).disabled = true;
	}
	document.getElementById("memberNo").value = val;
}

function selectRoom(val){
	var addr = val.split(':');
	var no = document.getElementById("selectRoomNo").value;
	if(no=="true"){
		location.href="roomList";
	}
	else{
		if(no != ""){
			document.getElementById("roomNo"+no).readOnly = true;
			document.getElementById("price"+no).readOnly = true;
			document.getElementById("floor"+no).readOnly = true;
			document.getElementById("roomGrade"+no).disabled = true;
			document.getElementById("roomLevel"+no).disabled = true;
			document.getElementById("roomType"+no).disabled = true;
			document.getElementById("roomView"+no).disabled = true;
			document.getElementById("roomSize"+no).disabled = true;
		}
		document.getElementById("selectRoomNo").value = addr[0];
		document.getElementById("oldRoomNo").value = addr[1];
	}
}

function selectPackage(val){
	var addr = val.split(':');
	var no = document.getElementById("selectPackageNo").value;
	if(no=="true"){
		location.href="packageList";
	}
	else{
		if(no != ""){
			document.getElementById("packageNo"+no).readOnly = true;
			document.getElementById("name"+no).readOnly = true;
			document.getElementById("price"+no).readOnly = true;
			document.getElementById("roomGrade"+no).disabled = true;
			document.getElementById("roomLevel"+no).disabled = true;
			document.getElementById("roomType"+no).disabled = true;
			document.getElementById("roomView"+no).disabled = true;
			document.getElementById("startDate"+no).disabled = true;
			document.getElementById("endDate"+no).disabled = true;
		}
		document.getElementById("selectPackageNo").value = addr[0];
		document.getElementById("oldPackageNo").value = addr[1];
	}
}

function selectReservation(val){
	var addr = val.split(':');
	document.getElementById("selectReservationNo").value = addr[0];
	document.getElementById("reservationNo").value = addr[1];
}

function selectStay(val){
	var addr = val.split(':');
	document.getElementById("selectStayNo").value = addr[0];
	document.getElementById("stayNo").value = addr[1];
}

function checkStartDate(){
	  var sDate = document.getElementById("startDate").value;
	  
	  var arr = sDate.split('-');
	  var start = new Date(arr[0],arr[1]-1,arr[2]);
	  var now = new Date();

	  var diffDate = start - now;
	  var result = Math.ceil(diffDate / ( 60 * 1000 * 60 * 24));
	  
	  if(result < 0){
		  alert("이전 날짜는 시작 날짜로 선택할 수 없습니다.");  
		  document.getElementById("startDate").value = "";
		  document.getElementById("endDate").value = "";
	  }
	  else{
		  document.getElementById("startDate").value = sDate;
	  }
}

function checkEndDate(){
	  var sDate = document.getElementById("startDate").value;
	  var eDate = document.getElementById("endDate").value;
	  
	  var arr = sDate.split('-');
	  var start = new Date(arr[0],arr[1]-1,arr[2]);

	  arr = eDate.split('-');
	  var end = new Date(arr[0],arr[1]-1,arr[2]);
	  
	  var diffDate = end - start;
	  var result = Math.ceil(diffDate / ( 60 * 1000 * 60 * 24));
	  
	  if(sDate == "" || sDate == null){
		  alert("시작 날짜를 먼저 선택해주세요.");
		  document.getElementById("endDate").value = "";
		  return;
	  }
	  
	  if(result <= 0){
		  alert("시작 날짜 또는 이전 날짜로는 종료 날짜로 선택할 수 없습니다.");  
		  document.getElementById("endDate").value = "";
	  }
	  else{
		  document.getElementById("endDate").value = eDate;
	  }  
}

$.datepicker.regional['ko'] = {
		  closeText: '닫기',
		  prevText: '이전달',
		  nextText: '다음달',
		  currentText: '오늘',
		  monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		  monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		  dayNames: ['일','월','화','수','목','금','토'],
		  dayNamesShort: ['일','월','화','수','목','금','토'],
		  dayNamesMin: ['일','월','화','수','목','금','토'],
		  weekHeader: 'Wk',
		  firstDay: 0,
		  isRTL: false,
		  duration:200,
		  showMonthAfterYear: true,
		  yearSuffix:'년'
		 };

$.datepicker.setDefaults($.datepicker.regional['ko']);
$( function() {
$( ".startDate" ).datepicker({
  showOtherMonths: true,
  selectOtherMonths: true,
  dateFormat: "yy-mm-dd", // 날짜 포맷 설정
  showAnim: "drop"
});
} );



$( function() {
	$( ".endDate" ).datepicker({
	   showOtherMonths: true,
	   selectOtherMonths: true,
	   dateFormat: "yy-mm-dd", // 날짜 포맷 설정
	   showAnim: "drop"
	 });
});



if (window.addEventListener)
window.addEventListener("load", initsidebarmenu, false)
else if (window.attachEvent)
window.attachEvent("onload", initsidebarmenu)

</script>
</head>
<body>
<center>
<c:import url="/WEB-INF/common/top.jsp"></c:import>
<c:import url="/WEB-INF/common/menu.jsp"></c:import>
<div>
	<div class="sidebarmenu">
	<input type="hidden" id="oldBig" name="oldBig" value="${param.big }">
	<input type="hidden" id="oldSmall" name="oldSmall" value="${param.small }">
	<input type="hidden" id="newBig" name="newBig" value="${param.big }">
	<input type="hidden" id="gradeChk" name="gradeChk" value="${authGrade }">
	<input type="hidden" id="memberNo" name="memberNo" value="">
	<input type="hidden" id="selectRoomNo" name="selectRoomNo" value="${roomInsert }">
	<input type="hidden" id="selectPackageNo" name="selectPackageNo" value="${packageInsert }">
	<input type="hidden" id="selectReservationNo" name="selectReservationNo" value="">
	<input type="hidden" id="selectStayNo" name="selectStayNo" value="">
	<input type="hidden" id="stayNo" name="stayNo" value="">
	<input type="hidden" id="reservationNo" name="reservationNo" value="">
	<input type="hidden" id="oldRoomNo" name="oldRoomNo" value="">
	<input type="hidden" id="oldPackageNo" name="oldPackageNo" value="">
<ul id="sidebarmenu1">
	<li><a href="#">코드 관리</a>
		<ul>
			<c:forEach var="big" items="${requestScope.codeBigList}">
				<li><a href="managementRead?big=${big.codeBig }">[${big.codeBig}]${big.nameBig }</a>
					<ul>
						<c:forEach var="small" items="${big.sub}">
							<li><a href="managementRead?big=${big.codeBig }&small=${small.codeSmall}">[${small.codeSmall}]${small.nameSmall }</a></li>
						</c:forEach> 
						<li><a href="insertSmall?big=${big.codeBig }">새 코드 추가</a></li>
					</ul>
				</li>
			</c:forEach>
			<li><a href="insertBig">새 코드 추가</a></li>
		</ul>
	</li>
	<li><a href="memberList">회원 관리</a></li>
	<li><a href="roomList">객실 관리</a></li>
	<li><a href="packageList">패키지 관리</a></li>	
	<li><a href="#">예약 / 숙박관리</a>
		<ul>
			<li><a href="reservationList">예약 관리</a></li>
			<li><a href="stayList">숙박현황 관리</a></li>
			<li><a href="stayHistoryList">숙박기록 관리</a></li>
			<li><a href="stayDeletedList">삭제된기록 관리</a></li>
		</ul>
	</li>
</ul>
	</div>
	<c:if test="${requestScope.big }">
	<div class="bigCode" align="center">
	<br>
	<h2 align=left>코드 관리</h2>
		<table class="bigTable" width="300px">
			<tr>
				<th width="100px">
					코드명
				</th>
				<th width="200px">
					코드내용
				</th>
			</tr>
			<tr>
			<c:if test="${requestScope.insert eq null }">
				<td align="center"><input type="text" maxlength="2" size="2" id="codeBig" name="codeBig" value="${contents.codeBig }" readonly="readonly" ></td>
				<td align="center"><input type="text" maxlength="10" size="10" id="nameBig" name="nameBig" value="${contents.nameBig }" readonly="readonly"></td>
			</c:if>
			<c:if test="${requestScope.insert}">
				<td align="center"><input type="text" maxlength="2" size="2" id="codeBig" name="codeBig" value=""></td>
				<td align="center"><input type="text" maxlength="10" size="10" id="nameBig" name="nameBig" value=""></td>
			</c:if>
			</tr>
			<tr>
			<c:if test="${requestScope.insert eq null }">
				<td colspan=2 align="right">
					<input type="button" value="수정" 
                    	onclick= "modify(1)">
                    <input type="button" value="확인" 
                    	onclick= "success(1)">
                    <input type="button" value="삭제"
                    	onclick="deleteCode(1)"> 
				</td>
			</c:if>
			<c:if test="${requestScope.insert}">
				<td colspan=2 align="right">
                    <input type="button" value="등록" 
                    	onclick= "insert(1)">
				</td>
			</c:if>
			</tr>
		</table>
	</div>
	</c:if>

	<c:if test="${requestScope.small }">
	<div class="bigCode" align="center">
	<br>
	<h2 align=left>코드 관리</h2>
		<table class="bigTable" width="500px">
			<tr>
				<th width="130px">
					상위 코드
				</th>
				<th width="130px">
					코드명
				</th>
				<th width="240px">
					코드내용
				</th>
			</tr>
			<tr>
				<c:if test="${requestScope.insert eq null }">
					<td>
						<select id="codeBigSelect" name="codeBigSelect" onchange="selectCodeBig(this.value);" disabled="disabled">
							<c:forEach var="big" items="${requestScope.codeBigList}">
								<c:if test="${big.codeBig eq param.big}">
									<option value="${big.codeBig}" selected>[${big.codeBig}]${big.nameBig}</option>
								</c:if>
								<c:if test="${big.codeBig ne param.big}">
								<option value="${big.codeBig}">[${big.codeBig}]${big.nameBig}</option>
								</c:if>
							</c:forEach>
						</select>
					</td>
					<td align="center"><input type="text" maxlength="4" size="4" id="codeSmall" name="codeSmall" value="${contents.codeSmall }" readonly="readonly" ></td>
					<td align="center"><input type="text" maxlength="16" size="16" id="nameSmall" name="nameSmall" value="${contents.nameSmall }" readonly="readonly"></td>
				</c:if>
				<c:if test="${requestScope.insert}">
					<td>
						<select id="codeBigSelect" name="codeBigSelect" onchange="selectCodeBig(this.value);" disabled="disabled">
							<c:forEach var="big" items="${requestScope.codeBigList}">
								<c:if test="${big.codeBig eq param.big}">
									<option value="${big.codeBig}" selected>[${big.codeBig}]${big.nameBig}</option>
								</c:if>
								<c:if test="${big.codeBig ne param.big}">
								<option value="${big.codeBig}">[${big.codeBig}]${big.nameBig}</option>
								</c:if>
							</c:forEach>
						</select>
					</td>
					<td align="center"><input type="text" maxlength="4" size="4" id="codeSmall" name="codeSmall" value=""></td>
					<td align="center"><input type="text" maxlength="16" size="16" id="nameSmall" name="nameSmall" value=""></td>
				</c:if>
			</tr>
			<tr>
			<c:if test="${requestScope.insert eq null }">
				<td colspan=3 align="right">
					<input type="button" value="수정" 
                    	onclick= "modify(2)">
                    <input type="button" value="확인" 
                    	onclick= "success(2)">
                    <input type="button" value="삭제"
                    	onclick="deleteCode(2)"> 
				</td>
			</c:if>
			<c:if test="${requestScope.insert}">
				<td colspan=3 align="right">
					코드명은 최대 4자리로 앞의 2자리는 상위코드명을 입력해주세요.
                    <input type="button" value="등록" 
                    	onclick= "insert(2)">
				</td>
			</c:if>
			</tr>
		</table>
	</div>
	</c:if>

	<c:if test="${requestScope.member }">
		<div class="bigCode" align="center" >
		<br>
		<h2 align=left>회원 관리</h2>
		<table class="bigTable" width="1310px">
			<tr>
				<th width="50px">선택</th>
				<th width="120px">아이디</th>
				<th width="100px">이름</th>
				<th width="80px">회원등급</th>
				<th width="500px">주소</th>
				<th width="120px">전화번호</th>
				<th width="50px">성별</th>
				<th width="150px">이메일</th>
				<th width="80px">마일리지</th>
				<th width="60px">상태</th>
			</tr>
				<c:forEach var="list" items="${requestScope.memberList}" varStatus="st">
				<tr>
					<td align="center"><input type="radio" id="rdoOption" name="rdoOption" onclick="selectMember(this.value);" 
					value="${st.index}"></td>
					<td align="center"><input type="text" maxlength="10" size="10" id="id${st.index}" name="id${st.index}" value="${list.id }" readonly="readonly" ></td>
					<td align="center"><input type="text" maxlength="6" size="6" id="name${st.index}" name="name${st.index}" value="${list.name }" readonly="readonly" ></td>
					<td align="center">
						<select id="memberGrade${st.index}" name="memberGrade${st.index}" style="width: 80px;" onchange="selectMemberGrade(this.value);" disabled="disabled">
							<c:forEach var="mGrade" items="${requestScope.memberGrade}">
								<c:if test="${list.codeSmall eq mGrade.codeSmall}">
									<option value="${mGrade.codeSmall}" selected>${mGrade.nameSmall}</option>
								</c:if>
								<c:if test="${list.codeSmall ne mGrade.codeSmall}">
									<option value="${mGrade.codeSmall}">${mGrade.nameSmall}</option>
								</c:if>
							</c:forEach>
						</select>
					</td>
					<td align="center"><input type="text" maxlength="60" size="60" id="addr${st.index}" name="addr${st.index}" value="${list.addr }" readonly="readonly" ></td>
					<td align="center"><input type="text" maxlength="13" size="10" id="tel${st.index}" name="tel${st.index}" value="${list.tel }" readonly="readonly" ></td>
					<td align="center"><input type="text" maxlength="1" size="1" id="gender${st.index}" name="gender${st.index}" value="${list.gender }" readonly="readonly" ></td>
					<td align="center"><input type="text" maxlength="20" size="20" id="email${st.index}" name="email${st.index}" value="${list.email }" readonly="readonly" ></td>
					<td align="center"><input type="text" style='text-align:right' maxlength="5" size="5" id="mileage${st.index}" name="mileage${st.index}" value="${list.mileage }" readonly="readonly" ></td>
					<td align="center"><input type="text" maxlength="3" size="3" id="status${st.index}" name="status${st.index}" value="${list.status }" readonly="readonly" ></td>
				</tr>
				</c:forEach>
			<tr>
				<td colspan=10 align="right">
					<input type="button" value="수정" 
                    	onclick= "modify(3)">
                    <input type="button" value="확인" 
                    	onclick= "success(3)">
                    <input type="button" value="삭제"
                    	onclick="deleteCode(3)"> 
				</td>
			</tr>
		
		</table>
		</div>
	</c:if>
	
	<c:if test="${requestScope.room }">
		<div class="bigCode" align="center">
			<br>
			<h2 align=left>객실 관리</h2>
		<table class="bigTable" width="810px">
			<tr>
				<th width="80px">선택</th>
				<th width="80px">번호</th>
				<th width="120px">등급</th>
				<th width="130px">세부 등급</th>
				<th width="100px">타입</th>
				<th width="80px">전망</th>
				<th width="50px">층</th>
				<th width="100px">가격</th>
				<th width="70px">크기</th>
			</tr>
			
				<c:forEach var="list" items="${requestScope.roomList}" varStatus="st">
				<tr>
					<td align="center"><input type="radio" id="rdoOption" name="rdoOption" onclick="selectRoom(this.value);" 
					value="${st.index}:${list.roomNo}"></td>
					<td align="center"><input type="text" maxlength="5" size="5" id="roomNo${st.index}" name="roomNo${st.index}" value="${list.roomNo }" readonly="readonly" ></td>
					<td align="center">
						<select id="roomGrade${st.index}" name="roomGrade${st.index}" style="width: 120px;" onchange="selectRoomGrade(this.value);" disabled="disabled">
							<c:forEach var="rGrade" items="${requestScope.roomGrade}">
								<c:if test="${list.roomGrade eq rGrade.nameSmall}">
									<option value="${rGrade.codeSmall}" selected>${rGrade.nameSmall}</option>
								</c:if>
								<c:if test="${list.roomGrade ne rGrade.nameSmall}">
									<option value="${rGrade.codeSmall}">${rGrade.nameSmall}</option>
								</c:if>
							</c:forEach>
						</select>
					</td>
					<td align="center">
						<select id="roomLevel${st.index}" name="roomLevel${st.index}" style="width: 130px;" onchange="selectRoomLevel(this.value);" disabled="disabled">
							<c:forEach var="rLevel" items="${requestScope.roomLevel}">
								<c:if test="${list.roomLevel eq rLevel.nameSmall}">
									<option value="${rLevel.codeSmall}" selected>${rLevel.nameSmall}</option>
								</c:if>
								<c:if test="${list.roomLevel ne rLevel.nameSmall}">
									<option value="${rLevel.codeSmall}">${rLevel.nameSmall}</option>
								</c:if>
							</c:forEach>
						</select>
					</td>
					<td align="center">
						<select id="roomType${st.index}" name="roomType${st.index}" style="width: 100px;" onchange="selectRoomType(this.value);" disabled="disabled">
							<c:forEach var="rType" items="${requestScope.roomType}">
								<c:if test="${list.roomType eq rType.nameSmall}">
									<option value="${rType.codeSmall}" selected>${rType.nameSmall}</option>
								</c:if>
								<c:if test="${list.roomType ne rType.nameSmall}">
									<option value="${rType.codeSmall}">${rType.nameSmall}</option>
								</c:if>
							</c:forEach>
						</select>
					</td>
					<td align="center">
						<select id="roomView${st.index}" name="roomView${st.index}" style="width: 80px;" onchange="selectRoomView(this.value);" disabled="disabled">
							<c:forEach var="rView" items="${requestScope.roomView}">
								<c:if test="${list.roomView eq rView.nameSmall}">
									<option value="${rView.codeSmall}" selected>${rView.nameSmall}</option>
								</c:if>
								<c:if test="${list.roomView ne rView.nameSmall}">
									<option value="${rView.codeSmall}">${rView.nameSmall}</option>
								</c:if>
							</c:forEach>
						</select>
					</td>
					<td align="center"><input type="text" style='text-align:right' maxlength="1" size="1" id="floor${st.index}" name="floor${st.index}" value="${list.floor }" readonly="readonly" ></td>
					<td align="center"><input type="text" style='text-align:right' maxlength="7" size="5" id="price${st.index}" name="price${st.index}" value="${list.price }" readonly="readonly" ></td>
					<td align="center">
						<select id="roomSize${st.index}" name="roomSize${st.index}" style="width: 70px;" onchange="selectRoomSize(this.value);" disabled="disabled">
							<c:forEach var="rSize" items="${requestScope.roomSize}">
								<c:if test="${list.roomSize eq rSize.nameSmall}">
									<option value="${rSize.codeSmall}" selected>${rSize.nameSmall}</option>
								</c:if>
								<c:if test="${list.roomSize ne rSize.nameSmall}">
									<option value="${rSize.codeSmall}">${rSize.nameSmall}</option>
								</c:if>
							</c:forEach>
						</select>
					</td>
				</tr>
				</c:forEach>
				<c:if test="${roomInsert}">
				<tr>
					<td class="insertTd" colspan=9 align="left">
					객실 신규 등록
					</td>
				</tr>
				<tr>
					<td align="center"><input type="radio" id="rdoOption" name="rdoOption" onclick="selectRoom(this.value);" 
					value="insert" checked></td>
					<td align="center"><input type="text" maxlength="5" size="5" id="roomNo" name="roomNo" value=""></td>
					<td align="center">
						<select id="roomGrade" name="roomGrade" style="width: 120px;" onchange="selectRoomGrade(this.value);">
							<c:forEach var="rGrade" items="${requestScope.roomGrade}">
								<option value="${rGrade.codeSmall}">${rGrade.nameSmall}</option>
							</c:forEach>
						</select>
					</td>
					<td align="center">
						<select id="roomLevel" name="roomLevel" style="width: 130px;" onchange="selectRoomLevel(this.value);">
							<c:forEach var="rLevel" items="${requestScope.roomLevel}">
								<option value="${rLevel.codeSmall}">${rLevel.nameSmall}</option>
							</c:forEach>
						</select>
					</td>
					<td align="center">
						<select id="roomType" name="roomType" style="width: 100px;" onchange="selectRoomType(this.value);">
							<c:forEach var="rType" items="${requestScope.roomType}">
								<option value="${rType.codeSmall}">${rType.nameSmall}</option>
							</c:forEach>
						</select>
					</td>
					<td align="center">
						<select id="roomView" name="roomView" style="width: 80px;" onchange="selectRoomView(this.value);">
							<c:forEach var="rView" items="${requestScope.roomView}">
								<option value="${rView.codeSmall}">${rView.nameSmall}</option>
							</c:forEach>
						</select>
					</td>
					<td align="center"><input type="text" style='text-align:right' maxlength="1" size="1" id="floor" name="floor" value=""></td>
					<td align="center"><input type="text" style='text-align:right' maxlength="7" size="5" id="price" name="price" value=""></td>
					<td align="center">
						<select id="roomSize" name="roomSize" style="width: 70px;" onchange="selectRoomSize(this.value);">
							<c:forEach var="rSize" items="${requestScope.roomSize}">
								<option value="${rSize.codeSmall}">${rSize.nameSmall}</option>
							</c:forEach>
						</select>
					</td>
				</tr>
				</c:if>
			<tr>
				<td colspan=9 align="right">
					<input type="button" value="등록" 
                    	onclick= "insert(4)">
					<input type="button" value="수정" 
                    	onclick= "modify(4)">
                    <input type="button" value="확인" 
                    	onclick= "success(4)">
                    <input type="button" value="삭제"
                    	onclick="deleteCode(4)"> 
				</td>
			</tr>
		
		</table>
		</div>
	</c:if>
	
	<c:if test="${requestScope.packages }">
		<div class="bigCode" align="center">
			<br>
			<h2 align=left>패키지 관리</h2>
		<table class="bigTable" width="1070px">
			<tr>
				<th width="80px">선택</th>
				<th width="80px">번호</th>
				<th width="180px">이름</th>
				<th width="120px">등급</th>
				<th width="130px">세부 등급</th>
				<th width="100px">타입</th>
				<th width="80px">전망</th>
				<th width="100px">가격</th>
				<th width="100px">시작 날짜</th>
				<th width="100px">종료 날짜</th>
			</tr>
			
				<c:forEach var="list" items="${requestScope.packageList}" varStatus="st">
				<tr>
					<td align="center"><input type="radio" id="rdoOption" name="rdoOption" onclick="selectPackage(this.value);" 
					value="${st.index}:${list.packageNo}"></td>
					<td align="center"><input type="text" maxlength="4" size="3" id="packageNo${st.index}" name="packageNo${st.index}" value="${list.packageNo }" readonly="readonly" ></td>
					<td align="center"><input type="text" maxlength="20" size="15" id="name${st.index}" name="name${st.index}" value="${list.name }" readonly="readonly" ></td>
					<td align="center">
						<select id="roomGrade${st.index}" name="roomGrade${st.index}" style="width: 120px;" onchange="selectRoomGrade(this.value);" disabled="disabled">
							<c:forEach var="rGrade" items="${requestScope.roomGrade}">
								<c:if test="${list.roomGrade eq rGrade.nameSmall}">
									<option value="${rGrade.codeSmall}" selected>${rGrade.nameSmall}</option>
								</c:if>
								<c:if test="${list.roomGrade ne rGrade.nameSmall}">
									<option value="${rGrade.codeSmall}">${rGrade.nameSmall}</option>
								</c:if>
							</c:forEach>
						</select>
					</td>
					<td align="center">
						<select id="roomLevel${st.index}" name="roomLevel${st.index}" style="width: 130px;" onchange="selectRoomLevel(this.value);" disabled="disabled">
							<c:forEach var="rLevel" items="${requestScope.roomLevel}">
								<c:if test="${list.roomLevel eq rLevel.nameSmall}">
									<option value="${rLevel.codeSmall}" selected>${rLevel.nameSmall}</option>
								</c:if>
								<c:if test="${list.roomLevel ne rLevel.nameSmall}">
									<option value="${rLevel.codeSmall}">${rLevel.nameSmall}</option>
								</c:if>
							</c:forEach>
						</select>
					</td>
					<td align="center">
						<select id="roomType${st.index}" name="roomType${st.index}" style="width: 100px;" onchange="selectRoomType(this.value);" disabled="disabled">
							<c:forEach var="rType" items="${requestScope.roomType}">
								<c:if test="${list.roomType eq rType.nameSmall}">
									<option value="${rType.codeSmall}" selected>${rType.nameSmall}</option>
								</c:if>
								<c:if test="${list.roomType ne rType.nameSmall}">
									<option value="${rType.codeSmall}">${rType.nameSmall}</option>
								</c:if>
							</c:forEach>
						</select>
					</td>
					<td align="center">
						<select id="roomView${st.index}" name="roomView${st.index}" style="width: 80px;" onchange="selectRoomView(this.value);" disabled="disabled">
							<c:forEach var="rView" items="${requestScope.roomView}">
								<c:if test="${list.roomView eq rView.nameSmall}">
									<option value="${rView.codeSmall}" selected>${rView.nameSmall}</option>
								</c:if>
								<c:if test="${list.roomView ne rView.nameSmall}">
									<option value="${rView.codeSmall}">${rView.nameSmall}</option>
								</c:if>
							</c:forEach>
						</select>
					</td>
					<td align="center"><input type="text" style='text-align:right' maxlength="7" size="5" id="price${st.index}" name="price${st.index}" value="${list.price }" readonly="readonly" ></td>
					<td align="center">
						<input type="text" value="${list.startDate }" class="startDate" id="startDate${st.index}" name="startDate${st.index}" disabled="disabled" maxlength="10" size="8"></td> 
					<td align="center">
						<input type="text" value="${list.endDate }" class="endDate" id="endDate${st.index}" name="endDate${st.index}" disabled="disabled" maxlength="10" size="8">
					</td>
				</tr>
				</c:forEach>
				<c:if test="${packageInsert}">
				<tr>
					<td class="insertTd" colspan=10 align="left">
					패키지 신규 등록
					</td>
				</tr>
				<tr>
					<td align="center"><input type="radio" id="rdoOption" name="rdoOption" onclick="selectPackage(this.value);" 
					value="${packageInsert}" checked></td>
					<td align="center"><input type="text" maxlength="4" size="3" id="packageNo" name="packageNo" value=""></td>
					<td align="center"><input type="text" maxlength="20" size="15" id="name" name="name" value=""></td>
					<td align="center">
						<select id="roomGrade" name="roomGrade" style="width: 120px;" onchange="selectRoomGrade(this.value);">
							<c:forEach var="rGrade" items="${requestScope.roomGrade}">
								<option value="${rGrade.codeSmall}">${rGrade.nameSmall}</option>
							</c:forEach>
						</select>
					</td>
					<td align="center">
						<select id="roomLevel" name="roomLevel" style="width: 130px;" onchange="selectRoomLevel(this.value);">
							<c:forEach var="rLevel" items="${requestScope.roomLevel}">
								<option value="${rLevel.codeSmall}">${rLevel.nameSmall}</option>
							</c:forEach>
						</select>
					</td>
					<td align="center">
						<select id="roomType" name="roomType" style="width: 100px;" onchange="selectRoomType(this.value);">
							<c:forEach var="rType" items="${requestScope.roomType}">
								<option value="${rType.codeSmall}">${rType.nameSmall}</option>
							</c:forEach>
						</select>
					</td>
					<td align="center">
						<select id="roomView" name="roomView" style="width: 80px;" onchange="selectRoomView(this.value);">
							<c:forEach var="rView" items="${requestScope.roomView}">
								<option value="${rView.codeSmall}">${rView.nameSmall}</option>
							</c:forEach>
						</select>
					</td>
					<td align="center"><input type="text" style='text-align:right' maxlength="7" size="5" id="price" name="price" value=""></td>
					<td align="center">
						<input type="text" value="" class="startDate" id="startDate" name="startDate" maxlength="10" size="8" onchange=checkStartDate()></td> 
					<td align="center">
						<input type="text" value="" class="endDate" id="endDate" name="endDate" maxlength="10" size="8" onchange=checkEndDate()>
					</td>
				</tr>
				</c:if>
			<tr>
				<td colspan=10 align="right">
					<input type="button" value="등록" 
                    	onclick= "insert(5)">
					<input type="button" value="수정" 
                    	onclick= "modify(5)">
                    <input type="button" value="확인" 
                    	onclick= "success(5)">
                    <input type="button" value="삭제"
                    	onclick="deleteCode(5)"> 
				</td>
			</tr>
		
		</table>
		</div>
	</c:if>

	<c:if test="${requestScope.reservation }">
		<div class="bigCode" align="center">
			<br>
			<h2 align=left>예약 관리</h2>
		<table class="bigTable" width="2140px">
			<tr>
				<th width="80px" rowspan=2>선택</th>
				<th width="120px" rowspan=2>회원</th>
				<th width="520px" colspan=5>숙박 정보</th>
				<th width="200px" colspan=2>객실 / 패키지</th>
				<th width="300px" colspan=3>추가 옵션</th>
				<th width="200px" rowspan=2>메모</th>
				<th width="80px" rowspan=2>가격</th>
				<th width="120px" rowspan=2>예약 날짜</th>
				<th width="380px" colspan=3>카드 정보</th>
				<th width="100px" rowspan=2>예약 상태</th>
			</tr>
			<tr>
				<th width="100px">어른 수</th>
				<th width="100px">어린이 수</th>
				<th width="120px">체크인 날짜</th>
				<th width="120px">체크아웃 날짜</th>
				<th width="100px">숙박 일수</th>
				<th width="100px">객실 번호</th>
				<th width="100px">패키지 번호</th>
				<th width="100px">침대 추가</th>
				<th width="100px">어른 조식</th>
				<th width="100px">어린이 조식</th>
				<th width="130px">카드 종류</th>
				<th width="150px">카드 번호</th>
				<th width="100px">카드 만기일</th>
			</tr>
			
				<c:forEach var="list" items="${requestScope.reservationList}" varStatus="st">
				<tr>
					<td align="center"><input type="radio" id="rdoOption" name="rdoOption" onclick="selectReservation(this.value);" 
					value="${st.index}:${list.no}"></td>
					<td align="center"><input type="text" size="8" id="id${st.index}" name="id${st.index}" value="${list.id }" readonly="readonly" ></td>
					<td align="center"><input type="text" style='text-align:right' maxlength="1" size="1" id="adultCnt${st.index}" name="adultCnt${st.index}" value="${list.adultCnt }" readonly="readonly" ></td>
					<td align="center"><input type="text" style='text-align:right' maxlength="1" size="1" id="childCnt${st.index}" name="childCnt${st.index}" value="${list.childCnt }" readonly="readonly" ></td>
					<td align="center">
						<input type="text" value="${list.startDate }" class="startDate" id="startDate${st.index}" name="startDate${st.index}" disabled="disabled" maxlength="10" size="8"></td> 
					<td align="center">
						<input type="text" value="${list.endDate }" class="endDate" id="endDate${st.index}" name="endDate${st.index}" disabled="disabled" maxlength="10" size="8">
					</td>
					<td align="center"><input type="text" maxlength="2" style='text-align:right' size="1" id="dateCnt${st.index}" name="dateCnt${st.index}" value="${list.dateCnt }" readonly="readonly" ></td>
					<td align="center"><input type="text" maxlength="5" size="3" id="roomNo${st.index}" name="roomNo${st.index}" value="${list.roomNo }" readonly="readonly" ></td>
					<td align="center"><input type="text" maxlength="4" size="3" id="packageNo${st.index}" name="packageNo${st.index}" value="${list.packageNo }" readonly="readonly" ></td>
					<td align="center"><input type="text" maxlength="1" style='text-align:center' size="1" id="addBed${st.index}" name="addBed${st.index}" value="${list.strBed }" readonly="readonly" ></td>
					<td align="center"><input type="text" maxlength="1" style='text-align:right' size="1" id="adultBreakfast${st.index}" name="adultBreakfast${st.index}" value="${list.adultBreakfast }" readonly="readonly" ></td>
					<td align="center"><input type="text" maxlength="1" style='text-align:right' size="1" id="childBreakfast${st.index}" name="childBreakfast${st.index}" value="${list.childBreakfast }" readonly="readonly" ></td>
					<td align="center"><input type="text" maxlength="200" size="12" id="memo${st.index}" name="memo${st.index}" value="${list.memo }" readonly="readonly" ></td>
					<td align="center"><input type="text" style='text-align:right' maxlength="8" size="6" id="price${st.index}" name="price${st.index}" value="${list.price }" readonly="readonly" ></td>
					<td align="center">
						<input type="text" value="${list.reservationDate }" class="reservationDate" id="reservationDate${st.index}" name="reservationDate${st.index}" disabled="disabled" maxlength="10" size="8">
					</td>
					<td align="center"><input type="text" maxlength="16" size="13" id="cardType${st.index}" name="cardType${st.index}" value="${list.cardType }" readonly="readonly" ></td>
					<td align="center"><input type="text" maxlength="19" size="15" id="cardNum${st.index}" name="cardNum${st.index}" value="${list.cardNum }" readonly="readonly" ></td>
					<td align="center"><input type="text" maxlength="7" size="5" id="cardEndDate${st.index}" name="cardEndDate${st.index}" value="${list.cardEndDate }" readonly="readonly" ></td>
					<td align="center"><input type="text" maxlength="3" style='text-align:center' size="2" id="status${st.index}" name="status${st.index}" value="${list.status }" readonly="readonly" ></td>
				</tr>
				</c:forEach>
			<tr>
				<td colspan=19 align="center">
					<input type="button" value="체크인" 
                    	onclick= "success(6)">
                    <input type="button" value="삭제"
                    	onclick="deleteCode(6)"> 
				</td>
			</tr>
		
		</table>
		</div>
	</c:if>

	<c:if test="${requestScope.stay }">
		<div class="bigCode" align="center">
			<br>
			<h2 align=left>숙박현황 관리</h2>
		<table class="bigTable" width="2040px">
			<tr>
				<th width="80px" rowspan=2>선택</th>
				<th width="120px" rowspan=2>회원</th>
				<th width="520px" colspan=5>숙박 정보</th>
				<th width="200px" colspan=2>객실 / 패키지</th>
				<th width="300px" colspan=3>추가 옵션</th>
				<th width="200px" rowspan=2>메모</th>
				<th width="80px" rowspan=2>가격</th>
				<th width="120px" rowspan=2>예약 날짜</th>
				<th width="380px" colspan=3>카드 정보</th>
			</tr>
			<tr>
				<th width="100px">어른 수</th>
				<th width="100px">어린이 수</th>
				<th width="120px">체크인 날짜</th>
				<th width="120px">체크아웃 날짜</th>
				<th width="100px">숙박 일수</th>
				<th width="100px">객실 번호</th>
				<th width="100px">패키지 번호</th>
				<th width="100px">침대 추가</th>
				<th width="100px">어른 조식</th>
				<th width="100px">어린이 조식</th>
				<th width="130px">카드 종류</th>
				<th width="150px">카드 번호</th>
				<th width="100px">카드 만기일</th>
			</tr>
			
				<c:forEach var="list" items="${requestScope.stayList}" varStatus="st">
				<tr>
					<td align="center"><input type="radio" id="rdoOption" name="rdoOption" onclick="selectStay(this.value);" 
					value="${st.index}:${list.no}"></td>
					<td align="center"><input type="text" size="8" id="id${st.index}" name="id${st.index}" value="${list.id }" readonly="readonly" ></td>
					<td align="center"><input type="text" style='text-align:right' maxlength="1" size="1" id="adultCnt${st.index}" name="adultCnt${st.index}" value="${list.adultCnt }" readonly="readonly" ></td>
					<td align="center"><input type="text" style='text-align:right' maxlength="1" size="1" id="childCnt${st.index}" name="childCnt${st.index}" value="${list.childCnt }" readonly="readonly" ></td>
					<td align="center">
						<input type="text" value="${list.startDate }" class="startDate" id="startDate${st.index}" name="startDate${st.index}" disabled="disabled" maxlength="10" size="8"></td> 
					<td align="center">
						<input type="text" value="${list.endDate }" class="endDate" id="endDate${st.index}" name="endDate${st.index}" disabled="disabled" maxlength="10" size="8">
					</td>
					<td align="center"><input type="text" maxlength="2" style='text-align:right' size="1" id="dateCnt${st.index}" name="dateCnt${st.index}" value="${list.dateCnt }" readonly="readonly" ></td>
					<td align="center"><input type="text" maxlength="5" size="3" id="roomNo${st.index}" name="roomNo${st.index}" value="${list.roomNo }" readonly="readonly" ></td>
					<td align="center"><input type="text" maxlength="4" size="3" id="packageNo${st.index}" name="packageNo${st.index}" value="${list.packageNo }" readonly="readonly" ></td>
					<td align="center"><input type="text" maxlength="1" style='text-align:center' size="1" id="addBed${st.index}" name="addBed${st.index}" value="${list.strBed }" readonly="readonly" ></td>
					<td align="center"><input type="text" maxlength="1" style='text-align:right' size="1" id="adultBreakfast${st.index}" name="adultBreakfast${st.index}" value="${list.adultBreakfast }" readonly="readonly" ></td>
					<td align="center"><input type="text" maxlength="1" style='text-align:right' size="1" id="childBreakfast${st.index}" name="childBreakfast${st.index}" value="${list.childBreakfast }" readonly="readonly" ></td>
					<td align="center"><input type="text" maxlength="200" size="12" id="memo${st.index}" name="memo${st.index}" value="${list.memo }" readonly="readonly" ></td>
					<td align="center"><input type="text" style='text-align:right' maxlength="8" size="6" id="price${st.index}" name="price${st.index}" value="${list.price }" readonly="readonly" ></td>
					<td align="center">
						<input type="text" value="${list.reservationDate }" class="reservationDate" id="reservationDate${st.index}" name="reservationDate${st.index}" disabled="disabled" maxlength="10" size="8">
					</td>
					<td align="center"><input type="text" maxlength="16" size="13" id="cardType${st.index}" name="cardType${st.index}" value="${list.cardType }" readonly="readonly" ></td>
					<td align="center"><input type="text" maxlength="19" size="15" id="cardNum${st.index}" name="cardNum${st.index}" value="${list.cardNum }" readonly="readonly" ></td>
					<td align="center"><input type="text" maxlength="7" size="5" id="cardEndDate${st.index}" name="cardEndDate${st.index}" value="${list.cardEndDate }" readonly="readonly" ></td>
				</tr>
				</c:forEach>
			<tr>
				<td colspan=19 align="center">
					<input type="button" value="체크아웃" 
                    	onclick= "success(7)">
                    <input type="button" value="삭제"
                    	onclick="deleteCode(7)">
				</td>
			</tr>
		</table>
		</div>
	</c:if>
	
	<c:if test="${requestScope.stayHistory }">
		<div class="bigCode" align="center">
			<br>
			<h2 align=left>숙박기록 관리</h2>
		<table class="bigTable" width="2040px">
			<tr>
				<th width="80px" rowspan=2>선택</th>
				<th width="120px" rowspan=2>회원</th>
				<th width="520px" colspan=5>숙박 정보</th>
				<th width="200px" colspan=2>객실 / 패키지</th>
				<th width="300px" colspan=3>추가 옵션</th>
				<th width="200px" rowspan=2>메모</th>
				<th width="80px" rowspan=2>가격</th>
				<th width="120px" rowspan=2>예약 날짜</th>
				<th width="380px" colspan=3>카드 정보</th>
			</tr>
			<tr>
				<th width="100px">어른 수</th>
				<th width="100px">어린이 수</th>
				<th width="120px">체크인 날짜</th>
				<th width="120px">체크아웃 날짜</th>
				<th width="100px">숙박 일수</th>
				<th width="100px">객실 번호</th>
				<th width="100px">패키지 번호</th>
				<th width="100px">침대 추가</th>
				<th width="100px">어른 조식</th>
				<th width="100px">어린이 조식</th>
				<th width="130px">카드 종류</th>
				<th width="150px">카드 번호</th>
				<th width="100px">카드 만기일</th>
			</tr>
			
				<c:forEach var="list" items="${requestScope.stayHistoryList}" varStatus="st">
				<tr>
					<td align="center"><input type="radio" id="rdoOption" name="rdoOption" onclick="selectStay(this.value);" 
					value="${st.index}:${list.no}"></td>
					<td align="center"><input type="text" size="8" id="id${st.index}" name="id${st.index}" value="${list.id }" readonly="readonly" ></td>
					<td align="center"><input type="text" style='text-align:right' maxlength="1" size="1" id="adultCnt${st.index}" name="adultCnt${st.index}" value="${list.adultCnt }" readonly="readonly" ></td>
					<td align="center"><input type="text" style='text-align:right' maxlength="1" size="1" id="childCnt${st.index}" name="childCnt${st.index}" value="${list.childCnt }" readonly="readonly" ></td>
					<td align="center">
						<input type="text" value="${list.startDate }" class="startDate" id="startDate${st.index}" name="startDate${st.index}" disabled="disabled" maxlength="10" size="8"></td> 
					<td align="center">
						<input type="text" value="${list.endDate }" class="endDate" id="endDate${st.index}" name="endDate${st.index}" disabled="disabled" maxlength="10" size="8">
					</td>
					<td align="center"><input type="text" maxlength="2" style='text-align:right' size="1" id="dateCnt${st.index}" name="dateCnt${st.index}" value="${list.dateCnt }" readonly="readonly" ></td>
					<td align="center"><input type="text" maxlength="5" size="3" id="roomNo${st.index}" name="roomNo${st.index}" value="${list.roomNo }" readonly="readonly" ></td>
					<td align="center"><input type="text" maxlength="4" size="3" id="packageNo${st.index}" name="packageNo${st.index}" value="${list.packageNo }" readonly="readonly" ></td>
					<td align="center"><input type="text" maxlength="1" style='text-align:center' size="1" id="addBed${st.index}" name="addBed${st.index}" value="${list.strBed }" readonly="readonly" ></td>
					<td align="center"><input type="text" maxlength="1" style='text-align:right' size="1" id="adultBreakfast${st.index}" name="adultBreakfast${st.index}" value="${list.adultBreakfast }" readonly="readonly" ></td>
					<td align="center"><input type="text" maxlength="1" style='text-align:right' size="1" id="childBreakfast${st.index}" name="childBreakfast${st.index}" value="${list.childBreakfast }" readonly="readonly" ></td>
					<td align="center"><input type="text" maxlength="200" size="12" id="memo${st.index}" name="memo${st.index}" value="${list.memo }" readonly="readonly" ></td>
					<td align="center"><input type="text" style='text-align:right' maxlength="8" size="6" id="price${st.index}" name="price${st.index}" value="${list.price }" readonly="readonly" ></td>
					<td align="center">
						<input type="text" value="${list.reservationDate }" class="reservationDate" id="reservationDate${st.index}" name="reservationDate${st.index}" disabled="disabled" maxlength="10" size="8">
					</td>
					<td align="center"><input type="text" maxlength="16" size="13" id="cardType${st.index}" name="cardType${st.index}" value="${list.cardType }" readonly="readonly" ></td>
					<td align="center"><input type="text" maxlength="19" size="15" id="cardNum${st.index}" name="cardNum${st.index}" value="${list.cardNum }" readonly="readonly" ></td>
					<td align="center"><input type="text" maxlength="7" size="5" id="cardEndDate${st.index}" name="cardEndDate${st.index}" value="${list.cardEndDate }" readonly="readonly" ></td>
				</tr>
				</c:forEach>
			<tr>
				<td colspan=19 align="center">
					<input type="button" value="체크아웃 취소"
                    	onclick="success(8)">
                    <input type="button" value="삭제"
                    	onclick="deleteCode(8)">
				</td>
			</tr>
		</table>
		</div>
	</c:if>
	
	<c:if test="${requestScope.stayDeleted }">
		<div class="bigCode" align="center">
			<br>
			<h2 align=left>삭제된기록 관리</h2>
		<table class="bigTable" width="2140px">
			<tr>
				<th width="80px" rowspan=2>선택</th>
				<th width="120px" rowspan=2>회원</th>
				<th width="520px" colspan=5>숙박 정보</th>
				<th width="200px" colspan=2>객실 / 패키지</th>
				<th width="300px" colspan=3>추가 옵션</th>
				<th width="200px" rowspan=2>메모</th>
				<th width="80px" rowspan=2>가격</th>
				<th width="120px" rowspan=2>예약 날짜</th>
				<th width="380px" colspan=3>카드 정보</th>
				<th width="100px" rowspan=2>예약 상태</th>
			</tr>
			<tr>
				<th width="100px">어른 수</th>
				<th width="100px">어린이 수</th>
				<th width="120px">체크인 날짜</th>
				<th width="120px">체크아웃 날짜</th>
				<th width="100px">숙박 일수</th>
				<th width="100px">객실 번호</th>
				<th width="100px">패키지 번호</th>
				<th width="100px">침대 추가</th>
				<th width="100px">어른 조식</th>
				<th width="100px">어린이 조식</th>
				<th width="130px">카드 종류</th>
				<th width="150px">카드 번호</th>
				<th width="100px">카드 만기일</th>
			</tr>
			
				<c:forEach var="list" items="${requestScope.stayDeletedList}" varStatus="st">
				<tr>
					<td align="center"><input type="radio" id="rdoOption" name="rdoOption" onclick="selectStay(this.value);" 
					value="${st.index}:${list.no}"></td>
					<td align="center"><input type="text" size="8" id="id${st.index}" name="id${st.index}" value="${list.id }" readonly="readonly" ></td>
					<td align="center"><input type="text" style='text-align:right' maxlength="1" size="1" id="adultCnt${st.index}" name="adultCnt${st.index}" value="${list.adultCnt }" readonly="readonly" ></td>
					<td align="center"><input type="text" style='text-align:right' maxlength="1" size="1" id="childCnt${st.index}" name="childCnt${st.index}" value="${list.childCnt }" readonly="readonly" ></td>
					<td align="center">
						<input type="text" value="${list.startDate }" class="startDate" id="startDate${st.index}" name="startDate${st.index}" disabled="disabled" maxlength="10" size="8"></td> 
					<td align="center">
						<input type="text" value="${list.endDate }" class="endDate" id="endDate${st.index}" name="endDate${st.index}" disabled="disabled" maxlength="10" size="8">
					</td>
					<td align="center"><input type="text" maxlength="2" style='text-align:right' size="1" id="dateCnt${st.index}" name="dateCnt${st.index}" value="${list.dateCnt }" readonly="readonly" ></td>
					<td align="center"><input type="text" maxlength="5" size="3" id="roomNo${st.index}" name="roomNo${st.index}" value="${list.roomNo }" readonly="readonly" ></td>
					<td align="center"><input type="text" maxlength="4" size="3" id="packageNo${st.index}" name="packageNo${st.index}" value="${list.packageNo }" readonly="readonly" ></td>
					<td align="center"><input type="text" maxlength="1" style='text-align:center' size="1" id="addBed${st.index}" name="addBed${st.index}" value="${list.strBed }" readonly="readonly" ></td>
					<td align="center"><input type="text" maxlength="1" style='text-align:right' size="1" id="adultBreakfast${st.index}" name="adultBreakfast${st.index}" value="${list.adultBreakfast }" readonly="readonly" ></td>
					<td align="center"><input type="text" maxlength="1" style='text-align:right' size="1" id="childBreakfast${st.index}" name="childBreakfast${st.index}" value="${list.childBreakfast }" readonly="readonly" ></td>
					<td align="center"><input type="text" maxlength="200" size="12" id="memo${st.index}" name="memo${st.index}" value="${list.memo }" readonly="readonly" ></td>
					<td align="center"><input type="text" style='text-align:right' maxlength="8" size="6" id="price${st.index}" name="price${st.index}" value="${list.price }" readonly="readonly" ></td>
					<td align="center">
						<input type="text" value="${list.reservationDate }" class="reservationDate" id="reservationDate${st.index}" name="reservationDate${st.index}" disabled="disabled" maxlength="10" size="8">
					</td>
					<td align="center"><input type="text" maxlength="16" size="13" id="cardType${st.index}" name="cardType${st.index}" value="${list.cardType }" readonly="readonly" ></td>
					<td align="center"><input type="text" maxlength="19" size="15" id="cardNum${st.index}" name="cardNum${st.index}" value="${list.cardNum }" readonly="readonly" ></td>
					<td align="center"><input type="text" maxlength="7" size="5" id="cardEndDate${st.index}" name="cardEndDate${st.index}" value="${list.cardEndDate }" readonly="readonly" ></td>
					<td align="center"><input type="text" maxlength="3" style='text-align:center' size="2" id="status${st.index}" name="status${st.index}" value="${list.status }" readonly="readonly" ></td>
				</tr>
				</c:forEach>
			<tr>
				<td colspan=19 align="center">
					<input type="button" value="복원" 
                    	onclick= "success(9)">
                    <input type="button" value="완전 삭제"
                    	onclick="deleteCode(9)"> 
				</td>
			</tr>
		
		</table>
		</div>
	</c:if>
</div>
<p style="height:500px;"></p>
<c:import url="/WEB-INF/common/footer.jsp"></c:import>
</center>
</body>
</html>