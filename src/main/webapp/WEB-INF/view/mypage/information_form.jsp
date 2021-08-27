<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="<%=request.getContextPath()%>/css/common.css"
	rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/css/main.css" rel="stylesheet"
	type="text/css">
<link href="<%=request.getContextPath()%>/css/join.css" rel="stylesheet"
	type="text/css">
<link href="<%=request.getContextPath()%>/css/inquires.css"
	rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/css/base.css" rel="stylesheet"type="text/css">
<link href="<%=request.getContextPath()%>/css/meetingevent.css" rel="stylesheet" type="text/css">

<script>

function moveDrop(){
	location.href="memberDrop";
}

</script>
<style type="text/css">
h4 {
	display: block;
	-webkit-margin-before: 1.33em;
	-webkit-margin-after: 1.33em;
	-webkit-margin-start: 0px;
	-webkit-margin-end: 0px;
	font-weight: bold;
}
td, th {
    display: table-cell;
    vertical-align: inherit;
}
table {
    display: table;
    border-collapse: separate;
    border-spacing: 2px;
    border-color: grey;
}

.bList {
	width: 100%;
	margin: 30px auto;
	text-align: left;
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
	background: #faf9f4;
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
<title>정보확인</title>
</head>
<body>
	<center>
		<c:import url="/WEB-INF/common/top.jsp"></c:import>
		<c:import url="/WEB-INF/common/menu.jsp"></c:import>
		<p style="height: 50px;"></p>
		
		<img alt="내정보 확인" src="<%=request.getContextPath()%>/images/contents/main_img/myInfoStep2Tit1.gif">

		<form action="myPageInfo" method="post">
			<input type="hidden" name="id" value="${memberData.id}"> <input
				type="hidden" name="name" value="${memberData.name}"> <input
				type="hidden" name="gender" value="${memberData.gender}"> <input
				type="hidden" name="addrNo" value="${memberData.addrNo}"> <input
				type="hidden" name="addr" value="${memberData.addr}"> <input
				type="hidden" name="tel" value="${memberData.tel}"> <input
				type="hidden" name="email" value="${memberData.email}">

			<table class="bList" border="1" style="width: 866px">
				<tr>
					<td class="index" width="100">아이디</td>
					<td>${memberData.id}</td>
				</tr>
				<tr>
					<td class="index">이름</td>
					<td>${memberData.name}</td>
				</tr>
				<tr>
					<td class="index">성별</td>
					<td>${memberData.gender}</td>
				</tr>
				<tr>
					<td class="index">우편번호</td>
					<td>${memberData.addrNo}</td>
				</tr>
				<tr>
					<td class="index">주소</td>
					<td>${memberData.addr}</td>
				</tr>
				<tr>
					<td class="index">전화번호</td>
					<td>${memberData.tel}</td>
				</tr>
				<tr>
					<td class="index">이메일</td>
					<td>${memberData.email}</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="정보수정하기"> 
						<input type="button" onclick="moveDrop();" value="회원탈퇴">
					</td>
				</tr>
			</table>
		</form>
		
				

		<p style="height: 500px;"></p>
		<c:import url="/WEB-INF/common/footer.jsp"></c:import>
	</center>
</body>
</html>