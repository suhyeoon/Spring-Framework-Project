<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.2.0.min.js"></script>
<script type="text/javascript">
	$(function(){
		var check = document.getElementById("check").value;
		if(check == "info"){
			$("#a1").css({'color':'white','font-weight':'bolder','font-size':'13pt',
				'text-shadow':'-1px 1px 5px #423800, 1px -1px 5px #423800'}).text("▶ 리조트 소개");
		} else if(check == "map"){
			$("#a2").css({'color':'#fff','font-weight':'bolder','font-size':'13pt',
				'text-shadow':'-1px 1px 5px #423800, 1px -1px 5px #423800'}).text("▶ 오시는길");
		} else if(check == "blockPlan"){
			$("#a3").css({'color':'#fff','font-weight':'bolder','font-size':'13pt',
				'text-shadow':'-1px 1px 5px #423800, 1px -1px 5px #423800'}).text("▶ 리조트 배치도");
		} else if(check == "tour"){
			$("#a4").css({'color':'#fff','font-weight':'bolder','font-size':'13pt',
				'text-shadow':'-1px 1px 5px #423800, 1px -1px 5px #423800'}).text("▶ 주변 관광지 소개");
		}
	});
</script>
<div class="lnbArea lnbAreaAcmd">
<input type="hidden" name="check" value="${param.check}" id="check">
	<div class="lnbMenu">
		<h2 id="intro">소개</h2>
		<hr id="hr">
		<ul>
			<li><a href="${pageContext.request.contextPath}/info/info?check=info" id="a1"><span><b>리조트 소개</b></span></a></li>
			<li><a href="${pageContext.request.contextPath}/info/map?check=map" id="a2"><span><b>오시는길</b></span></a></li>
			<li><a href="${pageContext.request.contextPath}/info/blockPlan?check=blockPlan" id="a3"><span><b>리조트 배치도</b></span></a></li>
			<li><a href="${pageContext.request.contextPath}/info/tour?check=tour" id="a4"><span><b>주변 관광지 소개</b></span></a></li>
		</ul>
	</div>
</div>