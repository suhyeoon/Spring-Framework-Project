<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script type="text/javascript">
	$(function(){
		var check = document.getElementById("check").value;
		if(check == "standard"){
			$("#a1").css({'color':'white','font-weight':'bolder','font-size':'10pt',
				'text-shadow':'-1px 1px 5px #423800, 1px -1px 5px #423800'}).text("▶ 스탠다드");
		} else if(check == "deluxe"){
			$("#a2").css({'color':'#fff','font-weight':'bolder','font-size':'10pt',
				'text-shadow':'-1px 1px 5px #423800, 1px -1px 5px #423800'}).text("▶ 디럭스");
		} else if(check == "terrace"){
			$("#a3").css({'color':'#fff','font-weight':'bolder','font-size':'10pt',
				'text-shadow':'-1px 1px 5px #423800, 1px -1px 5px #423800'}).text("▶ 테라스");
		} else if(check == "premier"){
			$("#b1").css({'color':'#fff','font-weight':'bolder','font-size':'10pt',
				'text-shadow':'-1px 1px 5px #423800, 1px -1px 5px #423800'}).text("▶ 프리미어");
		} else if(check == "preTerrace"){
			$("#b2").css({'color':'#fff','font-weight':'bolder','font-size':'10pt',
				'text-shadow':'-1px 1px 5px #423800, 1px -1px 5px #423800'}).text("▶ 프리미어 테라스");
		} else if(check == "norSuite"){
			$("#c1").css({'color':'#fff','font-weight':'bolder','font-size':'10pt',
				'text-shadow':'-1px 1px 5px #423800, 1px -1px 5px #423800'}).text("▶ 코너 스위트");
		} else if(check == "preSuite"){
			$("#c2").css({'color':'#fff','font-weight':'bolder','font-size':'10pt',
				'text-shadow':'-1px 1px 5px #423800, 1px -1px 5px #423800'}).text("▶ 프리미어 스위트");
		} else if(check == "royalSuite"){
			$("#c3").css({'color':'#fff','font-weight':'bolder','font-size':'10pt',
				'text-shadow':'-1px 1px 5px #423800, 1px -1px 5px #423800'}).text("▶ 로열 스위트");
		} else if(check == "presiSuite"){
			$("#c4").css({'color':'#fff','font-weight':'bolder','font-size':'10pt',
				'text-shadow':'-1px 1px 5px #423800, 1px -1px 5px #423800'}).text("▶ 프레지덴셜 스위트");
		}		
	});
</script>
<div class="lnbArea lnbAreaAcmd">
<input type="hidden" name="check" value="${param.check}" id="check">
	<div class="lnbMenu">
		<h2 id="room">객실</h2>
		<hr id="hr">
		<ul>
			<li id="superLi"><span id="bigTitle"><b>스탠다드</b></span><hr id="hr2"></li>
			<li>
				<ul>
					<li><a href="${pageContext.request.contextPath}/room/standard/standard?check=standard" id="a1"><span>스탠다드</span></a></li>
					<li><a href="${pageContext.request.contextPath}/room/standard/deluxe?check=deluxe" id="a2"><span>디럭스</span></a></li>
					<li><a href="${pageContext.request.contextPath}/room/standard/terrace?check=terrace" id="a3"><span>테라스</span></a></li>
				</ul>
			</li>
			<li id="superLi"><span><b id="bigTitle">프리미어</b></span><hr id="hr2"></li>
			<li>
				<ul>
					<li><a href="${pageContext.request.contextPath}/room/premier/premier?check=premier" id="b1"><span>프리미어</span></a></li>
					<li><a href="${pageContext.request.contextPath}/room/premier/preTerrace?check=preTerrace" id="b2"><span>프리미어 테라스</span></a></li>
				</ul>
			</li>
			<li id="superLi"><span><b id="bigTitle">스위트</b></span><hr id="hr2"></li>
			<li>
				<ul>
					<li><a href="${pageContext.request.contextPath}/room/suite/norSuite?check=norSuite" id="c1"><span>코너 스위트</span></a></li>
					<li><a href="${pageContext.request.contextPath}/room/suite/preSuite?check=preSuite" id="c2"><span>프리미어 스위트</span></a></li>
					<li><a href="${pageContext.request.contextPath}/room/suite/royalSuite?check=royalSuite" id="c3"><span>로열 스위트</span></a></li>
					<li><a href="${pageContext.request.contextPath}/room/suite/presiSuite?check=presiSuite" id="c4"><span>프레지덴셜 스위트</span></a></li>
				</ul>
			</li>
		</ul>
		<a href="<%=request.getContextPath()%>/room/all_rooms" class="btnAllRooms"><span>전체 객실 보기</span></a>
	</div>
</div>