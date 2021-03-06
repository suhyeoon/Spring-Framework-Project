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
		$('.bedPrice').text(set_comma(bPrice) + '???');
	
	if(adPrice == 0)
		$('.adultPrice').text("");
	else
		$('.adultPrice').text(set_comma(adPrice) + '???');
	
	if(chPrice == 0)
		$('.childPrice').text("");
	else
		$('.childPrice').text(set_comma(chPrice) + '???');
	
	$('.roomPrice').text(set_comma(rPrice) + '???');
	$('.totalPrice').text(set_comma(price) + '???');
	$('.tipPrice').text(set_comma(tip) + '???');
	
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
<title>???????????? ????????????</title>
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
	


<h1>??? ?????? ?????? ?????? ??????</h1>
<table style="width:1200px;  margin:0 auto; padding:0; color:#101010;overflow:hidden;border-collapse:collapse;" >
<tr>
	<td>
		<table style="float:left;width:1200px;margin:0;color:#333;border-collapse:collapse;*border-top:#cdcbbe solid 1px; font-size:18px;">
				<colgroup><col style="width:114px"><col style="width:217px"><col style="width:114px"><col style="width:192px"></colgroup>
				<tbody>
				<tr style="border-top:#cdcbbe solid 2px;">
					<th colspan="1" rowspan="1" scope="row" style="border:none; padding:3px 14px; line-height:27px; border-bottom:#eceae1 solid 1px; border-right:#eceae1 solid 1px; color:#333333;font-weight:bold;color:#666; background:#f6f4eb;text-align:left;">????????????</th>
					<td style="border:none; padding:3px 14px; line-height:27px; border-bottom:#eceae1 solid 1px; color:#333333;background:#FFF; color:#1b1b1b;text-align:left;">
						${data.reservationDate }
					</td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<th colspan="1" rowspan="1" scope="row" style="border:none; padding:3px 14px; line-height:27px; border-bottom:#eceae1 solid 1px; border-right:#eceae1 solid 1px; color:#333333;font-weight:bold;color:#666; background:#f6f4eb;text-align:left;">????????????</th>
					<td style="border:none; padding:3px 14px; line-height:27px; border-bottom:#eceae1 solid 1px; color:#333333;background:#FFF; color:#1b1b1b;text-align:left;">
						??????:${data.adultCnt }, ?????????:${data.childCnt }
					</td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<th colspan="1" rowspan="1" scope="row" style="border:none; padding:3px 14px; line-height:27px; border-bottom:#eceae1 solid 1px; border-right:#eceae1 solid 1px; color:#333333;font-weight:bold;color:#666; background:#f6f4eb;text-align:left;">????????? ??????</th>
					<td style="border:none; padding:3px 14px; line-height:27px; border-bottom:#eceae1 solid 1px; border-right:#eceae1 solid 1px; color:#333333;background:#FFF; color:#1b1b1b; text-align:left;">
						${data.startDate }</td>
					<th colspan="1" rowspan="1" scope="row" style="border:none; padding:3px 14px; text-align:center; line-height:27px; border-bottom:#eceae1 solid 1px; border-right:#eceae1 solid 1px; color:#333333;font-weight:bold;color:#666; background:#f6f4eb;text-align:left;">???????????? ??????</th><td style="border:none; padding:3px 14px; line-height:27px; border-bottom:#eceae1 solid 1px; color:#333333;background:#FFF; color:#1b1b1b; text-align:left;">
						${data.endDate }</td>
				</tr>
				<tr>
					<th colspan="1" rowspan="1" scope="row" style="border:none; padding:3px 14px; line-height:27px;border-right:#eceae1 solid 1px; color:#333333;font-weight:bold;color:#666; background:#f6f4eb;text-align:left;border-bottom:#eceae1 solid 1px;">????????????</th>
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
				<td bgcolor="f9f7f1" style="padding:6px 15px 0 0; text-align:right;">????????????
				</td>
				<td bgcolor="f9f7f1" style="padding:6px 15px 0 0; text-align:right;"><div class="roomPrice"></div>
				</td>
			</tr>
			<tr>
				<td bgcolor="f9f7f1" style="padding:6px 15px 0 0; text-align:right;">?????? ?????? ??????
				</td>
				<td bgcolor="f9f7f1" style="padding:6px 15px 0 0; text-align:right;">
				<div class="bedPrice"></div>
				</td>
			</tr>
			<tr>
				<td bgcolor="f9f7f1" style="padding:6px 15px 0 0; text-align:right;">?????? ?????? ?????? ??????
				</td>
				<td bgcolor="f9f7f1" style="padding:6px 15px 0 0; text-align:right;"><div class="adultPrice"></div>
				</td>
			</tr>
			<tr>
				<td bgcolor="f9f7f1" style="padding:6px 15px 0 0; text-align:right;">????????? ?????? ?????? ??????
				</td>
				<td bgcolor="f9f7f1" style="padding:6px 15px 0 0; text-align:right;"><div class="childPrice"></div>
				</td>
			</tr>
			<tr>
				<td bgcolor="f9f7f1" style="padding:6px 15px 0 0; color:#7e4f15; text-align:right;">??????&amp;?????????</td>
				<td bgcolor="f9f7f1" style="padding:6px 15px 0 0; color:#7e4f15; text-align:right;">
				<div class="tipPrice"></div></td>
			</tr>
			<tr>
				<td bgcolor="f9f7f1" style="padding:6px 15px 0 0; color:#7e4f15; text-align:right;"></td>
				<td bgcolor="f9f7f1" style="padding:6px 15px 0 0; color:#7e4f15; text-align:right;"></td>
			</tr>
			<tr>
				<td bgcolor="f9f7f1" style="padding:6px 15px 0 0; text-align:right;">?????? ??????
				</td>
				<td bgcolor="f9f7f1" style="padding:6px 15px 0 0; text-align:right;"><div class="totalPrice"></div>
				</td>
			</tr>
			<tr><td valign="top" border="0">
				* 10% ???????????? 11%??? ????????? ????????? ???????????????.<br>
				* ?????? ????????? ????????????, ???????????? ????????? ???????????????.
			</td></tr>
			</tbody>
		</table>
		<table style="width:1200px; float:left;margin:0;color:#333;border-collapse:collapse;*border-top:#cdcbbe solid 2px; font-size:18px;">
			<colgroup><col style="width:114px"><col style="width:217px"><col style="width:114px"><col style="width:192px"></colgroup>
				<tbody>
				<tr style="border-top:#cdcbbe solid 2px;">
					<th colspan="1" rowspan="1" scope="row" style="border:none; padding:3px 14px; line-height:27px; border-bottom:#eceae1 solid 1px; border-right:#eceae1 solid 1px; color:#333333;font-weight:bold;color:#666; background:#f6f4eb;text-align:left;">
					??????</th>
					<td colspan="3" style="border:none; padding:3px 14px; line-height:27px; border-bottom:#eceae1 solid 1px; color:#333333;background:#FFF; color:#1b1b1b;text-align:left;">
					${member.name }</td>
				</tr>
				<tr>
					<th colspan="1" rowspan="1" scope="row" style="border:none; padding:3px 14px; line-height:27px; border-bottom:#eceae1 solid 1px; border-right:#eceae1 solid 1px; color:#333333;font-weight:bold;color:#666; background:#f6f4eb;text-align:left;">
					?????????</th>
					<td colspan="3" style="border:none; padding:3px 14px; line-height:27px; border-bottom:#eceae1 solid 1px; color:#333333;background:#FFF; color:#1b1b1b;text-align:left;">
					${member.email }</td>
				</tr>
				<tr>
					<th colspan="1" rowspan="1" scope="row" style="border:none; padding:3px 14px; line-height:27px; border-bottom:#eceae1 solid 1px; border-right:#eceae1 solid 1px; color:#333333;font-weight:bold;color:#666; background:#f6f4eb;text-align:left;">
					?????????</th>
					<td colspan="3" style="border:none; padding:3px 14px; line-height:27px; border-bottom:#eceae1 solid 1px; color:#333333;background:#FFF; color:#1b1b1b;text-align:left;">
					${member.tel }</td>
				</tr>
				<tr>
					<th colspan="1" rowspan="1" scope="row" style="border:none; padding:3px 14px; line-height:27px; border-bottom:#eceae1 solid 1px; border-right:#eceae1 solid 1px; color:#333333;font-weight:bold;color:#666; background:#f6f4eb;text-align:left;">
					????????? ??????</th>
					<td colspan="3" style="border:none; padding:3px 14px; line-height:27px; border-bottom:#eceae1 solid 1px; color:#333333;background:#FFF; color:#1b1b1b;text-align:left;">
					${data.memo }</td>
				</tr>
				<tr style="border-top:#cdcbbe solid 2px;">
					<th colspan="1" rowspan="1" scope="row" style="border:none; padding:3px 14px; line-height:27px; border-bottom:#eceae1 solid 1px; border-right:#eceae1 solid 1px; color:#333333;font-weight:bold;color:#666; background:#f6f4eb;text-align:left;">
					????????????</th>
					<td style="border:none; padding:3px 14px; line-height:27px; border-bottom:#eceae1 solid 1px; border-right:#eceae1 solid 1px; color:#333333;background:#FFF; color:#1b1b1b;text-align:left;">
					${data.card }</td>
					<th colspan="1" rowspan="1" scope="row" style="border:none; padding:3px 14px; line-height:27px; border-bottom:#eceae1 solid 1px; border-right:#eceae1 solid 1px; color:#333333;font-weight:bold;color:#666; background:#f6f4eb;text-align:left;">
					?????????</th>
					<td style="border:none; padding:3px 14px; line-height:27px; border-bottom:#eceae1 solid 1px; color:#333333;background:#FFF; color:#1b1b1b;text-align:left;">
					${cardMonth } / ${cardYear }</td>
				</tr>
				<tr style="border-bottom:#cdcbbe solid 2px;">
					<th colspan="1" rowspan="1" scope="row" style="border:none; padding:3px 14px; line-height:27px; border-bottom:#cdcbbe solid 1px; border-right:#eceae1 solid 1px; color:#333333;font-weight:bold;color:#666; background:#f6f4eb;text-align:left;">
					????????????</th>
					<td colspan="3" style="border:none; padding:3px 14px; line-height:27px; border-bottom:#cdcbbe solid 1px; color:#333333;background:#FFF; color:#1b1b1b;text-align:left;">
					${cardNum }</td>
				</tr>
				</tbody>
		</table>
		<table>
			<tbody><tr><td bgcolor="f2f2f2" style="width:1200px; padding:20px; font-size:12px; text-align:left;">
				<h2 style="margin:0 0 15px 0;color:#333;font-weight:bold;font-size:100%; line-height:160%;"><img style="border:0;" src="http://www.shilla.net/images/ko/jeju/email/emailRsvConfirm/h_cancel_policy.gif" alt="??????????????????"></h2>
				<p><strong>?????? ?????? ??? No-Show ??????</strong></p>
<p><strong>?? ?????????(5??? ~ 10???, 12??? 24??? ~ 31???)</strong><br>
- ?????? ????????? 7??? ???????????? ????????? ?????? ???????????????.<br>
- ?????? ????????? 6??? ??? ~ 1??? ??? 18????????? ?????? ???, ?????? 1??? ????????? 20%??? ??????????????? ???????????????.<br>
- ?????? ????????? 1??? ??? 18??? ?????? ??????????????? ??????(No-Show) ???, ?????? 1??? ????????? 80%??? ???????????????<br>
&nbsp;&nbsp;&nbsp;???????????????.</p>
<p><strong>?? ?????????(????????? ??? ??????)</strong><br>
- ?????? ????????? 1??? ??? 18???????????? ????????? ?????? ???????????????.<br>
- ?????? ????????? 1??? ??? 18??? ?????? ??????????????? ??????(No-Show) ???, ?????? 1??? ????????? 10%??? ???????????????<br>
&nbsp;&nbsp;&nbsp;???????????????.</p>
</td></tr></tbody>
</table>
	</td>
</tr>
<tr>
<td align="center">
<br>
	<input type="button" onclick="moveMain();" value="?????????????????? ??????"> &nbsp;&nbsp;&nbsp; <input type="button" onclick="moveBack();" value="?????? ??????">
	&nbsp;&nbsp;&nbsp;  <input type="button" onclick="reservationCancel(${data.no});" value="????????????"> 
</td>
</tr>
</table>
</form>
<p style="height:500px;"></p>
<c:import url="/WEB-INF/common/footer.jsp"></c:import>
</center>
</body>
</html>