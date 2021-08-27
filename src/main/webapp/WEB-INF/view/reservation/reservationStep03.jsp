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
input[type=number]{
	
}

#list_dv {
	width: 1200px;
	margin: 0 auto 0 auto;
	padding: 0;
	border: 0;
}
#left_dv {
	float:left;
	width: 65%;
	margin: 0 auto 0 auto;
	padding: 0;
	border: 0;
}

#right_dv {
	float:right;
	width: 35%;
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
    border-bottom: 1px dotted #b2b2b2;
    margin-bottom: 20px;
    padding-bottom: 15px;
    color: #856f56;
    font-size: 15px;
    text-align:left;
}

.contents_dv .rsvInfoList li+li {
    margin-top: 10px;
}

.contents_dv .rsvInfoList span {
    float: right;
    color: #444;
}

.contents_dv .rsvInfoLast {
    margin-bottom: 20px;
    padding-bottom: 15px;
    color: #856f56;
    font-size: 15px;
    text-align:left;
}

.contents_dv .rsvInfoLast li+li {
    margin-top: 10px;
}

.contents_dv .rsvInfoLast span {
    float: right;
    color: #444;
}

.contents_dv .rsvInfoTotal {
    margin-bottom: 20px;
    padding-bottom: 15px;
    color: #000;
    font-size: 20px;
    text-align:left;
}

.contents_dv .rsvInfoTotal span {
    float: right;
    color: #000;
}

.content_dv{
	width:1200px;
}

.optInput select{
	height:40px;
}

.ctnReserve3 {
    background: #fff;
}

.ctnReserve3 .roomUserWrap {

    margin-top: 20px;
    text-align:left;
}

.ctnReserve3 .reserveStep3Box {
    margin: 5px 0;
}

.ctnReserve3 .policyBoxWrap {
    overflow: hidden;
    font-size:13px;
}

.ctnReserve3 .policyBoxWrap .pBox1 {
    float: left;
}

.ctnReserve3 .policyBoxWrap .pBox {
    width: 50%;
}

.ctnReserve3 .policyBoxWrap .pBox2 {
    float: right;
}

.clauseBox {
    margin: 0 0 10px 0;
}

.policyAgreeBox .clauseBox .scBox {
    border: 1px solid #ccc;
    background: #fff;
}

.clauseBox .scBox {
    border: #CCC solid 1px;
    height: 60px;
    overflow: auto;
    overflow-x: hidden;
    padding: 10px;
    margin: 0 0 5px 0;
}

.policyAgreeTit {
    font-size: 14px;
    font-weight: 700;
    color: #444;
    margin-bottom: 11px;
}
input[type="number"]::-webkit-outer-spin-button,
input[type="number"]::-webkit-inner-spin-button {
    -webkit-appearance: none;
    margin: 0;
}
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
	
	$('.roomPrice').text(set_comma(rPrice) + '원(' + date + '박)');
	$('.totalPrice').text(set_comma(totalPrice) + '원');
	$('.tipPrice').text(set_comma(tip) + '원');
	$('.taxPrice').text(set_comma(tax) + '원');
	
});

function selectYear(val){
	document.resvForm.cardYear.value = val;
}

function selectMonth(val){
	document.resvForm.cardMonth.value = val;
}

function selectCard(val){
	document.resvForm.card.value = val;
}



function check() {

	if( document.resvForm.checkAgree3.value == "N" || document.resvForm.checkAgree4.value == "N"){ 
		alert("약관에 모두 동의하세요.")
		return false;
	}
	if( document.resvForm.card.value == "0" || document.resvForm.card.value == "" ||
			document.resvForm.cardYear.value == "0" || document.resvForm.cardYear.value == "" ||
			document.resvForm.cardMonth.value == "0" || document.resvForm.cardMonth.value == "" ){ 
		alert("카드정보를 확인해주세요.")
		return false;
	}
	if( document.resvForm.cardNum1.value == "" || document.resvForm.cardNum1.value.length != 4 ||
			document.resvForm.cardNum2.value == "" || document.resvForm.cardNum2.value.length != 4 ||
			document.resvForm.cardNum3.value == "" || document.resvForm.cardNum3.value.length != 4 ||
			document.resvForm.cardNum4.value == "" || document.resvForm.cardNum4.value.length != 4){ 
		alert("카드정보를 확인해주세요.")
		return false;
	} 
	if(document.resvForm.cardYear.value == "2017"){
		var m = document.resvForm.cardMonth.value;
		var now = new Date();
		var month = now.getMonth()+1;
		if( m < month){
			alert("카드정보를 확인해주세요.")
			return false;
		}
	}
	
}

function moveBack(){
	location.href="reservationStep01";
}

function maxLengthCheck(object){
	if (object.value.length > object.maxLength){
	    object.value = object.value.slice(0, object.maxLength);
	}    
}

function onlyNumber(event){
	event = event || window.event;
	var keyID = (event.which) ? event.which : event.keyCode;
	if ( (keyID >= 48 && keyID <= 57) || (keyID >= 96 && keyID <= 105) || keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 ) 
		return;
	else
		return false;
}
function removeChar(event) {
	event = event || window.event;
	var keyID = (event.which) ? event.which : event.keyCode;
	if ( keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 ) 
		return;
	else
		event.target.value = event.target.value.replace(/[^0-9]/g, "");
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
				<td id="bold">고객 정보 입력</td>
				<td>예약 완료</td>
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
	<input type="hidden" id="addBed" name="addBed" value="${data.addBed }" >
	<input type="hidden" id="adultBreakfast" name="adultBreakfast" value="${data.adultBreakfast }" >
	<input type="hidden" id="childBreakfast" name="childBreakfast" value="${data.childBreakfast}" >
	<input type="hidden" id="name" name="name" value="${data.name}">
	<input type="hidden" id="packageNo" name="packageNo" value="${data.packageNo}" >
	
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
	
	<div id="left_dv">
	<h3 align="left">카드 정보 입력</h3>
	<br><br>
	<div class="optInput" align="left">
		<label>카드 종류</label>
		&nbsp;
		<select id="cardSelect" name="cardSelect" onchange="selectCard(this.value);">
			<option value="0">선택</option>
			<c:forEach var="cType" items="${requestScope.cardType}">
				<option value="${cType.codeSmall}">${cType.nameSmall}</option>
			</c:forEach>
			
			<!-- <option value="AMEX CARD">AMEX CARD</option>
			<option value="BC CARD">BC CARD</option>
			<option value="CITIBANK CARD">CITIBANK CARD</option>
			<option value="DINERS CARD">DINERS CARD</option>
			<option value="HYUNDAI CARD">HYUNDAI CARD</option>
			<option value="JCB CARD">JCB CARD</option>
			<option value="KEB CARD">KEB CARD</option>
			<option value="KOOKMIN CARD">KOOKMIN CARD</option>
			<option value="LOTTE CARD">LOTTE CARD</option>
			<option value="MASTER OVERSEAS">MASTER OVERSEAS</option>
			<option value="SHINHAN CARD">SHINHAN CARD</option>
			<option value="SAMSUNG CARD">SAMSUNG CARD</option>
			<option value="VISA OVERSEAS">VISA OVERSEAS</option>
			<option value="UNION PAY">UNION PAY</option> -->
		</select>
		<br><br>
		<label>카드 번호</label>
		<input type="number" name="cardNum1" size="4" maxlength="4" min="1000" max="9999" oninput="maxLengthCheck(this)"/> -
		<input type="password" name="cardNum2" size="4" maxlength="4" min="1000" max="9999" 
		onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)' style='ime-mode:disabled;'> -
		<input type="password" name="cardNum3" size="4" maxlength="4" min="1000" max="9999" 
		onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)' style='ime-mode:disabled;'> -
		<input type="password" name="cardNum4" size="4" maxlength="4" min="1000" max="9999"
		onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)' style='ime-mode:disabled;'>
		<br><br>
		<label>만기일</label>
		&nbsp;&nbsp;&nbsp;&nbsp;
		<select id="monthSelect" name="monthSelect" onchange="selectMonth(this.value);" style="width:70px">
			<option value="0">월</option>
			<option value="1">1</option>
			<option value="2">2</option>
			<option value="3">3</option>
			<option value="4">4</option>
			<option value="5">5</option>
			<option value="6">6</option>
			<option value="7">7</option>
			<option value="8">8</option>
			<option value="9">9</option>
			<option value="10">10</option>
			<option value="11">11</option>
			<option value="12">12</option>
		</select>	
		&nbsp;
		<select id="yearSelect" name="yearSelect" onchange="selectYear(this.value);" style="width:70px">
			<option value="0">년</option>
			<option value="2027">2027</option>
			<option value="2026">2026</option>
			<option value="2025">2025</option>
			<option value="2024">2024</option>
			<option value="2023">2023</option>
			<option value="2022">2022</option>
			<option value="2021">2021</option>
			<option value="2020">2020</option>
			<option value="2019">2019</option>
			<option value="2018">2018</option>
			<option value="2017">2017</option>
		</select>	
	</div>
	<br>
	<hr>
	<br>
	<div align="left" style="font-size:13px">
		<h3>예약 취소 안내</h3>
		<h4>성수기(5월 ~ 10월, 12월 24일 ~ 31일)</h4><br>
		- 숙박 예정일 7일 전까지는 위약금 없이 취소됩니다.<br>
		- 숙박 예정일 6일 전 ~ 1일 전 18시까지 취소 시, 최초 1박 요금의 20%가 위약금으로 부과됩니다.<br>
		- 숙박 예정일 1일 전 18시 이후 취소하거나 노쇼(No-Show) 시, 최초 1박 요금의 80%가 위약금으로 부과됩니다.<br>
		<h4>비수기(성수기 외 기간)</h4><br>
		- 숙박 예정일 1일 전 18시까지는 위약금 없이 취소됩니다.<br>
		- 숙박 예정일 1일 전 18시 이후 취소하거나 노쇼(No-Show) 시, 최초 1박 요금의 10%가 위약금으로 부과됩니다.<br>
		<br><br>
	</div>
	<hr>
	<br><br>
	<div class="ctnReserve3">
		<div class="roomUserWrap"> <!--이용약관동의 -->
			<div class="reserveStep3Box policyAgreeBox">
				<div class="policyAgreeTit">필수적인 개인정보 수집이용에 동의하십니까?</div>
					<div class="policyBoxWrap">
						<div class="pBox pBox1">
							<div class="clauseBox">
								<div class="scBox">
<p>신라호텔 객실예약과 관련하여 귀사가 아래와 같이 본인의 개인정보를 수집 및 이용하는데 동의합니다.<br>
<br>
&lt;필수적인 개인정보의 수집 ㆍ이용에 관한 사항&gt;<br>
① 수집 이용 항목 | 성명, 국적, 생년월일, 이메일 주소, 연락처, 예약정보, 결제정보<br>
② 수집 이용 목적 | 호텔 예약 및 고객 응대<br>
③ 보유 이용 기간 | 예약일 후 1년<br>
<br>
※위 사항에 대한 동의를 거부할 수 있으나, 이에 대한 동의가 없을 경우 예약 서비스 제공과 관련된 제반 절차 진행이 불가능 할 수 있음을 알려드립니다.</p>
								</div>
								<div class="checkAgreeBox">
									<input type="radio"  id="checkAgree3_Y" name="checkAgree3" value="Y" autocomplete="off">
									<label for="checkAgree3_Y" style="margin-right: 40px">동의함</label>
									<input type="radio"  id="checkAgree3_N" name="checkAgree3" value="N" checked="" autocomplete="off">
									<label for="checkAgree3_N">동의하지 않음</label>
								</div>
							</div>
						</div>
						<div class="pBox pBox2">
							<div class="clauseBox">
								<div class="scBox">
<p>&lt;개인정보 제3자 제공에 대한 동의&gt;<br>
	① 제공받는 자 | (주)신라스테이<br>
	② 제공 목적 | 호텔 예약 및 고객 응대<br>
    ③ 제공하는 항목 | 성명, 국적, 생년월일, 이메일 주소, 연락처, 예약정보, 결제정보<br>
    ④ 제공 기간 | 예약일 후 1년간<br>
    <br>
    ※위 사항에 대한 동의를 거부할 수 있으나, 이에 대한 동의가 없을 경우 신라 리워즈 회원가입 및 서비스 제공이 불가능함을 알려드립니다.</p>
							</div>
							<div class="checkAgreeBox">
								<input type="radio"  id="checkAgree4_Y" name="checkAgree4" value="Y" autocomplete="off">
								<label for="checkAgree4_Y" style="margin-right: 40px">동의함</label>
								<input type="radio"  id="checkAgree4_N" name="checkAgree4" value="N" checked="" autocomplete="off">
								<label for="checkAgree4_N">동의하지 않음</label>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div><!--이용약관동의 //-->
	</div>
	<br>
	<hr>
	<br>
	<input type="button" onclick="moveBack();" value="처음 단계로 이동">&nbsp;&nbsp;
	<input type="submit" value="예약 하기">
	<br><br>
	</div>
	<div id="right_dv">
		<div class="contents_dv">
			<h3 align="left">예약 정보</h3>
			<br>
			<div class="rsvInfoList">
			<ul>
				<li class="first">체크인<span>${data.startDate }</span></li>
				<li>체크아웃<span>${data.endDate }</span></li>
				<li>숙박일수<span>${data.dateCnt }</span></li>
				<li>투숙 인원
					<span>
						성인 : ${data.adultCnt }&nbsp;
						어린이 :  ${data.childCnt }
					</span>
				</li>
				<li>패키지명<span>${data.name}</span></li>
				<li>객실타입<span>${data.roomType}</span></li>
				<li class="last">객실전망<span>${data.roomView}</span></li>
			</ul>
			</div>
			<br>
			<h3 align="left">객실 / 패키지 정보</h3>
			<br>
			<div class="rsvInfoList">
			<ul>
				<li class="first">객실<span>[${data.roomGrade}] ${data.roomLevel}</span></li>
				<li>패키지명<span>${data.name}</span></li>
				<li class="last">객실가격<span><div class="roomPrice"></div></span></li>
			</ul>
			</div>
			
			<h3 align="left">추가 옵션</h3>
			<br>
			<div class="rsvInfoList">
			<ul>
				<li class="first">침대 추가<span><div class="bedPrice"></div></span></li>
				<li>어른 조식 추가<span><div class="adultPrice"></div></span></li>
				<li class="last">어린이 조식 추가<span><div class="childPrice"></div></span></li>
			</ul>
			</div>
			<div class="rsvInfoLast">
			<ul>
				<li class="first">봉사료<span><div class="tipPrice"></div></span></li>
				<li class="last">세금<span><div class="taxPrice"></div></span></li>
			</ul>
			</div>
			<hr>
			<div class="rsvInfoTotal">
			<ul>
				<li class="first"><b>요금합계<span><div class="totalPrice"></div></span></b></li>
			</ul>
			</div>
		</div>
	</div>
<hr>
	
</form>
	</div>
</div>

<p style="height:100px;"></p>
<c:import url="/WEB-INF/common/footer.jsp"></c:import>
</center>
</body>
</html>
