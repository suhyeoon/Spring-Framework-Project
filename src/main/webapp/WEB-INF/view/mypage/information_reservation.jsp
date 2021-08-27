<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="<%=request.getContextPath()%>/css/common.css" rel="stylesheet" type="text/css">
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
<title>정보수정</title>
</head>
<body>
<center>
<c:import url="/WEB-INF/common/top.jsp"></c:import>
<c:import url="/WEB-INF/common/menu.jsp"></c:import>
<p style="height:50px;"></p>

<h1>◎ 내 예약 정보 확인</h1>

<div id="board">
	<table class="bList" width="1200px">
		<tr>
			<th>객실 정보</th>
			<th>패키지 이름</th>
			<th>체크인 날짜</th>
			<th>체크아웃 날짜</th>
			<th>가격</th>
			<th>확인</th>
		</tr>
		<c:if test="${requestScope.data.size()==0 }">
		<tr>
			<td colspan="6">예약 내역이 없습니다.</td>
		</tr>
		</c:if>
			<c:forEach var="list" items="${requestScope.data}">
		<tr>
			<td>[${list.roomGrade}] ${list.roomLevel } (${list.roomType} / ${list.roomView })</td>
			<td>${list.name}</td>
			<td>${list.startDate }</td>
			<td>${list.endDate}</td>
			<td>${list.sPrice } 원</td>
			<td>
				<a href="detail_reservation?no=${list.no}">
					상세보기
				</a>
			</td>
		</tr>
			</c:forEach>
	</table>	
</div>
<p style="height:500px;"></p>
<c:import url="/WEB-INF/common/footer.jsp"></c:import>
</center>
</body>
</html>