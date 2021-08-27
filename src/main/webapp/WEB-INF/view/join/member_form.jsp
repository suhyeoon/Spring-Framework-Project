<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="<%=request.getContextPath()%>/css/common.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/css/join_tb.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="js/jquery-3.2.0.min.js"></script>
<script type="text/javascript">
	$(function(){
		$("#user_id").focus();

		$("#user_id").focus(function() { //focus가 이동되었을 때
			$(this).val("");
		});
		
		$("#user_id").blur(function(){
			if ($("#user_id").val() == ""){
				$(this).val("아이디 입력");
				}
			});
		});

	function check(){
		
		if(document.join_form.id.value == ""){
			alert("아이디를 입력하세요.");
			document.join_form.id.focus();
			return false;
		}
		if(document.join_form.idDuplication.value != "idCheck"){
			alert("아이디 중복체크를 해주세요.");
			document.join_form.idDuplication.value.focus();
			return false;
		}
		if(document.join_form.pw.value == ""){
			alert("비밀번호를 입력하세요.");
			document.join_form.pw.focus();
			return false;
		}
		
		if(document.join_form.confirmPwd.value == ""){
			alert("비밀번호 확인을 입력하세요.");
			document.join_form.confirmPwd.focus();
			return false;
		}
		if(document.join_form.pw.value != document.join_form.confirmPwd.value){
			alert("비밀번호 확인이 일치하지 않습니다.")
		}
		
		if(document.join_form.name.value == ""){
			alert("이름을 입력하세요.");
			document.join_form.name.focus();
			return false;
		}
		if(document.join_form.addrNo.value == ""){
			alert("우편번호를 입력하세요.");
			document.join_form.addrNo.focus();
			return false;
		}
		if(document.join_form.addr1.value == ""){
			alert("주소를 입력하세요.");
			document.join_form.addr1.focus();
			return false;
		}
		if(document.join_form.tel1.value == "" ||
			document.join_form.tel2.value == "" ||
			document.join_form.tel3.value == ""){
			alert("연락처를 입력하세요.");
			document.join_form.tel1.focus();
			return false;
		}
		if(isNaN(document.join_form.tel1.value) ||
			isNaN(document.join_form.tel2.value) ||
			isNaN(document.join_form.tel3.value)){
			alert("연락처는 숫자만 입력 가능합니다.")
			document.join_form.tel1.focus();
			return false;
		}
		if(document.join_form.email1.value == "" ||
			document.join_form.email2.value == ""){
			alert("이메일을 입력하세요.");
			document.join_form.email1.focus();
			return false;
		}
		
	}
	
	function pwdChk(){
		var pw = document.join_form.pw.value;
		
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

	function inputIdChk(){
		document.join_form.idDuplication.value = "idUncheck";
	}
	function openIdChk(){
		var id = document.join_form.id.value;
		if (id == ""){
			alert("입력된 아이디가 없습니다.");
		} else {
			
			window.name="parentForm";
			window.open("search/checkId_form.jsp","chkForm",
					"width=500, height=300, resizable=no, scrollbars=no");
		}
	}
	
	function zipSearch(){
		window.open("search/zipcode_search.jsp","zipcode",
				"width=600,height=300,resizable=no,scrollbars=yes")
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
<title>회원가입 폼</title>
</head>
<body>
<center>
<c:import url="/WEB-INF/common/top.jsp"></c:import>
<c:import url="/WEB-INF/common/menu.jsp"></c:import>
<br><br>
<h2>Seven Star 회원가입</h2>
<div>
	<table id="join_tb">
		<tr>
			<td>01. 약관동의</td>
			<td id="bold">02. 회원정보입력</td>
			<td>03. 가입완료</td>
		</tr>
	</table>
	<br><br>
	
<h2>◎ 회원 정보 입력</h2>
<hr>
<div>
	<form name="join_form" action="join" method="post" onsubmit="return check()">
	<table id="join_tb2" height="500px">
		<tr>
			<td id="border1">&nbsp;<sub>*</sub> 아이디</td>
			<td id="border2"><input type="text" name="id" id="user_id" size="15" 
							maxlength="15" onkeydown="inputIdChk()">
				<input type="button" name="idCheck" value="중복검사" onclick="openIdChk()" id="button">
				<b style="font-size:9pt">· 6~15자의 영문 또는 숫자로 조합</b>
				<input type="hidden" name="idDuplication" value="idUncheck">
			</td>
		</tr>
		<tr>
			<td id="border1"><sub>*</sub> 비밀번호</td>
			
			<td id="border2"><input type="password" name="pw" size="15" maxlength="15" onkeyup="pwdChk()">
			<b style="font-size:9pt">· 6~15자의 영문 또는 숫자로 조합</b>&nbsp;
			<b id="msg" style="color:red;font-size:8pt;"></b></td>
		</tr>
		<tr>
			<td id="border1"><sub>*</sub> 비밀번호 확인</td>
			<td id="border2"><input type="password" name="confirmPwd" size="15" maxlength="15"></td>
		</tr>
		<tr>
			<td id="border1"><sub>*</sub> 이름</td>
			<td id="border2"><input type="text" name="name" size="5" maxlength="5" style="width:100px;"></td>
		</tr>
		<tr>
			<td rowspan="3" id="border1"><sub>*</sub> 주소</td>
			<td id="border2"><input type="text" name="addrNo" readonly="readonly">
				<input type="button" name="zip_search" value="우편번호 검색" onclick="zipSearch();" id="button">
			</td>
		</tr>
		<tr>
			<td><input type="text" name="addr1" size="5" maxlength="50" style="width:400px;"></td>
		</tr>
		<tr>

			<td><input type="text" name="addr2" size="5" maxlength="50" style="width:400px;"></td>
		</tr>
		<tr>
			<td id="border1"><sub>*</sub> 휴대전화</td>
			<td id="border2">
				<input type="text" name="tel1" size="3" maxlength="3">&nbsp; -
				<input type="text" name="tel2" size="4" maxlength="4">&nbsp; -
				<input type="text" name="tel3" size="4" maxlength="4">
			</td>
		</tr>
		<tr>
			<td id="border1"><sub>*</sub> 성별</td>
			<td id="border2"><label>남<input type="radio" name="gender" value="남" checked="checked"></label>
				<label>여<input type="radio" name="gender" value="여"></label>
			</td>
		</tr>
		<tr>
			<td id="border1"><sub>*</sub> 이메일</td>
			<td id="border2"><input type="text" name="email1">&nbsp;@
				<input type="text" name="email2" value="naver.com" style="magin-left:0;">
				<select name="email" id="option" onchange="select(this.value);">
					<option value="naver.com">naver.com</option>
					<option value="hanmail.com">hanmail.com</option>
					<option value="nate.com">nate.com</option>
					<option value="gmail.com">gmail.com</option>
					<option value="direct">직접입력</option>
				</select>
		
			</td>
		</tr>
	</table>
	<br>
	<table>
		<tr>
			<td><input type="submit" id="button" value="회원가입"></td>
			<td><input type="button" value="취소" onclick="main();"></td>
		</tr>
	</table>
	</form>
</div>

</div>
<p style="height:200px;"></p>
<c:import url="/WEB-INF/common/footer.jsp"></c:import>
</center>
</body>
</html>
