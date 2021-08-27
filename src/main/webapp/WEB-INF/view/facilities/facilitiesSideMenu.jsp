<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.2.0.min.js"></script>
<script type="text/javascript">
	$(function(){
		var check = document.getElementById("check").value;
		if(check == "spa"){
			$("#a1").css({'color':'white','font-weight':'bolder','font-size':'13pt',
				'text-shadow':'-1px 1px 5px #423800, 1px -1px 5px #423800'}).text("▶ 스파");
		} else if(check == "lounge"){
			$("#a2").css({'color':'#fff','font-weight':'bolder','font-size':'13pt',
				'text-shadow':'-1px 1px 5px #423800, 1px -1px 5px #423800'}).text("▶ 라운지");
		} else if(check == "gallery"){
			$("#a3").css({'color':'#fff','font-weight':'bolder','font-size':'13pt',
				'text-shadow':'-1px 1px 5px #423800, 1px -1px 5px #423800'}).text("▶ 럭셔리갤러리");
		} else if(check == "business"){
			$("#a4").css({'color':'#fff','font-weight':'bolder','font-size':'13pt',
				'text-shadow':'-1px 1px 5px #423800, 1px -1px 5px #423800'}).text("▶ 비즈니스센터");
		}
	});
</script>
<div class="lnbArea lnbAreaAcmd">
<input type="hidden" name="check" value="${param.check}" id="check">
	<div class="lnbMenu">
		<h2 class="tit">편의시설</h2>
		<ul class="menu">
			<li class="m1 first"><a href="${pageContext.request.contextPath}/spa?check=spa" id="a1"><span><b>스파</b></span></a></li>
			<li class="m2"><a href="${pageContext.request.contextPath}/lounge?check=lounge" id="a2"><span><b>라운지</b></span></a></li>
			<li class="m3 last"><a href="${pageContext.request.contextPath}/gallery?check=gallery" id="a3"><span><b>럭셔리갤러리</b></span></a></li>
			<li class="m3 last"><a href="${pageContext.request.contextPath}/business?check=business" id="a4"><span><b>비즈니스센터</b></span></a></li>
		</ul>
	</div>
</div>