<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="<%=request.getContextPath()%>/css/common.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/css/reservation_tb.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<title>날짜 & 인원 & 객실 선택</title>
<style type="text/css">
		
#list_dv {
	width: 1200px;
	margin: 0 auto 0 auto;
	padding: 0;
	border: 0;
}

.content_dv{
	width: 1200px;
}

.bList {
	width: 100%;
	margin: 30px auto;
	text-align: center;
	border-top: 1px solid #ccbd8f;
	margin-top: 30px;
}

.bList th{
    border-bottom: 1px solid #e5e4e1;
    border-right: 1px solid #e5e4e1; 
	color: #666;
	font-weight: bold;
	padding: 10px;
	text-align: center;
	background: #f0efeb;
}

.bList .price {
	text-align: right;
	width: 30%;
}

.bList .link {
	width: 15%;
}

.bList .name {
	text-align: left;
	width: 55%;
}

.bList td {
	border-bottom: 1px solid #e5e4e1;
	border-right: 1px solid #e5e4e1;
	height: 25px;
	padding: 5px;
	color: #666;
}
	</style>
<script type="text/javascript">

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
  $( "#startDate" ).datepicker({
    showOtherMonths: true,
    selectOtherMonths: true,
    dateFormat: "yy-mm-dd", // 날짜 포맷 설정
    showAnim: "drop"
  });
} );



$( function() {
	$( "#endDate" ).datepicker({
	   showOtherMonths: true,
	   selectOtherMonths: true,
	   dateFormat: "yy-mm-dd", // 날짜 포맷 설정
	   showAnim: "drop"
	 });
});

$(function(){
	var adult = document.resvForm.adultCnt.value;
	var child = document.resvForm.childCnt.value;
	
	if(adult != "" && adult != null)
		document.resvForm.adultSelect.value = adult;
	else
		document.resvForm.adultCnt.value = 0;
	
	if(child != "" && child != null)
		document.resvForm.childSelect.value = child;
	else
		document.resvForm.childCnt.value = 0;
	
});
	

function checkStartDate(){
	  var sDate = document.getElementById("startDate").value;
	  
	  var arr = sDate.split('-');
	  var start = new Date(arr[0],arr[1]-1,arr[2]);
	  var now = new Date();

	  var diffDate = start - now;
	  var result = Math.ceil(diffDate / ( 60 * 1000 * 60 * 24));
	  
	  if(result < 0){
		  alert("이전 날짜는 체크 인 날짜로 선택할 수 없습니다.");  
		  document.getElementById("startDate").value = "";
		  document.getElementById("endDate").value = "";
		  document.getElementById("dateCnt").value = "";
	  }
	  else{
		  document.resvForm.startDate.value = sDate;
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
		  alert("체크 인 날짜를 먼저 선택해주세요.");
		  document.getElementById("endDate").value = "";
		  document.getElementById("dateCnt").value = "";
	  }
	  
	  if(result <= 0){
		  alert("체크 인 날짜 또는 이전 날짜로는 체크 아웃 날짜로 선택할 수 없습니다.");  
		  document.getElementById("endDate").value = "";
		  document.getElementById("dateCnt").value = "";
	  }
	  else if(result > 29){
		  alert("숙박 일수는 30일이 최대입니다.");  
		  document.getElementById("endDate").value = "";
		  document.getElementById("dateCnt").value = "";
	  }
	  else{
		  document.resvForm.endDate.value = eDate;
		  document.resvForm.dateCnt.value = result;
	  }  
}

function selectAdult(val){
	document.resvForm.adultCnt.value = val;
	var adult = document.resvForm.adultCnt.value;
	var child = document.resvForm.childCnt.value;
	if(parseInt(adult) + parseInt(child) > 4){
		alert("성인과 어린이 수의 합은 4명을 초과할 수 없습니다.");
		document.resvForm.adultSelect.value = 0;
		document.resvForm.adultCnt.value = 0;
	}
}

function selectChild(val){
	document.resvForm.childCnt.value = val;
	var adult = document.resvForm.adultCnt.value;
	var child = document.resvForm.childCnt.value;
	if(parseInt(adult) + parseInt(child) > 4){
		alert("성인과 어린이 수의 합은 4명을 초과할 수 없습니다.");
		document.resvForm.childSelect.value = 0;
		document.resvForm.childCnt.value = 0;
	}
}

function check() {
	
	if( document.resvForm.childCnt.value == "" ){ 
		document.resvForm.childCnt.value = "0";
	}
	
	if( document.resvForm.adultCnt.value == "" ){ 
		document.resvForm.adultCnt.value = "0";
	}

	if( document.resvForm.startDate.value == "" || document.resvForm.endDate.value == ""){ 
		alert("체크인, 체크아웃 날짜를 모두 선택해주세요.")
		return false;
	}
	if( document.resvForm.childCnt.value == "0" && document.resvForm.adultCnt.value == "0"){ 
		alert("숙박 인원은 최소 1명 선택해주세요.")
		return false;
	}
	
}
	
</script>
</head>
<body>
<center>
<c:import url="/WEB-INF/common/top.jsp"></c:import>
<c:import url="/WEB-INF/common/menu.jsp"></c:import>
<br><br>
<h2>Seven Star 객실 예약</h2>
<div class="content_dv">
	<div>
		<table id="resv_tb">
			<tr>
				<td id="bold">날짜 & 인원 & 객실 선택</td>
				<td>옵션 선택</td>
				<td>고객 정보 입력</td>
				<td>예약 완료</td>
			</tr>
		</table>
	</div>
<br><br>
<form name="resvForm" action="search" method="post" onsubmit="return check()">
	<input type="hidden" id="roomCnt" name="roomCnt" value="1" >
	<input type="hidden" id="adultCnt" name="adultCnt" value="${data.adultCnt }" >
	<input type="hidden" id="childCnt" name="childCnt" value="${data.childCnt }" >
<%-- <input type="hidden" id="startDate" name="startDate" value="${data.startDate }" >
<input type="hidden" id="endDate" name="endDate" value="${data.endDate }" > --%>
	<input type="hidden" id="dateCnt" name="dateCnt" value="${data.dateCnt }" >
	<div>
		<label class="date1">체크인</label> 
		<input type="text" value="${data.startDate }" id="startDate" onchange="checkStartDate()"
			name="startDate" maxlength="10"> 
		&nbsp;&nbsp;
		<label class="date2">체크아웃</label> 
		<input type="text" value="${data.endDate }" id="endDate" onchange="checkEndDate();"
			name="endDate" maxlength="10">
		&nbsp;&nbsp;&nbsp;
		<label>성인</label>
									
		<select id="adultSelect" name="adultSelect" onchange="selectAdult(this.value);">
			<option value="0">선택</option>
			<option value="1">1</option>
			<option value="2">2</option>
			<option value="3">3</option>
		</select>
		&nbsp;&nbsp;
		<label>어린이</label>		
		<select id="childSelect" name="childSelect" onchange="selectChild(this.value);">
			<option value="0">선택</option>
			<option value="1">1</option>
			<option value="2">2</option>
			<option value="3">3</option>
			<option value="4">4</option>
		</select>
		&nbsp;&nbsp;
		<input type="submit" value="검색">
	</div>
<br>
<br>
<hr>
	<div id="list_dv">
		 <c:if test="${requestScope.room.size()==0 || requestScope.room eq null}">
	<c:if test="${requestScope.package2.size()==0 || requestScope.package2 eq null}">
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
		예약을 원하시는 날짜, 인원을 선택 후 검색을 눌러주세요.
	<br>
		인원은 객실 1개를 기준으로 선택하시고 1개의 객실당 성인과 어린이의 수는 4명까지만 가능합니다.
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<hr>
	</c:if>
	</c:if>
	
	<c:if test="${requestScope.package2.size()>0}">
		<h3 align="left">예약 가능한 패키지</h3>
	</c:if>
		<table class="bList" width="800px">
		<c:if test="${requestScope.package2.size()>0}">
		<tr>
			<th class = "name">패키지 리스트</th>
			<th class = "price">가격(1박)</th>
			<th class = "link">상세보기</th>
		</tr>
		</c:if>
			<c:forEach var="packageList" items="${requestScope.package2}">
		<tr>
			<td align="left">
				<B>${packageList.name }</B>&nbsp;&nbsp;[${packageList.roomGrade}] ${packageList.roomLevel}
			</td>
			<td align="right">${packageList.sPrice}~ 원</td>
			<td>
				<a href="reservationStep02?rg=${packageList.roomGrade}&rl=${packageList.roomLevel}
				&gubun=package&startDate=${data.startDate}&endDate=${data.endDate}
				&dateCnt=${data.dateCnt}&adultCnt=${data.adultCnt}&childCnt=${data.childCnt}
				&name=${packageList.name}">
					예약
				</a>
			</td>
		</tr>
			</c:forEach>
	</table>
	
	<c:if test="${requestScope.room.size()>0}">
		<h3 align="left">예약 가능한 객실</h3>
	</c:if>
		<table class="bList" width="800px">
		<c:if test="${requestScope.room.size()>0}">
		<tr>
			<th class = "name">객실 리스트</th>
			<th class = "price">가격(1박)</th>
			<th class = "link">상세보기</th>
		</tr>
		</c:if>
			<c:forEach var="roomList" items="${requestScope.room}">
		<tr>
			<td align="left">
				[${roomList.roomGrade}] ${roomList.roomLevel}
			</td>
			<td align="right">${roomList.sPrice}~ 원</td>
			<td>
				<a href="reservationStep02?rg=${roomList.roomGrade}&rl=${roomList.roomLevel}
				&gubun=room&startDate=${data.startDate}&endDate=${data.endDate}
				&dateCnt=${data.dateCnt}&adultCnt=${data.adultCnt}&childCnt=${data.childCnt}">
					예약
				</a>
			</td>
		</tr>
			</c:forEach>
	</table>
	</div>
</form>
</div>
<p style="height:100px;"></p>
<c:import url="/WEB-INF/common/footer.jsp"></c:import>
</center>
</body>
</html>
