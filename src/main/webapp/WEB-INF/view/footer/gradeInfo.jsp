<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="<%=request.getContextPath()%>/css/common.css"
	rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/css/room/main.css" rel="stylesheet"
	type="text/css">
<link href="<%=request.getContextPath()%>/css/room/base.css" rel="stylesheet"
	type="text/css">
<link href="<%=request.getContextPath()%>/css/rewards.css" rel="stylesheet"
	type="text/css">
<link href="<%=request.getContextPath()%>/css/mem/shillaRewards.css" rel="stylesheet"
	type="text/css">	
<title>회원등급 소개</title>
</head>
<style type="text/css">

.account {
	text-align: left;
}
.contents {
	float: none;
	/* padding: 0 0 0 520px; */
}

.contents .location .list{  
	display:block; 
	font-size:11px; 
	background:url(./images/footer/locaton.gif) no-repeat 0 1px; 
	line-height:12px; 
	padding:0 0 0 17px;
}

p {
	padding: 5px;
	font-family: Dotum,'돋움',sans-serif, Helvetica;
	font-size: 14px;
}

.besicText1 {
    color: #444;
    font-size: 12px;
    font-weight: bold;
    clear: both;
    margin-bottom: 10px;
}

.tableTypeF {
    border: none;
    border-top: #cdcbbe solid 1px;
    width: 100%;
    border-collapse: collapse;
    table-layout: fixed;
}

.tableTypeF th {
    color: #666;
    background: #faf9f4;
}

.tableTypeF th, .tableTypeF td {
    border: none;
    padding: 6px 13px;
    text-align: left;
    line-height: 22px;
    border-bottom: #eceae1 solid 1px;
    color: #333333;
}

.benefit {
	float: left;
}

.ctnSpOffer {
	width: 866px;
}

</style>
<body>
	<center>
		<c:import url="/WEB-INF/common/top.jsp"></c:import>
		<c:import url="/WEB-INF/common/menu.jsp"></c:import>
	
	<br>
	<br>


	<div class="contents" id="contents">
				


<script type="text/javascript">
function openCal() {
	var url = "/membership/offers/benefits/memPopGradeCalculator.do";
	$.ajax({
		  url: url,
		  cache: false,
		  type: "POST",
		  /* data: { "askTypCd": askTypCd,
			  	  "hotlId": hotlId,
		  		} */
		}).done(function( html ) {
			$('body').prepend("<div id='askLayer' style='display:none'></div><div style='display: block;' id='mdScreen' class='mdScreen'></div>");
			$("#askLayer").html(html.replace(/&lt;br\s*\&gt;/g,'<br/>'));
		  	$("#askLayer").show();
		  	$("#askLayer").attr("tabindex",-1).focus();
		  	
			//첨부파일 선택 UI 공통
			/* $(".uiAttachFile .fileInput").on("change", function(){ 
				$("#askLayer .fileLocation").val(this.value);
			}); */	
			
		}).fail(function(jqXHR, textStatus) {
			  alert( "Request failed: " + textStatus );
		}).always(function() { 
			//$("select, input").not(".fileInput").uniform(); 
		});
}
</script>

<div class="ctnSpOffer ctnPackage">
	<div class="location">
		<p class="list"><span class="crPosit">현재 페이지 위치 : </span> &gt; <strong>회원특전</strong></p>
	</div>
	<div class="headTit">
		<h3>
			<img alt="회원특전" class="benefit"
				src="<%=request.getContextPath()%>/images/footer/subTitleshillaRewards.gif">
		</h3>
	</div>
	<div class="account">
		<!-- content start -->
		<br>
		<div>
			<p> 중앙리조트 회원만을 위한 다양한 혜택을 확인하세요</p>
			<br>
			<img src="<%=request.getContextPath()%>/images/footer/093112809.png" alt="BeneFits 카드 이미지" width="866" height="201">
			<br>
			<div>
				<p>중앙리조트는 포인트 혜택 및 특전을 제공하는 새로운 통합멤버십 서비스입니다.</p>
				<p>중앙리조트에 가입하신 모든 회원님께 특별한 혜택을 제공해 드리며, 회원님들의 
				 이용실적에 따라 포인트 추가 적립률 및 할인서비스 등 다양한 특전을 제공해 드립니다.</p>
				<p>객실 및 식음업장 이용 실적에 따라 등급이 부여되며, 등급별로 추가 혜택을 받으실 수 
				 있습니다.</p>
			 </div>
		</div>			
		<div class="titBtnfloat">
			
			<div class="benefitsTitle"><img src="<%=request.getContextPath()%>/images/footer/benefits_conTitle01.gif" alt="회원특전"></div>
		</div>
			
		<p class="besicText1">객실 및 식음업장 이용 실적에 따라 등급이 부여되며, 등급에 따른 특별한 혜택을 추가로 받으실 수 있습니다.</p>

		<table class="tableTypeF tableUserInfo1" summary="실버, 골드, 다이아몬드 구성된 테이블">
			<caption>회원특전</caption>
			<colgroup>
				<col width="13%" class="col1">
				<col class="col2">
			</colgroup>
			<tbody>
				<tr class="first">
					<th class="first" scope="row"><div class="tableTItle">실버<span class="silver">Silver</span></div></th>
					<td class="first">
						<ul class="iconUl">
							<li class="first">기본 적립률 : 객실 이용 금액 3%, 식음 이용 금액 1% 적립<sup>*</sup></li>
							<li>투숙 시 웰컴 어메니티 제공</li>
							<li class="last">첫 투숙 시 1% 추가 적립 (식음업장 이용 제외)<sup>*</sup></li>
						</ul>
					</td>
				</tr>
				<tr class="first">
					<th class="first" scope="row"><div class="tableTItle">골드<span class="gold">Gold</span></div></th>
					<td class="first">
						<ul class="iconUl">
							<li class="first">기본 적립률 + 포인트 추가 적립 (객실 1%, 식음 0.5%)<sup>*</sup></li>
							<li>투숙 시 웰컴 어메니티 제공</li>
							<li>식음업장 이용 금액 5% 할인<sup>*</sup></li>
							<li>투숙 시 Laundry 이용 금액 10% 할인</li>
							<li>투숙 시 무료 Laundry 서비스 (제주 중앙리조트 : 셔츠 1개 세탁)</li>
							<li>객실 연 3회 업그레이드(1회 限 스위트 객실 업그레이드 제공)</li>
							<li class="last">72시간 예약 개런티<sup>*</sup></li>
						</ul>
					</td>
				</tr>
				<tr class="last">
					<th class="first" scope="row"><div class="tableTItle">다이아몬드<span class="diamond">Diamond</span></div></th>
					<td class="first">
						<ul class="iconUl">
							<li class="first">기본 적립률 + 포인트 추가 적립 (객실 2%, 식음 1%)<sup>*</sup></li>
							<li>투숙 시 웰컴 어메니티 제공</li>
							<li>식음업장 이용 금액 10% 할인<sup>*</sup></li>
							<li>투숙 시 Laundry 이용 금액 15% 할인</li>
							<li>투숙 시 무료 Laundry 서비스 (제주 중앙리조트 : 상,하의 각 1개 세탁)</li>
							<li>객실 연 5회 업그레이드(1회 限 스위트 객실 업그레이드 제공)</li>
							<li>Express Check-In/Check-Out</li>
							<li>Early Check-In,(12시) Late Check-out (15시)<sup>*</sup> (호텔 별 예약 상황에 따라 제공이 제한될 수 있습니다.)</li>
							<li>제주 중앙리조트 라운지 무료 이용(동반 1인까지)</li>
							<li>회원의 생일 투숙 시 케이크 제공</li>
							<li class="last">48시간 예약 개런티<sup>*</sup></li>
						</ul>
					</td>
				</tr>
			</tbody>
		</table>
		<div class="iconBg">
			<ul class="iconUl2">
			<li class="first">※ 중앙스테이 이용 시에는 다음 사항만 제공됩니다.(* 항목)</li>
			<li>- 포인트의 적립 및 사용, 식음 할인, 예약 개런티 서비스, Early Check-In 및 Late Check-Out 서비스</li>
			<li>※ 제주 중앙리조트 이용 시에는 다음 사항은 제공되지 않습니다.</li>
			<li>- 예약 개런티 서비스, Early Check-In, Late Check-Out 서비스</li>
			<li>※ 등급에 따른 특전 내용은 각 투숙 기간 동안 1회에 한해 제공되며, 모든 할인 혜택은 다른 할인 혜택과 중복 제공되지 않습니다.</li>
			<li class="last">※ 보다 자세한 내용은 중앙리조트 약관을 참고해 주십시오.</li>
			</ul>
		</div>					

		<div class="point">
			<br>
			<img alt="포인트 안내" src="<%=request.getContextPath()%>/images/footer/Earn_text02.gif">
			<h3>중앙리조트 포인트는 쉽고 간편하게 사용하실 수 있습니다.</h3>
			<br>
			<ul>
				<li class="first"> 중앙리조트 포인트의 1점은 원화(KRW) 1원의 가치를 가집니다.</li>
				<li class="last"> 적립된 포인트는 제주 중앙리조트 및 중앙스테이 어디에서든 현금처럼 사용하실 수 있으며 식음업장을 이용하셔도 포인트를 적립하고 사용하실 수 있습니다.</li>
			</ul>
			<img alt="포인트 적립 안내" src="<%=request.getContextPath()%>/images/footer/point.jpg">
			<br>
			<div class="hidden">
			<h5>포인트 적립안내</h5>
			<ul>
				<li class="first">
					<h6>기본 적립</h6>
					<p>- 최종 결제금액을 기준으로 객실 이용 금액의 3%, 레스토랑 이용 금액의 1%가 포인트로 적립됩니다.</p>
				</li>
				<li class="last">
					<h6>등급에 따른 추가 적립</h6>
					<p>골드 등급 : 기본적립률에 객실 1%, 레스토랑 0.5%를 추가로 적립해드립니다.</p>
					<p>다이아몬드 등급 : 기본적립률에 객실 2%, 레스토랑 1%를 추가로 적립해드립니다.</p>
				</li>
			</ul>
			</div>
			<br>
			<img alt="포인트 사용 안내" src="<%=request.getContextPath()%>/images/footer/Earn_text03.gif">
			<ul class="UseimgBox">
				<li class="first"><img src="<%=request.getContextPath()%>/images/footer/Earn_pointimg1.gif" alt="호텔 객실 이미지"></li>
				<li><img src="<%=request.getContextPath()%>/images/footer/Earn_pointimg2.gif" alt="레스토랑 이미지"></li>
				<li class="last-child last"><img src="<%=request.getContextPath()%>/images/footer/Earn_pointimg3.gif" alt="삼성상품권 이미지"></li>
			</ul>
			<p class="besicText1">중앙리조트 포인트는 최소 10,000포인트(10,000원의 가치)부터 제주 중앙리조트 및 중앙스테이에서 현금처럼 사용 가능합니다.</p>
		</div>

		
	
	</div>
</div>
			</div>
	<c:import url="/WEB-INF/common/footer.jsp"></c:import>
</center>
</body>
</html>