<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="<%=request.getContextPath()%>/css/common.css" rel="stylesheet" type="text/css">
<title>정보확인</title>
<script>
function reservationCancel(){
	var pw = document.dropForm.pw.value;
	var oPw = document.dropForm.oPw.value;
	if(pw == oPw){
		window.name="parentForm";
		window.open("memberDropOk?pw="+pw,"delForm","width=400, height=200, resizable=no,scrollbars=no");	
	}
	else{
		alert("비밀번호가 틀렸습니다.");
	}
}
</script>
</head>
<style type="text/css">
.popCtn {
    padding: 25px 27px;
    background: #FFF;
    border-top: none;
}
.formBox {
    border: #e9e9e9 solid 1px;
    background: #fbfbfb;
    padding: 19px 19px;
    margin: 0px 0 10px 0;
}
input[type=button] {
    width: 110px;
    height: 30px;
    font-weight: bold;
    color: #FFEBC6;
    background-color: #3c1600;
}
.location .list {
    display: block;
    font-size: 11px;
    background: url(${pageContext.request.contextPath}/images/locaton.gif) no-repeat 0 1px;
    line-height: 12px;
    padding: 0 0 0 17px;
}
.location {
    float: right;
    height: 20px;
    padding: 9px 0 0 0;
    margin: 0 0 -30px 0;
    overflow: hidden;
    z-index: 9;
    position: relative;
}
p {
    color: rgb(16, 16, 16);
    margin: 0px;
    padding: 0px;
    font: 12px/160% Dotum, 돋움, sans-serif;
} 
.headTit {
    position: relative;
    padding: 0px;
    margin: 0 0 0px 0;
    z-index: 8;
    height: 47px;
    border-bottom: #432c10 solid 5px;
    width: 866px;
}
</style>
<body>
<center>
<c:import url="/WEB-INF/common/top.jsp"></c:import>
<c:import url="/WEB-INF/common/menu.jsp"></c:import>
<p style="height:50px;"></p>

<div style="width: 866px; height: 47px;">
	<div class="headTit">
		<h4 class="tit">
			<img alt="회원탈퇴" src="${pageContext.request.contextPath}/images/ko/common/dropTit.gif" style="float: left;">
  		</h4>
	</div>
</div>
<form action="dropForm" name="dropForm" method="post">
	<input type="hidden" name="oPw" value="${authPass }">
	<div class="popCtn">

		<div class="step step1" style="display:" id="step1Div">

			<div class="formBox" style="width:510px; margin-bottom: 20px;">
				<table class="tableFormBox">
					<colgroup>
						<col width="25%">
						<col>
					</colgroup>
					<tbody><tr>
						<th scope="row"><span class="nameK">비밀번호&nbsp;&nbsp;</span></th>
						<td>
							<input type="password" name="pw" maxlength="15" size="17">
						</td>
					</tr>
				</tbody></table>
				
			</div>
			
			<div class="btnLostId">
				<input type="button" class="search" onclick="reservationCancel();" value="회원탈퇴" style="font-size: 11.5px;
    padding: 0 0 0 0;
    height: 26px;">
			</div>
		</div>
	</div>
</form>

<%-- <h1>◎ 회원 탈퇴 확인</h1>

<form action="dropForm" name="dropForm" method="post">
<input type="hidden" name="oPw" value="${authPass }">
<table border="1" width="700">
	<tr>
		<td width="100">비밀번호</td>
		<td><input type="password" name="pw" size="15" maxlength="15">&nbsp;&nbsp;
		<input type="button" onclick="reservationCancel();" value="회원탈퇴"></td>
	</tr>
</table>
</form> --%>
<p style="height:500px;"></p>
<c:import url="/WEB-INF/common/footer.jsp"></c:import>
</center>
</body>
</html>