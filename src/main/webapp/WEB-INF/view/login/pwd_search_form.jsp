<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link href="<%=request.getContextPath()%>/css/common.css"
	rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/css/join.css" rel="stylesheet"
	type="text/css">
<link href="<%=request.getContextPath()%>/css/kensington.css"
	rel="stylesheet" type="text/css">
<style type="text/css">
#new1 {
	height: 30px;
	margin-right: 20px;
}

#new2 {
	height: 30px;
	margin-right: 48px;
}

#newpw1 {
	height: 20px;
	width: 178px;
}

#newpw2 {
	height: 20px;
	width: 178px;
}
</style>
<script type="text/javascript">
function pwdChk(){
	var pw = document.pwSearchForm.newPwd.value;
	
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
</script>
<title>비밀번호 찾기 폼</title>
</head>
<body>
	<c:import url="/WEB-INF/common/top.jsp"></c:import>
	<c:import url="/WEB-INF/common/menu.jsp"></c:import>
	<center>
		<div class="contain">
			<div class="container" style="margin-top: 50px">
				<div class="loginBox contents" id="contents">
					<div class="headTit">
						<img alt="비밀번호 찾기 폼" style="float: left"
							src="${pageContext.request.contextPath}/images/ko/common/비밀번호 찾기.png">
					</div>
				</div>
			</div>
		</div>


		<div class="boxSt16 centerST borSt10 over_h" style="width: 845px;">
			<!-- 이메일 // -->
			<div class="borSt08 over_h flo_l pdSt01"
				style="width: 652px; padding-left: 110px">
				<!-- 20160318 수정(width 수정) -->
				<!-- 20160316 수정(텍스트) -->


				<form onclick="return false;" method="post" name="pwSearchForm"
					style="height: 270px;">
				<div class="searchPwd">
					<dl class="dlSt04 flo_l ma_r7 ma_b30">
						<dt class="wdSt01">아이디</dt>
						<dd class="wdSt02">
							<input type="text" id="txtPwId" name="id" class="inputST04"
								style="width: 178px;">
						</dd>
						<dt class="wdSt01 lastB">이메일</dt>
						<dd class="wdSt03 lastB positionR">
							<!-- 20160318 수정(class) -->
							<div class="over_h positionA"
								style="left: 0; top: 0; z-index: 99; padding-left: 43px;">
								<input type="text" id="txtPwEmail" name="email"
									class="inputST04 ma_r7 flo_l" style="width: 178px;">

							</div>
						</dd>
					</dl>
					<p class="ma_l70" style="width: 165px; height: 120px;">
						<a onclick="sub(1)" id="ctl00_ContentPlaceHolder1_LinkButton3"
							class="btnSt03 flo_l"
							style="width: 165px; height: 40px"> <span
							style="width: 165px; height: 40px; line-height: 40px; opacity: 1;"
							class="en btnOv">비밀번호 재설정</span>
						</a>
					</p>
					<br>
				</div>
					<c:if test="${success.success}">
					<script>
						$('.searchPwd').css('display','none');
					</script>
						<%-- 	회원님의 비밀번호는  ${requestScope.pwdValue} 입니다. --%>
						<input type="hidden" name="check" value="1">
						<input type="hidden" name="curPwd"
							value="${requestScope.pwdValue}">
						<input type="hidden" name="pwdId" value="${requestScope.pwdId}">
						<dl class="dlSt04 flo_l ma_r7 ma_b30">
							<dt class="wdSt01">새 비밀번호</dt>
							<dd class="wdSt02">
								<input type="password" id="txtPwId" name="newPwd"
									class="inputST04" style="width: 178px;" onkeyup="pwdChk()"> 
								
							</dd>
							<b id="msg" style="position:relative;top:10px; color: red;width:180px; font-size: 8pt;"></b>
							<dt class="wdSt01 lastB">새 비밀번호 확인</dt>
							<dd class="wdSt03 lastB positionR">
								<!-- 20160318 수정(class) -->
								<div class="over_h positionA"
									style="left: 0; top: 0; z-index: 99; padding-left: 43px;">
									<input type="password" id="txtPwEmail" name="reNewPwd"
										class="inputST04 ma_r7 flo_l" style="width: 178px;">

								</div>
							</dd>
						</dl>
						<!-- <div id="new1">
							새 비밀번호&nbsp;<input type="password" name="newPwd" id="newpw1">
						</div>
						<div id="new2">
							새 비밀번호 확인&nbsp;<input type="password" name="reNewPwd" id="newpw2">
						</div> -->
					<p class="ma_l70" style="width: 165px; height: 120px;">
						<a onclick="sub(2)" id="ctl00_ContentPlaceHolder1_LinkButton3"
							class="btnSt03 flo_l"
							style="width: 165px; height: 40px"> <span
							style="width: 165px; height: 40px; line-height: 40px; opacity: 1;"
							class="en btnOv">비밀번호 변경</span>
						</a>
					</p>
					</c:if>
					<c:if test="${errorr.errorr}">
					해당 정보에 맞지 않습니다.
				</c:if>

				</form>





				<!-- 버튼// -->

				<!-- //버튼-->
			</div>
			<!-- //이메일 -->
			<!-- 휴대전화// -->

			<!-- //휴대전화 -->
		</div>
	</center>
	<p style="height: 400px;"></p>
	<c:import url="/WEB-INF/common/footer.jsp"></c:import>
</body>
<script type="text/javascript">
	function sub(index) {
		if (index == 1) {
			document.pwSearchForm.method = "post";
			document.pwSearchForm.action = "pwdSearch";
			document.pwSearchForm.submit();
		}
		if (index == 2) {
			var pw = document.pwSearchForm.newPwd.value;
			var repwd = document.pwSearchForm.reNewPwd.value;
			
			if(pw == null || pw == ''){
				alert("새 비밀번호를 입력해주세요.");
				return false;
			} else if (repwd == null || repwd == ''){
				alert("새 비밀번호 확인을 입력해주세요.");
				return false;
			}
			
			if (pw == repwd) {
				document.pwSearchForm.method = "post";
				document.pwSearchForm.action = "changePwd";
				document.pwSearchForm.submit();
			} else {
				alert("비밀번호가 일치하지 않습니다");
				return false;
			}
		}
	}
</script>
</html>