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
<title>옵션 선택</title>
<style type="text/css">
		
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

.hr2 {
	width: 100%;
}

.bList td {
	border-bottom: 1px solid #e5e4e1;
	border-right: 1px solid #e5e4e1;
	height: 25px;
	padding: 5px;
	color: #666;
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
	width:70%;
}

	</style>
<script type="text/javascript">

$(function(){
	var adult = document.resvForm.adultCnt.value;
	var child = document.resvForm.childCnt.value;
	
	for(var i = 0 ; i < adult ; i++){
		var idx = document.resvForm.adultSelect.length;
		var newOpt = new Option(i+1,i+1);
		document.resvForm.adultSelect.options[idx] = newOpt;
	}
	
	for(var i = 0 ; i < child ; i++){
		var idx = document.resvForm.childSelect.length;
		var newOpt = new Option(i+1,i+1);
		document.resvForm.childSelect.options[idx] = newOpt;
	}
});

function selectAdult(val){
	document.resvForm.adultBreakfast.value = val;
	var adult = document.resvForm.adultBreakfast.value;
	var date = document.resvForm.dateCnt.value;
	var adultPrice = parseInt(adult) * parseInt(date) * 32000;
	
	document.resvForm.adPrice.value = adultPrice;
	
	total();
}

function selectChild(val){
	document.resvForm.childBreakfast.value = val;
	var child = document.resvForm.childBreakfast.value;
	var date = document.resvForm.dateCnt.value;
	var childPrice = parseInt(child) * parseInt(date) * 23000;
	
	document.resvForm.chPrice.value = childPrice;
	
	total();
}

function clickBed(){
	var chk = document.resvForm.chkBed.checked;
	var price = document.resvForm.price.value;
	var date = document.resvForm.dateCnt.value;
	var bedPrice = 40000 * parseInt(date);
	if(chk){
		document.resvForm.addBed.value = 1;
		document.resvForm.bPrice.value = bedPrice;
	}
	else{
		document.resvForm.addBed.value = 0;
		document.resvForm.bPrice.value = 0;
	}
	
	total();
}

function clickAdult(){
	var chk = document.resvForm.chkAdult.checked;
	if(chk){
		document.resvForm.adultSelect.disabled = false;
		
	}else{
		document.resvForm.adultBreakfast.value = 0;
		document.resvForm.adultSelect.value = 0;
		document.resvForm.adultSelect.disabled = true;
		
		document.resvForm.adPrice.value = 0;
		
		total();
	}
}

function clickChild(){
	var chk = document.resvForm.chkChild.checked;
	if(chk){
		document.resvForm.childSelect.disabled = false;
		
	}else{
		document.resvForm.childBreakfast.value = 0;
		document.resvForm.childSelect.value = 0;
		document.resvForm.childSelect.disabled = true;
		
		document.resvForm.chPrice.value = 0;
		
		total();
	}
}

function selectType(val){
	var addr = val.split(':');
	var type = addr[0];
	var view = addr[1];
	var packageNo = addr[3];
	var date = document.resvForm.dateCnt.value;
	var roomPrice = parseInt(addr[2]) * parseInt(date);
	document.resvForm.packageNo.value = packageNo;
	document.resvForm.rPrice.value = roomPrice;
	document.resvForm.roomType.value = type;
	document.resvForm.roomView.value = view;
	$('.dRoomType').text(type);
	$('.dRoomView').text(view);
	
	total();
}

function total(){
	var date = document.resvForm.dateCnt.value;
	var bPrice = document.resvForm.bPrice.value;
	var rPrice = document.resvForm.rPrice.value;
	var adPrice = document.resvForm.adPrice.value;
	var chPrice = document.resvForm.chPrice.value;
	
	var total = parseInt(bPrice) + parseInt(rPrice) + parseInt(adPrice) + parseInt(chPrice);
	var tip = parseInt(total) / 10 ;
	var tax = parseInt(total) / 100 * 11;
	tax = Math.round(tax);
	var totalPrice = parseInt(total) + parseInt(tip) + parseInt(tax);
	
	document.resvForm.price.value = totalPrice;
	document.resvForm.tiPrice.value = tip;
	document.resvForm.taPrice.value = tax;
	
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
}

function check() {
	
	if( document.resvForm.rPrice.value == "" || document.resvForm.rPrice.value == "0" ||
			document.resvForm.roomType.value == "" || document.resvForm.roomView.value == "0" ||
			document.resvForm.price.value == ""){ 
		alert("기본옵션을 선택해주세요.")
		return false;
	}
	
}

function set_comma(n){
	   var reg=/(^[+-]?\d+)(\d{3})/;
	   n+='';
	   while(reg.test(n))
	   n=n.replace(reg,'$1'+','+'$2');
	   return n;
	}	

function moveBack(){
	location.href="reservationStep01";
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
				<td id="bold">옵션 선택</td>
				<td>고객 정보 입력</td>
				<td>예약 완료</td>
			</tr>
		</table>
	</div>
<br><br>
	 <div id="list_dv">
<form name="resvForm" action="reservationStep03" method="post" onsubmit="return check()">
	<input type="hidden" id="adultCnt" name="adultCnt" value="${param.adultCnt }" >
	<input type="hidden" id="childCnt" name="childCnt" value="${param.childCnt }" >
	<input type="hidden" id="startDate" name="startDate" value="${param.startDate }" >
	<input type="hidden" id="endDate" name="endDate" value="${param.endDate }" >
	<input type="hidden" id="dateCnt" name="dateCnt" value="${param.dateCnt }" >
	<input type="hidden" id="price" name="price" value="" >
	<input type="hidden" id="roomGrade" name="roomGrade" value="${param.rg }" >
	<input type="hidden" id="roomLevel" name="roomLevel" value="${param.rl }" >
	<input type="hidden" id="roomType" name="roomType" value="" >
	<input type="hidden" id="roomView" name="roomView" value="" >
	<input type="hidden" id="addBed" name="addBed" value="0" >
	<input type="hidden" id="adultBreakfast" name="adultBreakfast" value="0" >
	<input type="hidden" id="childBreakfast" name="childBreakfast" value="0" >
	<input type="hidden" id="name" name="name" value="${param.name}" >
	<input type="hidden" id="packageNo" name="packageNo" value="" >
	
	<input type="hidden" id="rPrice" name="rPrice" value="0" >
	<input type="hidden" id="adPrice" name="adPrice" value="0" >
	<input type="hidden" id="chPrice" name="chPrice" value="0" >
	<input type="hidden" id="bPrice" name="bPrice" value="0" >
	<input type="hidden" id="tiPrice" name="tiPrice" value="0" >
	<input type="hidden" id="taPrice" name="taPrice" value="0" >
	<input type="hidden" id="toPrice" name="toPrice" value="0" >
	
	
	<div id="left_dv">
	<h3 align="left">기본 옵션 선택</h3>
	<div class="option_dv">
		<ul>
			<c:forEach var="list" items="${requestScope.data}">
			<li>
				<input type="radio" id="rdoOption" name="rdoOption" 
					onclick="selectType(this.value);" 
					value="${list.roomType}:${list.roomView}:${list.price}:${list.packageNo}">
				${list.roomType} / ${list.roomView}
				<span><em>${list.sPrice }</em>&nbsp;원</span>
					
			</li>
			</c:forEach>
		</ul>
	</div>
	<hr class="hr2">
	<div>
		<h3 align="left">추가 옵션 선택</h3>
		<span class="optTxt">
			<div class="checker">
				<span class="checked">
					<input type="checkbox" id="chkBed" name="chkBed" onclick="clickBed();">
				</span>
			</div>
			<label>싱글 침대 추가</label>
		</span>
		<div class="optSelectArea">
			<span class="optPrice">
				<em>40,000</em>&nbsp;원
			</span> 
		</div>
		<br><br>
		<span class="optTxt">
			<div class="checker">
				<span class="checked">
					<input type="checkbox" id="chkAdult" name="chkAdult" onclick="clickAdult();">
				</span>
			</div>
			<label>성인 조식 추가</label>
		</span>
		<div class="optSelectArea">
		<select id="adultSelect" name="adultSelect" onchange="selectAdult(this.value);" disabled="disabled">
			<option value="0">선택</option>
		</select>
			<span class="optPrice">
				<em>32,000</em>&nbsp;원
			</span> 
		</div>
		<br><br>
		<span class="optTxt">
			<div class="checker">
				<span class="checked">
					<input type="checkbox" id="chkChild" name="chkChild" onclick="clickChild();">
				</span>
			</div>
			<label>어린이 조식 추가</label>
		</span>
		<div class="optSelectArea">
		<select id="childSelect" name="childSelect" onchange="selectChild(this.value);" disabled="disabled">
			<option value="0">선택</option>
		</select>
			<span class="optPrice">
				<em>23,000</em>&nbsp;원
			</span> 
		</div>
	</div>
	<br><br>
	<hr class="hr2">
	<div align="left">
		<h3 align="left">유의 사항</h3>
		2인 1실 기준<br>
		37개월 이상 ~ 성인 동반 시 추가 요금이 적용됩니다.<br>
		37개월 미만의 유아 동반 시 추가 인원 요금 및 조식은 무료입니다.<br>
		본 홈페이지 요금은 할인 적용된 요금이며, 중복 할인은 적용되지 않습니다.<br>
	</div>
	<hr class="hr2">
	<div align="left">
		<h3 align="left">추가 요청 사항</h3>
		<textarea name="memo" id="memo" cols="90" rows="10"></textarea>
	</div>
	<br><br><br><br>
	<hr class="hr2">
	<br>
	<input type="button" onclick="moveBack();" value="이전 단계로 이동">&nbsp;&nbsp;
	<input type="submit" value="다음 단계로 이동">
	<br><br>
	</div>
	<div id="right_dv">
		<div class="contents_dv">
			<h3 align="left">예약 정보</h3>
			<br>
			<div class="rsvInfoList">
			<ul>
				<li class="first">체크인<span>${param.startDate }</span></li>
				<li>체크아웃<span>${param.endDate }</span></li>
				<li>숙박일수<span>${param.dateCnt }</span></li>
				<li>투숙 인원
					<span>
						성인 : ${param.adultCnt }&nbsp;
						어린이 :  ${param.childCnt }
					</span>
				</li>
				<li>패키지명<span>${param.name}</span></li>
				<li>객실타입<span><div class="dRoomType"></div></span></li>
				<li class="last">객실전망<span><div class="dRoomView"></div></span></li>
			</ul>
			</div>
			<br>
			<h3 align="left">객실 / 패키지 정보</h3>
			<br>
			<div class="rsvInfoList">
			<ul>
				<li class="first">객실<span>[${param.rg}] ${param.rl}</span></li>
				<li>패키지명<span>${param.name}</span></li>
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
			<hr class="hr2">
			<div class="rsvInfoTotal">
			<ul>
				<li class="first"><b>요금합계<span><div class="totalPrice"></div></span></b></li>
			</ul>
			</div>
		</div>
	</div>
<br>
<br>
<hr class="hr2">
	
</form>
	</div>
</div>
<p style="height:100px;"></p>
<c:import url="/WEB-INF/common/footer.jsp"></c:import>
</center>
</body>
</html>
