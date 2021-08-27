<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="<%=request.getContextPath()%>/css/common.css" rel="stylesheet" type="text/css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<style type="text/css">
#wrap {
	width: 800px;
	margin: 0 auto 0 auto;
	padding: 0;
	border: 0;
}

#topForm {
	text-align: right;
}

#board, #pageForm, #searchForm {
	text-align: center;
}

.tab_content {
	padding: 5%;
	padding-top: 2%;
	width: 100%;
}

.tab_content td, .tab_content th {
	font-size: 15px;
}

.bList {
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

.bList .index, .bList .read {
	width: 10%;
}

.bList .title {
	text-align: left;
	padding-left: 20px;
}

.bList .date, .bList .writer {
	width: 14%;
}

.index {
	background: #f0efeb;
	border-bottom: 1px solid #e5e4e1;
}

.bList td {
	border-bottom: 1px solid #e5e4e1;
	border-right: 1px solid #e5e4e1;
	height: 25px;
	padding: 5px;
	color: #666;
}
</style>
<script>
	
$(function(){
	
	var adult = document.cancelForm.adultBreakfast.value;
	var child = document.cancelForm.childBreakfast.value;
	var price = document.cancelForm.price.value;
	var rPrice = document.cancelForm.rPrice.value;
	var date = document.cancelForm.dateCnt.value;
	var addBed = document.cancelForm.addBed.value;
	
	var bPrice = "";
	
	rPrice = rPrice * date;
	
	if(addBed=="true"){
		bPrice = date * 40000;
	}
	else
		bPrice = 0;
	
	var adPrice = adult * date * 32000; 
	var chPrice = child * date * 23000; 
		
	var total = parseInt(bPrice) + parseInt(rPrice) + parseInt(adPrice) + parseInt(chPrice);
	var tip = parseInt(total) / 10 ;
	var tax = parseInt(total) / 100 * 11;
	
	tip = parseInt(tip) + parseInt(tax);
	
	total = parseInt(total) + parseInt(tip);
	
	
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
	$('.totalPrice').text(set_comma(price) + '원');
	$('.tipPrice').text(set_comma(tip) + '원');
	
});

	function moveMain(){
		location.href="main.jsp";
	}
	
	function moveBack(){
		location.href="info_reservation";
	}
	
	function reservationCancel(no){
    	window.name="parentForm";
    	window.open("reservationCancel?no="+no,"delForm","width=400, height=200, resizable=no,scrollbars=no");
    }
	
	function set_comma(n){
		   var reg=/(^[+-]?\d+)(\d{3})/;
		   n+='';
		   while(reg.test(n))
		   n=n.replace(reg,'$1'+','+'$2');
		   return n;
		}	
</script>
<title>예약정보 상세보기</title>
</head>
<body>
<center>
<c:import url="/WEB-INF/common/top.jsp"></c:import>
<c:import url="/WEB-INF/common/menu.jsp"></c:import>
<p style="height:50px;"></p>

<form method="post" action="reservationCancel" name="cancelForm" onsubmit="return false">
	<input type="hidden" name="no" value="${data.no}">

	<input type="hidden" id="dateCnt" name="dateCnt" value="${data.dateCnt }" >
	<input type="hidden" id="price" name="price" value="${data.price }" >
	<input type="hidden" id="rPrice" name="rPrice" value="${price }" >
	<input type="hidden" id="addBed" name="addBed" value="${data.addBed }" >
	<input type="hidden" id="adultBreakfast" name="adultBreakfast" value="${data.adultBreakfast }" >
	<input type="hidden" id="childBreakfast" name="childBreakfast" value="${data.childBreakfast}" >
	


<h1>◎ 예약 정보 상세 확인</h1>
<table style="width:1200px;  margin:0 auto; padding:0; color:#101010;overflow:hidden;border-collapse:collapse;" >
<tr>
	<td>
		<table style="float:left;width:1200px;margin:0;color:#333;border-collapse:collapse;*border-top:#cdcbbe solid 1px; font-size:18px;">
				<colgroup><col style="width:114px"><col style="width:217px"><col style="width:114px"><col style="width:192px"></colgroup>
				<tbody>
				<tr style="border-top:#cdcbbe solid 2px;">
					<th colspan="1" rowspan="1" scope="row" style="border:none; padding:3px 14px; line-height:27px; border-bottom:#eceae1 solid 1px; border-right:#eceae1 solid 1px; color:#333333;font-weight:bold;color:#666; background:#f6f4eb;text-align:left;">등록일자</th>
					<td style="border:none; padding:3px 14px; line-height:27px; border-bottom:#eceae1 solid 1px; color:#333333;background:#FFF; color:#1b1b1b;text-align:left;">
						${data.reservationDate }
					</td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<th colspan="1" rowspan="1" scope="row" style="border:none; padding:3px 14px; line-height:27px; border-bottom:#eceae1 solid 1px; border-right:#eceae1 solid 1px; color:#333333;font-weight:bold;color:#666; background:#f6f4eb;text-align:left;">투숙인원</th>
					<td style="border:none; padding:3px 14px; line-height:27px; border-bottom:#eceae1 solid 1px; color:#333333;background:#FFF; color:#1b1b1b;text-align:left;">
						성인:${data.adultCnt }, 어린이:${data.childCnt }
					</td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<th colspan="1" rowspan="1" scope="row" style="border:none; padding:3px 14px; line-height:27px; border-bottom:#eceae1 solid 1px; border-right:#eceae1 solid 1px; color:#333333;font-weight:bold;color:#666; background:#f6f4eb;text-align:left;">체크인 날짜</th>
					<td style="border:none; padding:3px 14px; line-height:27px; border-bottom:#eceae1 solid 1px; border-right:#eceae1 solid 1px; color:#333333;background:#FFF; color:#1b1b1b; text-align:left;">
						${data.startDate }</td>
					<th colspan="1" rowspan="1" scope="row" style="border:none; padding:3px 14px; text-align:center; line-height:27px; border-bottom:#eceae1 solid 1px; border-right:#eceae1 solid 1px; color:#333333;font-weight:bold;color:#666; background:#f6f4eb;text-align:left;">체크아웃 날짜</th><td style="border:none; padding:3px 14px; line-height:27px; border-bottom:#eceae1 solid 1px; color:#333333;background:#FFF; color:#1b1b1b; text-align:left;">
						${data.endDate }</td>
				</tr>
				<tr>
					<th colspan="1" rowspan="1" scope="row" style="border:none; padding:3px 14px; line-height:27px;border-right:#eceae1 solid 1px; color:#333333;font-weight:bold;color:#666; background:#f6f4eb;text-align:left;border-bottom:#eceae1 solid 1px;">객실타입</th>
					<td colspan="3" style="border:none; padding:3px 14px; line-height:27px; color:#333333;background:#FFF; color:#1b1b1b;text-align:left;border-bottom:#eceae1 solid 1px;">
						[${data.roomGrade }] ${data.roomLevel } / ${data.roomType } / ${data.roomView }
					</td>
				</tr>
				</tbody>
		</table>
		<table style="float:left;width:1200px;margin:0;color:#333;border-collapse:collapse; font-size:18px;">
			<colgroup><col style="width:78%"><col style="width:22%"></colgroup>
			<tbody>
			<tr>
				<td bgcolor="f9f7f1" style="padding:6px 15px 0 0; text-align:right;">객실요금
				</td>
				<td bgcolor="f9f7f1" style="padding:6px 15px 0 0; text-align:right;"><div class="roomPrice"></div>
				</td>
			</tr>
			<tr>
				<td bgcolor="f9f7f1" style="padding:6px 15px 0 0; text-align:right;">침대 추가 요금
				</td>
				<td bgcolor="f9f7f1" style="padding:6px 15px 0 0; text-align:right;">
				<div class="bedPrice"></div>
				</td>
			</tr>
			<tr>
				<td bgcolor="f9f7f1" style="padding:6px 15px 0 0; text-align:right;">어른 조식 추가 요금
				</td>
				<td bgcolor="f9f7f1" style="padding:6px 15px 0 0; text-align:right;"><div class="adultPrice"></div>
				</td>
			</tr>
			<tr>
				<td bgcolor="f9f7f1" style="padding:6px 15px 0 0; text-align:right;">어린이 조식 추가 요금
				</td>
				<td bgcolor="f9f7f1" style="padding:6px 15px 0 0; text-align:right;"><div class="childPrice"></div>
				</td>
			</tr>
			<tr>
				<td bgcolor="f9f7f1" style="padding:6px 15px 0 0; color:#7e4f15; text-align:right;">세금&amp;봉사료</td>
				<td bgcolor="f9f7f1" style="padding:6px 15px 0 0; color:#7e4f15; text-align:right;">
				<div class="tipPrice"></div></td>
			</tr>
			<tr>
				<td bgcolor="f9f7f1" style="padding:6px 15px 0 0; color:#7e4f15; text-align:right;"></td>
				<td bgcolor="f9f7f1" style="padding:6px 15px 0 0; color:#7e4f15; text-align:right;"></td>
			</tr>
			<tr>
				<td bgcolor="f9f7f1" style="padding:6px 15px 0 0; text-align:right;">요금 합계
				</td>
				<td bgcolor="f9f7f1" style="padding:6px 15px 0 0; text-align:right;"><div class="totalPrice"></div>
				</td>
			</tr>
			<tr><td valign="top" border="0">
				* 10% 봉사료와 11%의 세금이 포함된 가격입니다.<br>
				* 현재 미결제 상태이며, 체크인시 결제가 진행됩니다.
			</td></tr>
			</tbody>
		</table>
		<table style="width:1200px; float:left;margin:0;color:#333;border-collapse:collapse;*border-top:#cdcbbe solid 2px; font-size:18px;">
			<colgroup><col style="width:114px"><col style="width:217px"><col style="width:114px"><col style="width:192px"></colgroup>
				<tbody>
				<tr style="border-top:#cdcbbe solid 2px;">
					<th colspan="1" rowspan="1" scope="row" style="border:none; padding:3px 14px; line-height:27px; border-bottom:#eceae1 solid 1px; border-right:#eceae1 solid 1px; color:#333333;font-weight:bold;color:#666; background:#f6f4eb;text-align:left;">
					성명</th>
					<td colspan="3" style="border:none; padding:3px 14px; line-height:27px; border-bottom:#eceae1 solid 1px; color:#333333;background:#FFF; color:#1b1b1b;text-align:left;">
					${member.name }</td>
				</tr>
				<tr>
					<th colspan="1" rowspan="1" scope="row" style="border:none; padding:3px 14px; line-height:27px; border-bottom:#eceae1 solid 1px; border-right:#eceae1 solid 1px; color:#333333;font-weight:bold;color:#666; background:#f6f4eb;text-align:left;">
					이메일</th>
					<td colspan="3" style="border:none; padding:3px 14px; line-height:27px; border-bottom:#eceae1 solid 1px; color:#333333;background:#FFF; color:#1b1b1b;text-align:left;">
					${member.email }</td>
				</tr>
				<tr>
					<th colspan="1" rowspan="1" scope="row" style="border:none; padding:3px 14px; line-height:27px; border-bottom:#eceae1 solid 1px; border-right:#eceae1 solid 1px; color:#333333;font-weight:bold;color:#666; background:#f6f4eb;text-align:left;">
					연락처</th>
					<td colspan="3" style="border:none; padding:3px 14px; line-height:27px; border-bottom:#eceae1 solid 1px; color:#333333;background:#FFF; color:#1b1b1b;text-align:left;">
					${member.tel }</td>
				</tr>
				<tr>
					<th colspan="1" rowspan="1" scope="row" style="border:none; padding:3px 14px; line-height:27px; border-bottom:#eceae1 solid 1px; border-right:#eceae1 solid 1px; color:#333333;font-weight:bold;color:#666; background:#f6f4eb;text-align:left;">
					남기신 말씀</th>
					<td colspan="3" style="border:none; padding:3px 14px; line-height:27px; border-bottom:#eceae1 solid 1px; color:#333333;background:#FFF; color:#1b1b1b;text-align:left;">
					${data.memo }</td>
				</tr>
				<tr style="border-top:#cdcbbe solid 2px;">
					<th colspan="1" rowspan="1" scope="row" style="border:none; padding:3px 14px; line-height:27px; border-bottom:#eceae1 solid 1px; border-right:#eceae1 solid 1px; color:#333333;font-weight:bold;color:#666; background:#f6f4eb;text-align:left;">
					카드종류</th>
					<td style="border:none; padding:3px 14px; line-height:27px; border-bottom:#eceae1 solid 1px; border-right:#eceae1 solid 1px; color:#333333;background:#FFF; color:#1b1b1b;text-align:left;">
					${data.card }</td>
					<th colspan="1" rowspan="1" scope="row" style="border:none; padding:3px 14px; line-height:27px; border-bottom:#eceae1 solid 1px; border-right:#eceae1 solid 1px; color:#333333;font-weight:bold;color:#666; background:#f6f4eb;text-align:left;">
					만기일</th>
					<td style="border:none; padding:3px 14px; line-height:27px; border-bottom:#eceae1 solid 1px; color:#333333;background:#FFF; color:#1b1b1b;text-align:left;">
					${cardMonth } / ${cardYear }</td>
				</tr>
				<tr style="border-bottom:#cdcbbe solid 2px;">
					<th colspan="1" rowspan="1" scope="row" style="border:none; padding:3px 14px; line-height:27px; border-bottom:#cdcbbe solid 1px; border-right:#eceae1 solid 1px; color:#333333;font-weight:bold;color:#666; background:#f6f4eb;text-align:left;">
					카드번호</th>
					<td colspan="3" style="border:none; padding:3px 14px; line-height:27px; border-bottom:#cdcbbe solid 1px; color:#333333;background:#FFF; color:#1b1b1b;text-align:left;">
					${cardNum }</td>
				</tr>
				</tbody>
		</table>
		<table>
			<tbody><tr><td bgcolor="f2f2f2" style="width:1200px; padding:20px; font-size:12px; text-align:left;">
				<h2 style="margin:0 0 15px 0;color:#333;font-weight:bold;font-size:100%; line-height:160%;"><img style="border:0;" src="http://www.shilla.net/images/ko/jeju/email/emailRsvConfirm/h_cancel_policy.gif" alt="예약취소정책"></h2>
				<p><strong>예약 취소 및 No-Show 안내</strong></p>
<p><strong>· 성수기(5월 ~ 10월, 12월 24일 ~ 31일)</strong><br>
- 숙박 예정일 7일 전까지는 위약금 없이 취소됩니다.<br>
- 숙박 예정일 6일 전 ~ 1일 전 18시까지 취소 시, 최초 1박 요금의 20%가 위약금으로 부과됩니다.<br>
- 숙박 예정일 1일 전 18시 이후 취소하거나 노쇼(No-Show) 시, 최초 1박 요금의 80%가 위약금으로<br>
&nbsp;&nbsp;&nbsp;부과됩니다.</p>
<p><strong>· 비수기(성수기 외 기간)</strong><br>
- 숙박 예정일 1일 전 18시까지는 위약금 없이 취소됩니다.<br>
- 숙박 예정일 1일 전 18시 이후 취소하거나 노쇼(No-Show) 시, 최초 1박 요금의 10%가 위약금으로<br>
&nbsp;&nbsp;&nbsp;부과됩니다.</p>
</td></tr></tbody>
</table>
	</td>
</tr>
<tr>
<td align="center">
<br>
	<input type="button" onclick="moveMain();" value="메인화면으로 이동"> &nbsp;&nbsp;&nbsp; <input type="button" onclick="moveBack();" value="뒤로 가기">
	&nbsp;&nbsp;&nbsp;  <input type="button" onclick="reservationCancel(${data.no});" value="예약취소"> 
</td>
</tr>
</table>
</form>
<p style="height:500px;"></p>
<c:import url="/WEB-INF/common/footer.jsp"></c:import>
</center>
</body>
</html>