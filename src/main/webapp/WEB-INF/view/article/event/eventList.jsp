<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="<%=request.getContextPath()%>/css/common.css"
	rel="stylesheet" type="text/css">
<title>이벤트 게시글 목록</title>
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

button {
	background: #fff;
	/* color: #000000;  */
	border-bottom: none;
	position: relative;
	height: 30px;
	font-size: 0.8em;
	padding: 0 2em;
	cursor: pointer;
	transition: 800ms ease all;
	outline: none;
}
#btnOngoing{
	background: #F1E3C4;
}
#eventBtn{
	text-align: left;
}
</style>


<script type="text/javascript">
	function writeForm() {
		location.href = "write";
	}
	/* 
	$('#btnOngoing').click(function() {
			
	
	}); */
</script>
</head>
<body>
	<center>
		<c:import url="/WEB-INF/common/top.jsp"></c:import>
		<c:import url="/WEB-INF/common/menu.jsp"></c:import>
		<div id="wrap">
			<div id="topForm">
				<h2 align="left">이벤트 게시판</h2>
				<c:if test="${sessionScope.authUser=='admin' }">
					<input type="button" value="글쓰기"
						onclick="location.href='write?mo=0'">
				</c:if>
				
				<!-- 진행중 종료됨 버튼 -->
				<div id="eventBtn">
					<button id="btnOngoing" onclick="javascript:location.href='list?beforePage=list'">진행중인 이벤트</button>
					<button id="btnEnd" onclick="javascript:location.href='endlist?beforePage=endlist'">종료된 이벤트</button>
				</div>
			</div>
			<br>
			<table align="center" width="800px" border=3>
				<c:if test="${requestScope.list.size()==0}">
					<tr>
						<td colspan="3">게시글이 없습니다.</td>
					</tr>
				</c:if>
				<c:forEach var="article" items="${list}">

					<c:if test="${article.recommend%3 eq '0'}">
						<tr>
					</c:if>

					<td width="30%" align="center">
						<p>
							<img
								src="<%=request.getContextPath()%>/images/event/${article.image}"
								width="200" height="200" />
						</p>
						<hr>
						<!-- // 목록보기 눌렀을 때, 진행중 종료됨 페이지 구분하기 위함. &beforePage=${beforePage} 추가함-->
						<p>
							<a href="read?no=${article.no}&pageNo=${spage}&beforePage=${beforePage}">${article.title}</a>
						</p>
						<hr>
						<p>시작일 : ${article.startDate}</p>
						<p>종료일 : ${article.endDate}</p>

					</td>

					<c:if test="${article.recommend%3 eq '2'}">
						</tr>
					</c:if>
				</c:forEach>
				<c:if test="${requestScope.list.size()>0}">
					<tr align="center">
						<td colspan="3" align="center"><c:if test="${startPage != 1}">
								<a href="list?page=${startPage - 1}">[이전]</a>
							</c:if> <c:forEach var="pNo" begin="${startPage}" end="${endPage}">
								<c:if test="${pNo ==spage }">
						${pNo}&nbsp;
					</c:if>
								<c:if test="${pNo != spage}">
									<a href='${beforePage }?page=${pNo }'>${pNo }&nbsp;</a>
								</c:if>
							</c:forEach> <c:if test="${endPage != maxPage}">
								<a href="list?page=${endPage+1}">[다음]</a>
							</c:if></td>
					</tr>
				</c:if>

			</table>
		</div>
		<p style="height: 500px;"></p>
		<c:import url="/WEB-INF/common/footer.jsp"></c:import>
	</center>
</body>
</html>