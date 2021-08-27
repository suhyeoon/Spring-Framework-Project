<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="<%=request.getContextPath()%>/css/common.css" rel="stylesheet" type="text/css">
<title>아이디 찾기 폼</title>
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
.btnJoin {
    background: url(${pageContext.request.contextPath}/images/ko/common/popFindIdBtnJoin.gif) no-repeat;
    width: 85px;
    height: 27px;
    display: inline-block;
    vertical-align: middle;
    line-height: 100px;
    overflow: hidden;
}
input[type=submit] {
    width: 110px;
    height: 30px;
    font-weight: bold;
    color: #FFEBC6;
    background-color: #3c1600;
}
sub {
	font-size: large;
	font-weight: bold;
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
			<img alt="아이디찾기" src="${pageContext.request.contextPath}/images/ko/common/idTit.gif" style="float: left;">
  		</h4>
	</div>
</div>
<form action="idSearch" method="post">
	<div class="popCtn">

		<div class="step step1" style="display:" id="step1Div">

			<div class="formBox" style="width:510px; margin-bottom: 20px;">
				<table class="tableFormBox" summary="The table has name, e-mail and mobile number.">
					<colgroup>
						<col width="25%">
						<col>
					</colgroup>
					<tbody><tr>
						<th scope="row"><span class="nameK">Name</span></th>
						<td>
							<input type="text" name="name" maxlength="15" size="17">
						</td>
					</tr>
					<tr>
						<th scope="row">
							<label class="emailId" for="emailId">E-mail </label>
						</th>
						<td>
							<input name="email" type="text" size="17">
						</td>
					</tr>
				</tbody></table>
				
			</div>
			
			<div class="btnLostId">
				<input type="submit" class="search" value="아이디 찾기" style="font-size: 11.5px;
    padding: 0 0 0 0;
    height: 26px;">
				<input type="button" class="btnJoin" value="회원가입" onclick="location.href='agree'">
			</div>
			
		</div>
		
		<div style="margin-top: 30px;">
			<c:if test="${success.success}">
				회원님의 아이디는  <sub>${requestScope.idValue}</sub> 입니다.
			</c:if>
			<c:if test="${errorr.errorr}">
				해당 정보에 맞는 아이디가 없습니다.
			</c:if>
		</div>
		
		
	</div>
</form>
<p style="height:400px;"></p>
<c:import url="/WEB-INF/common/footer.jsp"></c:import>
</center>
</body>
</html>