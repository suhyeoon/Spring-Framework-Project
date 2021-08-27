<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="<%=request.getContextPath()%>/css/common.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/css/main.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="js/jquery-3.2.0.min.js"></script>
<script type="text/javascript">
function check(){
	
	if(document.change_form.curPwd.value == ""){
		alert("현재의 비밀번호를 입력하세요.");
		document.change_form.curPwd.focus();
		return false;
	}
	if(document.change_form.newPwd.value == ""){
		alert("새로운 비밀번호를 입력하세요.");
		document.change_form.newPwd.focus();
		return false;
	}
	if(document.change_form.newPwd.value != document.change_form.confirmPwd.value) {
		alert("비밀번호 확인이 일치하지 않습니다.");
		document.change_form.confirmPwd.focus();
		return false;
	}
}

function pwdChk(){
	var pw = document.change_form.newPwd.value;
	
	var reg = /^[a-zA-Z0-9~!@\#$%<>^&*\()\-=+_\’]{6,15}$/;
	if(!reg.test(pw)){
		document.getElementById("msg").innerHTML = "6~15자리 이내로 입력해주세요.";
		$("#msg").css("color","black");
		return false;
	}
	
	var regSmall = /[a-z]/g;
	var regCapital = /[A-Z]/g;
	var regNumber = /[0-9]/g;
	var regSpecial = /[~!@\#$%<>^&*\()\-=+_\’]/g;
	
	var regArr = ['','','',''];
	regArr[0] = pw.search(regSmall);
	regArr[1] = pw.search(regCapital);
	regArr[2] = pw.search(regNumber);
	regArr[3] = pw.search(regSpecial);
				
	var count = 0;
	/* alert(regArr[0] + "/"+ regArr[1] +"/"+ regArr[2]); */
	

	for(var i=0; i<regArr.length; i++){
		if(regArr[i]>=0)
			count++;
	}
	
	if(count == 1){		
		document.getElementById("msg").innerHTML = "보안 강도 : 하";
		$("#msg").css("color","red");
	}else if(count==2){
		document.getElementById("msg").innerHTML = "보안 강도 : 중";
		$("#msg").css("color","orange");
	}else if(count==3){
		document.getElementById("msg").innerHTML = "보안 강도 : 상";
		$("#msg").css("color","green");
	}else if(count==4){
		document.getElementById("msg").innerHTML = "보안 강도 : 최상";
		$("#msg").css("color","blue");
	}else{
		document.getElementById("msg").innerHTML = "ERROR";
		$("#msg").css("color","red");
	}
}

	function select(val){
		if(val != 'direct'){
			document.join_form.email2.value = val;
		} else {
			document.join_form.email2.value = "";
		}
	}

	function main(){
		alert("메인페이지로 이동합니다.");
		location.href="${pageContext.request.contextPath}/main.jsp";
		}
	
</script>
<title>비밀번호 변경</title>
</head>
<style type="text/css">
.tit {
	background: url(${pageContext.request.contextPath}/images/ko/common/152927966.gif) no-repeat;
	width: 866px;
	height: 40px;
	padding-bottom: 25px;
} 
.tableFormBox {
    border: #e9e9e9 solid 1px;
    background: #fbfbfb;
    padding: 19px 19px;
    margin: 0px 0 10px 0;
    text-align: left;
}
body, div, td, th, p, textarea {
    margin: 0;
    padding: 0;
    font-size: 12px;
    color: #101010;
}
sub {
	color: red;
}
.btnSubmit {
    background: url(${pageContext.request.contextPath}/images/ko/common/popFindIdBtnSubmit.gif) no-repeat;
    width: 61px;
    height: 27px;
    display: inline-block;
    vertical-align: middle;
    line-height: 100px;
    overflow: hidden;
}
.btnCancel {
    background: url(${pageContext.request.contextPath}/images/ko/common/popFindIdBtnCancel.gif) no-repeat;
    width: 61px;
    height: 27px;
    display: inline-block;
    vertical-align: middle;
    line-height: 100px;
    overflow: hidden;
}
.btnList a {
    display: inline-block;
    margin: 0 3px;
}
</style>
<body>
<center>
<c:import url="/WEB-INF/common/top.jsp"></c:import>
<c:import url="/WEB-INF/common/menu.jsp"></c:import>
<p style="height:50px;"></p>

<h1 class="tit"></h1>

<form action="changePwd" method="post" name="change_form" onsubmit="return check()">
<div class="formBox">
	<table class="tableFormBox" style="width:550px;" summary="비밀번호 변경을 위한 테이블입니다">
		<colgroup>
			<col width="25%">
			<col>
		</colgroup>
		<tbody><tr>
			<th scope="row"><label for="idInput" id="border1">현재 비밀번호</label></th>
			<td><input type="password" class="uiform idInput" name="curPwd" size="17"></td>
		</tr>
		<tr>
		<th scope="row"><label for="idInput" id="border2"><sub>* </sub>새 비밀번호</label></th>
			<td>
				<input type="password" name="newPwd" maxlength="15" size="17"
								onkeyup="pwdChk()">
				<b id="msg" style="color:red;font-size:8pt;"></b>
			</td>
		</tr>
		<tr>
		<th scope="row"><label for="idInput" class="idInput2"><sub>* </sub>새 비밀번호 확인</label></th>
			<td>
				<input type="password" name="confirmPwd" maxlength="15" size="17">
			</td>
		</tr>
	</tbody></table>
</div>
<div class="btnList">
	<input type="submit" value="비밀번호 변경" class="btnSubmit">
	<input type="button" value="취소" onclick="main();" class="btnCancel">
</div>
</form>


<c:if test="${success.changePwSuccess}">
	<script type="text/javascript">
		alert("비밀번호가 변경되었습니다.\n 메인 페이지로 이동합니다.");
		location.href="${pageContext.request.contextPath}/main.jsp";
	</script>
</c:if>
<c:if test="${success.changePwFault}">
	<script type="text/javascript">
		alert("기존 비밀번호가 틀리거나 새로운 비밀번호를 잘못 입력하셨습니다.");
		location.href="${pageContext.request.contextPath}/changePwd";
	</script>
</c:if>
<p style="height:500px;"></p>
<c:import url="/WEB-INF/common/footer.jsp"></c:import>
</center>
</body>
</html>