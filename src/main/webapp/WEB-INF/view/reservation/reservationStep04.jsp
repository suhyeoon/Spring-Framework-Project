<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="<%=request.getContextPath()%>/css/common.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/css/reservation_tb.css" rel="stylesheet" type="text/css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<title>고객 정보 입력</title>
<style type="text/css">
		
#list_dv {
	width: 1200px;
	margin: 0 auto 0 auto;
	padding: 0;
	border: 0;
}
#top_dv {
	margin: 0 auto 0 auto;
	padding: 0;
	border: 0;
}

#bottom_dv {
	margin: 0 auto 0 auto;
	padding: 0;
	border: 0;
}

.optTxt{
	float : left;
}

.checker{
	display: inline-block;
	margin-right: 0px;
    position: relative;
    margin-top: -3px;
}

label{
	margin: 0 0 0 0;
    padding: 0px 0 0 0;
}

.optSelectArea {
    float: right;
}

.optSelectArea .optPrice {
    font-size: 18px;
    color: #343434;
    margin-left: 20px;
    display: inline-block;
    min-width: 100px;
    vertical-align: middle;
}

.optSelectArea .optPrice em {
    font-size: 18px;
    display: inline-block;
    margin: 0 3px;
}

.contents_dv {
    position: relative;
    display: inline-block;
    border: 1px solid #a1886f;
    border-top: 5px solid #a1886f;
    padding: 30px 25px;
}

.contents2_dv {
	width:1100px;
    position: relative;
    display: inline-block;
    border: 1px solid #a1886f;
    border-top: 5px solid #a1886f;
    padding: 30px 25px;
}

.option_dv {
    margin-bottom: 20px;
    margin-right: 20px;
    padding-bottom: 15px;
    font-size: 18px;
    text-align: left;
}

.option_dv li+li{
	margin-top: 10px;
}

.option_dv span{
	float: right;
    color: #444;
}

.option_dv em {
    font-size: 18px;
    display: inline-block;
    margin: 0 3px;
}

ul, ol, li, dl, dt, dd {
    list-style: none;
    margin: 0;
    padding: 0;
}

.contents_dv .rsvInfoList {
	width: 300px;
    padding-right: 25px;
    float: left;
    border-right: 1px dotted #b2b2b2;
    margin-bottom: 20px;
    padding-bottom: 15px;
    color: #856f56;
    font-size: 15px;
    height: 250px;
    text-align: left;
}

.contents_dv .rsvInfoList2 {
    width: 400px;
    margin-left: 25px;
    padding-right: 25px;
    float: left;
    border-right: 1px dotted #b2b2b2;
    margin-bottom: 20px;
    padding-bottom: 15px;
    color: #856f56;
    font-size: 15px;
    text-align: left;
    height: 250px;
}

.contents_dv .rsvInfoList3 {
	float: left;
    margin-left: 25px;
    margin-bottom: 20px;
    padding-bottom: 15px;
    color: #856f56;
    font-size: 15px;
    text-align: left;
    width: 300px;
}

.contents_dv li+li {
    margin-top: 10px;
}

.contents_dv span {
    float: right;
    color: #444;
}

.contents_dv b {
    margin-bottom: 20px;
    padding-bottom: 15px;
    color: #000;
    font-size: 20px;
    text-align:left;
}

.contents_dv h3{
	color: #000;
}

.contents_dv b span {
    float: right;
    color: #000;
}

.content_dv{
	width:1200px;
}

	</style>
<script type="text/javascript">
	
$(function(){
	
	var bPrice = document.resvForm.bPrice.value;
	var rPrice = document.resvForm.rPrice.value;
	var adPrice = document.resvForm.adPrice.value;
	var chPrice = document.resvForm.chPrice.value;
	var totalPrice = document.resvForm.price.value;
	var tip = document.resvForm.tiPrice.value;
	var tax = document.resvForm.taPrice.value;
	var date = document.resvForm.dateCnt.value;
	
	if(bPrice==0)
		$('.bedPrice').text("");
	else
		$('.bedPrice').text(set_comma(bPrice) + '원');
	
	if(adPrice == 0)
		$('.adultPrice').text("");
	else
		$('.adultPrice').text(set_comma(adPrice) + '원');
	
	if(chPrice == 0)
		$('.childPrice').text("");
	else
		$('.childPrice').text(set_comma(chPrice) + '원');
	
	$('.roomPrice').text(set_comma(rPrice) + '원');
	$('.totalPrice').text(set_comma(totalPrice) + '원');
	$('.tipPrice').text(set_comma(tip) + '원');
	$('.taxPrice').text(set_comma(tax) + '원');
	
});

	
	
	function moveMain(){
		location.href="main.jsp";
	}

	function moveReservation(){
		location.href="info_reservation";
	}
	
	function set_comma(n){
		   var reg=/(^[+-]?\d+)(\d{3})/;
		   n+='';
		   while(reg.test(n))
		   n=n.replace(reg,'$1'+','+'$2');
		   return n;
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
				<td>날짜 & 인원 & 객실 선택</td>
				<td>옵션 선택</td>
				<td>고객 정보 입력</td>
				<td id="bold">예약 완료</td>
			</tr>
		</table>
	</div>
<br><br>
	 <div id="list_dv">
<form name="resvForm" action="reservationStep04" method="post" onsubmit="return check()">
	<input type="hidden" id="adultCnt" name="adultCnt" value="${data.adultCnt }" >
	<input type="hidden" id="childCnt" name="childCnt" value="${data.childCnt }" >
	<input type="hidden" id="startDate" name="startDate" value="${data.startDate }" >
	<input type="hidden" id="endDate" name="endDate" value="${data.endDate }" >
	<input type="hidden" id="dateCnt" name="dateCnt" value="${data.dateCnt }" >
	<input type="hidden" id="price" name="price" value="${data.price }" >
	<input type="hidden" id="roomGrade" name="roomGrade" value="${data.roomGrade }" >
	<input type="hidden" id="roomLevel" name="roomLevel" value="${data.roomLevel }" >
	<input type="hidden" id="roomType" name="roomType" value="${data.roomType }" >
	<input type="hidden" id="roomView" name="roomView" value="${data.roomView }" >
	<input type="hidden" id="adultBreakfast" name="adultBreakfast" value="${data.adultBreakfast }" >
	<input type="hidden" id="childBreakfast" name="childBreakfast" value="${data.childBreakfast}" >
	<input type="hidden" id="name" name="name" value="${data.name}">
	<input type="hidden" id="packageNo" name="packageNo" value="" >
	
	<input type="hidden" id="rPrice" name="rPrice" value="${rPrice }" >
	<input type="hidden" id="adPrice" name="adPrice" value="${adPrice }" >
	<input type="hidden" id="chPrice" name="chPrice" value="${chPrice }" >
	<input type="hidden" id="bPrice" name="bPrice" value="${bPrice }" >
	<input type="hidden" id="tiPrice" name="tiPrice" value="${tiPrice }" >
	<input type="hidden" id="taPrice" name="taPrice" value="${taPrice }" >
	
	<input type="hidden" id="card" name="card" value="" >
	<input type="hidden" id="cardMonth" name="cardMonth" value="" >
	<input type="hidden" id="cardYear" name="cardYear" value="" >
	<input type="hidden" id="memo" name="memo" value="${data.memo }" >
	<input type="hidden" id="packageNo" name="packageNo" value="" >
	
	<div id="top_dv">
		<div class="contents2_dv" align="left">
		<br>
			<h3>${authUser } 회원님 감사합니다.</h3>
			<h2>예약이 완료되었습니다.</h2>
			<h3>현재 미결제 상태이며, 체크인시 결제가 진행됩니다.</h3>
		</div>
	</div>
	<br>
	<div id="bottom_dv">
		<div class="contents_dv">
			
			<div class="rsvInfoList">
			<h3 align="left">날짜 / 투숙인원</h3>
			<ul>
				<li class="first">체크인<span>${data.startDate }</span></li>
				<li>체크아웃<span>${data.endDate }</span></li>
				<li>숙박일수<span>${data.dateCnt }</span></li>
				<li class="last">투숙 인원
					<span>
						성인 : ${data.adultCnt }&nbsp;
						어린이 :  ${data.childCnt }
					</span>
				</li>
			</ul>
			</div>
			<div class="rsvInfoList2">
			<h3 align="left">객실 / 패키지</h3>
			<ul>
				<li class="first">패키지명<span>${data.name}</span></li>
				<li>객실<span>[${data.roomGrade}] ${data.roomLevel}</span></li>
				<li>객실타입<span>${data.roomType}</span></li>
				<li>객실전망<span>${data.roomView}</span></li>
				<li>객실가격<span><div class="roomPrice"></div></span></li>
				<li>침대 추가<span><div class="bedPrice"></div></span></li>
				<li>어른 조식 추가<span><div class="adultPrice"></div></span></li>
				<li class="last">어린이 조식 추가<span><div class="childPrice"></div></span></li>
			</ul>
			</div>
			<div class="rsvInfoList3">
			<br><br>
			<ul>
				<li class="first">봉사료<span><div class="tipPrice"></div></span></li>
				<li class="last">세금<span><div class="taxPrice"></div></span></li>
			</ul>
			<br><br><br><br><br><br><br><br>
			<ul>
				<li class="first"><b>요금합계<span><div class="totalPrice"></div></span></b></li>
			</ul>
			</div>
		</div>
		<br>
		<div class="contents2_dv" align="left">
			※ 10% service charge and 11% Tax Included.<br>
			※ 예약한 내용 확인 및 취소는 My page에서 가능합니다.<br>
			※ 현재 미결제 상태이며, 체크인시 결제가 진행됩니다.<br>
		</div>
	</div>
	<br>
	<input type="button" onclick="moveMain();" value="메인 화면으로 이동">&nbsp;&nbsp;
	<input type="button" onclick="moveReservation();" value="예약 정보 화면으로 이동">
	<br>
</form>
	</div>
</div>

<p style="height:100px;"></p>
<c:import url="/WEB-INF/common/footer.jsp"></c:import>
</center>
</body>
</html>
