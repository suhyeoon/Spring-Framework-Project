<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="<%=request.getContextPath()%>/css/common.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/css/qna.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/css/article/articleCommon.css" rel="stylesheet" type="text/css">

<title>Q&A게시판 리스트</title>
<style>
	#wrap {
	width: 800px;
	margin: 0 auto 0 auto;
	padding: 0;
	border: 0;
}

#topForm {
	text-align: right;
}
#topMenu {
	text-align: left;
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

.bList .index {
	width: 10%;
}
.bList .read {
	width: 15%
}
.bList .category{
	width: 15%
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
<script type="text/javascript">
	function blankChk() {
		var input = document.searchProc.keyword.value;
		
		if(input == null || input == ''){
			alert("검색어를 입력해주세요.");
			return false;
		}
		return true;
	}
	</script>
</head>
<body>
<center>
<c:import url="/WEB-INF/common/top.jsp"></c:import>
<c:import url="/WEB-INF/common/menu.jsp"></c:import>
<div id ="wrap">
<h2 align="left"> Q&A</h2>

<div id="topForm">
		<c:if test="${sessionScope.authUser!=null }">
			<input type="button" value="문의하기" onclick="location.href='write'">
		</c:if>
	</div>
<br>
	<div id="board">
		<table class="bList" width="800px">
		<tr>
			<th class = "index">번호</th>
			<th class = "category">유형</th>
			<th>제목</th>
			<th class = "writer">작성자</th>
			<th class = "read">답변여부</th>
		</tr>
	<c:if test="${requestScope.list.size()==0 }">
	<tr>
		<td colspan="6" style="text-align: center;">문의 정보가 없습니다.</td>
	</tr>				
	</c:if>
<c:forEach var="article" items="${list}">
	<tr class="event">
		<td>${article.no}</td>
		<td>${article.category}</td>
		<td class = "title">
		<a id="titleA" href="read?no=${article.no}&pageNo=${spage}">
			<c:out value="${article.title}"/>
		</a>
		</td>
		<td>${article.writer}</td>
		<td>
		<c:if test="${article.answer}">
			O
		</c:if>
		<c:if test="${!article.answer}">
			X
		</c:if>
		</td>
	</tr>
</c:forEach>
</table>
</div>
<!-- 검색기능을 위한 추가 코드 : 검색창 -->
<form name="searchProc" action="list" method="post" onsubmit="return blankChk()">
	<select name="searchOption">
		<option value="title">제목</option>
		<option value="category">유형</option>
		<option value="writer">글쓴이</option>
		<option value="contents">내용</option>
		<option value="titleContents">제목 + 내용</option>
	</select> <input type="text" name="keyword" style="width:200px;"> 
	<input type="submit" value="검색"> 
	<input type="button" value="처음으로" onclick="location.href='list'">
</form>
<br>
<div>
<c:if test="${requestScope.list.size()>0}">
	<tr>
		<td colspan="5">
			<c:if test="${startPage != 1}">
				<a href="list?page=${startPage - 1}">[이전]</a>
			</c:if>
			<c:forEach var="pNo" begin="${startPage}" end="${endPage}">
				<c:if test="${pNo ==spage }">
					${pNo}&nbsp;
				</c:if>
				<c:if test="${pNo != spage}">
					<a href='list?page=${pNo }'>${pNo }&nbsp;</a>
				</c:if>
			</c:forEach> 
			<c:if test="${endPage != maxPage}">
				<a href="list?page=${endPage+1}">[다음]</a>
			</c:if>
		</td>
	</tr>
</c:if>
	</div>
</div>
<p style="height:500px;"></p>
<c:import url="/WEB-INF/common/footer.jsp"></c:import>
</center>
</body>
</html>