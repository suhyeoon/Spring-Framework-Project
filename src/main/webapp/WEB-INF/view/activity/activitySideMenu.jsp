<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.2.0.min.js"></script>
<script type="text/javascript">
	$(function(){
		var check = document.getElementById("check").value;
		if(check == "camp"){
			$("#a1").css({'color':'white','font-weight':'bolder','font-size':'13pt',
				'text-shadow':'-1px 1px 5px #423800, 1px -1px 5px #423800'}).text("▶ 글램핑빌리지");
		} else if(check == "fitness"){
			$("#a2").css({'color':'#fff','font-weight':'bolder','font-size':'13pt',
				'text-shadow':'-1px 1px 5px #423800, 1px -1px 5px #423800'}).text("▶ 피트니스");
		} else if(check == "winebar"){
			$("#a3").css({'color':'#fff','font-weight':'bolder','font-size':'13pt',
				'text-shadow':'-1px 1px 5px #423800, 1px -1px 5px #423800'}).text("▶ 와인바");
		} else if(check == "gamezone"){
			$("#a4").css({'color':'#fff','font-weight':'bolder','font-size':'13pt',
				'text-shadow':'-1px 1px 5px #423800, 1px -1px 5px #423800'}).text("▶ 게임Zone");
		}
	});
</script>
<style>
.lnbAreaAcmd .lnbMenu .tit {
    background-position: 0 -400px;
}
</style>
<div class="lnbArea lnbAreaAcmd">
<input type="hidden" name="check" value="${param.check}" id="check">
	<div class="lnbMenu">
		<h2 class="tit">액티비티</h2>
		<ul>
			<li><a href="${pageContext.request.contextPath}/activity/camp?check=camp" id="a1"><span><b>글램핑빌리지</b></span></a></li>
			<li><a href="${pageContext.request.contextPath}/activity/fitness?check=fitness" id="a2"><span><b>피트니스</b></span></a></li>
			<li><a href="${pageContext.request.contextPath}/activity/winebar?check=winebar" id="a3"><span><b>와인바</b></span></a></li>
			<li><a href="${pageContext.request.contextPath}/activity/gamezone?check=gamezone" id="a4"><span><b>게임Zone</b></span></a></li>
		</ul>
	</div>
</div>