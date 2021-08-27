<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="<%=request.getContextPath()%>/css/common.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/css/login.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/css/join.css"
	rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/css/main.css"
	rel="stylesheet" type="text/css">

<script type="text/javascript" src="js/jquery-3.2.0.min.js"></script>
<script type="text/javascript">
	$(function(){
		$("#user_id").focus();
		$("#user_pw").val("비밀번호");
		
		$("#user_id").focus(function() { 
			if($("#user_id").val() == "아이디"){
				$(this).val("");
			}
		});
		
		$("#user_pw").focus(function(){
			if($("#user_pw").val() == "비밀번호"){
				$(this).val("");
				$("#user_pw").attr("type","password");
			} 
		});	

		$("#user_id").blur(function(){
			if ($("#user_id").val() == ""){
				$(this).val("아이디");
				}
		});
		
		$("#user_pw").blur(function(){
			if ($("#user_pw").val() == ""){
				$("#user_pw").attr("type","text");
				$(this).val("비밀번호");
				}
		});
	});

	function check(){
		if(document.loginForm.id.value == "아이디"){
			alert("아이디를 입력하세요.");
			document.loginForm.id.focus();
			return false;
		}
		
		if(document.loginForm.pw.value == "비밀번호"){
			alert("비밀번호를 입력하세요.");
			document.loginForm.pw.focus();
			return false;
		}
		
	}
	
</script>
<title>로그인 폼</title>
</head>
<body>
<center>
<c:import url="/WEB-INF/common/top.jsp"></c:import>
<c:import url="/WEB-INF/common/menu.jsp"></c:import>
<c:if test="${not empty sessionScope.authUser}">
	<script>
		location.href="main";
	</script>
</c:if>
<div class="contain">
<div class="container" style="margin-top: 50px ">
<div class="loginBox contents" id="contents">
<div class="location rgt" style="float: right;margin-bottom: 0px;vertical-align:">
			<p class="list" style="margin-top: 0"><span class="crPosit">현재 페이지 위치 : </span> &gt; <strong>로그인</strong></p>
		</div>
<div class="headTit" style="border-bottom:#432c10 solid 5px;">
			<img alt="로그인 폼" style="float: left"
				src="${pageContext.request.contextPath}/images/ko/common/loginTit.gif">
		</div>
	</div>
</div>
<h3>ChoongAng Resort에 오신것을 환영합니다.</h3>
<h4>ChoongAng 회원이 되시면 다양한 서비스를 누리실 수 있습니다.</h4>
<form action="login" method="post" name="loginForm" onsubmit="return check()">
<div id="bg"> 
	<h1 id="h1" style="margin-bottom: 0">CHOONGANG</h1>
		<h2 id="h2" style="margin-top: 0"> JEJU Resort</h2>
	<table style="margin-top: 20px">
		<tr>
			<td colspan="2"><input type="text" name="id" id="user_id" 
							style="color:#8C8C8C;"></td>
			<td rowspan="2"><input type="submit" value="로그인"></td>
		</tr>
		<tr>
			<td colspan="2"><input type="text" name="pw" id="user_pw" 
							style="color:#8C8C8C;"></td>
		</tr>
		<tr>
			<td><input type="button" value="회원가입" onclick="location.href='agree'"></td>
			<td><input type="button" value="아이디 찾기" onclick="location.href='idSearch'"></td>
			<td><input type="button" value="패스워드 찾기" onclick="location.href='pwdSearch'"></td>
		</tr>
	</table>
	<c:if test="${errors.idOrPwNotMatch}">
		<script type="text/javascript">
		alert("아이디가 존재하지 않거나 비밀번호가 틀립니다.");
		</script>
	</c:if>
	<c:if test="${success.loginSuccess}">
		<script type="text/javascript">
		alert("로그인 성공");
		location.href="./main.jsp";
		</script>
	</c:if>
</div>

</form>
</div>
<p style="height:400px;"></p>
<c:import url="/WEB-INF/common/footer.jsp"></c:import>
</center>
</body>
</html>
