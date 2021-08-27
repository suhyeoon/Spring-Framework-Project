<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="<%=request.getContextPath()%>/css/common.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/css/join_tb.css" rel="stylesheet" type="text/css">
<script type="text/javascript">

	function move(){
		alert("회원가입이 완료되었습니다.\n 로그인창으로 이동합니다.")
		location.href = "joinSuccess"
	}
</script>
<title>가입완료</title>
</head>
<body onload="move()">
<center>
<c:import url="/WEB-INF/common/top.jsp"></c:import>
<c:import url="/WEB-INF/common/menu.jsp"></c:import>
<br><br>
<h2>Seven Star 회원가입</h2>
<div>
	<table id="join_tb">
		<tr>
			<td>01. 약관동의</td>
			<td>02. 회원정보입력</td>
			<td id="bold">03. 가입완료</td>
		</tr>
	</table>
	<br><br>
	<h2>가입을 축하드립니다!</h2>
</div>

<p style="height:500px;"></p>
<c:import url="/WEB-INF/common/footer.jsp"></c:import>
</center>
</body>
</html>