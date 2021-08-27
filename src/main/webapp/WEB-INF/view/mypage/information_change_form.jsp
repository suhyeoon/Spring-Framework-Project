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
<link href="<%=request.getContextPath()%>/css/base.css" rel="stylesheet"
	type="text/css">
<link href="<%=request.getContextPath()%>/css/meetingevent.css"
	rel="stylesheet" type="text/css">

<script type="text/javascript">


	function check() {
		if (document.join_form.name.value == "") {
			alert("이름을 입력하세요.");
			document.join_form.name.focus();
			return false;
		}
		if (document.join_form.addrNo.value == "") {
			alert("우편번호를 입력하세요.");
			document.join_form.addrNo.focus();
			return false;
		}
		if (document.join_form.addr1.value == "") {
			alert("주소를 입력하세요.");
			document.join_form.addr1.focus();
			return false;
		}
		if (document.join_form.tel1.value == ""
				|| document.join_form.tel2.value == ""
				|| document.join_form.tel3.value == "") {
			alert("연락처를 입력하세요.");
			document.join_form.tel1.focus();
			return false;
		}
		if (isNaN(document.join_form.tel1.value)
				|| isNaN(document.join_form.tel2.value)
				|| isNaN(document.join_form.tel3.value)) {
			alert("연락처는 숫자만 입력 가능합니다.")
			document.join_form.tel1.focus();
			return false;
		}
		if (document.join_form.email1.value == ""
				|| document.join_form.email2.value == "") {
			alert("이메일을 입력하세요.");
			document.join_form.email1.focus();
			return false;
		}

	}

	function zipSearch() {
		window.open("search/zipcode_search.jsp", "zipcode",
				"width=600,height=300,resizable=no,scrollbars=yes")
	}

	function select(val) {
		if (val != 'direct') {
			document.join_form.email2.value = val;
		} else {
			document.join_form.email2.value = "";
		}
	}

	function main() {
		alert("메인페이지로 이동합니다.");
		location.href = "${pageContext.request.contextPath}/main.jsp";
	}
</script>
<title>정보수정</title>
</head>
<body>
	<center>
		<c:import url="/WEB-INF/common/top.jsp"></c:import>
		<c:import url="/WEB-INF/common/menu.jsp"></c:import>
		<p style="height: 50px;"></p>

		<%-- 	<form action="information_change" method="post" name="join_form">

			<table border="1" width="700">
				<tr>
					<td width="100">아이디</td>
					<td><input type="text" name="id" readonly="readonly"
						value="${memberData.id}"></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" name="name" size="5" maxlength="5"
						value="${memberData.name}"></td>
				</tr>
				<tr>
					<td>성별</td>
					<td><c:if test="${memberData.gender eq '남'}">
							<label>남<input type="radio" name="gender" value="남"
								checked="checked"></label>
							<label>여<input type="radio" name="gender" value="여"></label>
						</c:if> <c:if test="${memberData.gender eq '여'}">
							<label>남<input type="radio" name="gender" value="남"></label>
							<label>여<input type="radio" name="gender" value="여"
								checked="checked"></label>
						</c:if></td>
				</tr>
				<tr>
					<td>우편번호</td>
					<td><input type="text" name="addrNo" readonly="readonly"
						value="${memberData.addrNo}"> <input type="button"
						name="zip_search" value="우편번호 검색" onclick="zipSearch();"
						id="button"></td>
				</tr>
				<tr>
					<td>주소</td>
					<td><input type="text" name="addr1" size="70"
						value="${memberData.addr}"><br> <input type="text"
						name="addr2"></td>
				</tr>
				<tr>
					<td>전화번호</td>
					<td><input type="text" name="tel1" size="3" maxlength="3"
						value="${requestScope.tel1}">&nbsp; - <input type="text"
						name="tel2" size="4" maxlength="4" value="${requestScope.tel2}">&nbsp;
						- <input type="text" name="tel3" size="4" maxlength="4"
						value="${requestScope.tel3}"></td>
				</tr>
				 

			</table>
		</form> --%>

		<form action="information_change" method="post" name="join_form"
			onsubmit="return check();">
			<c:if test="${success.modifySuccess}">
				<script type="text/javascript">
					alert("회원정보가 수정되었습니다.\n 메인화면으로 이동합니다.");
					location.href = "${pageContext.request.contextPath}/main.jsp";
				</script>
			</c:if>
			<div class="container">
				<div class="ctnJoin ctnJoinStep2">
					<div class="hTit">
						<h4 class="tit">회원정보 입력</h4>
					</div>
					<div class="hTitS">
						<h4 class="tit">기본 입력</h4>
						<div class="info">
							<em class="ast">*</em> 표시 필수입력사항
						</div>
					</div>
					<table class="tableTypeA tableJoinForm"
						summary="성명(한글),성명(영문),아이디,비밀번호,비밀번호확인,생년월일,이메일,휴대전화,자택전화,주소,SMS수신여부,기념일로 구성된테이블입니다."
						style="margin-top: 0px; width: 900px">
						<caption>회원가입 기본정보입력</caption>
						<colgroup>
							<col width="16%" class="col1">
							<col class="col2">
						</colgroup>

						<tbody>
							<tr class="first">
								<th scope="row" class="first"><em class="ast">*</em> 성명</th>
								<td class="first"><label for="titlCd" class="nameH"></label>
									<div class="selector" id="uniform-titlCd" style="width: 66px;">
									</div> <input type="text" name="name" size="5" maxlength="5"
									value="${memberData.name}"></td>
							</tr>
							<tr>
								<th scope="row"><em class="ast">*</em> 아이디</th>
								<td><c:if test="${memberData.gender eq '남'}">
										<label> 남 <input type="radio" name="gender" value="남"
											checked="checked"></label>
										<label> 여 <input type="radio" name="gender" value="여"></label>
									</c:if> <c:if test="${memberData.gender eq '여'}">
										<label> 남 <input type="radio" name="gender" value="남"></label>
										<label> 여 <input type="radio" name="gender" value="여"
											checked="checked"></label>
									</c:if>
								</td>
							</tr>

							<tr>
								<th scope="row"><em class="ast">*</em> 아이디</th>
								<td><input type="text" name="id" readonly="readonly"
									value="${memberData.id}"></td>
							</tr>

							<!-- 이메일 -->
							<tr>
								<th scope="row"><em class="ast">*</em> 이메일</th>
								<td><input type="text" name="email1"
									value="${requestScope.email1}" style="float: left;"><span
									class="" style="float: left">&nbsp;@&nbsp;</span> <input
									type="text" name="email2" value="${requestScope.email2}"
									style="magin-left: 0; float: left;"> <span
									style="width: 101px; user-select: none;"></span>&nbsp;<select
									name="email" id="option" onchange="select(this.value);"
									style="height: 25px">
										<option value="naver.com">naver.com</option>
										<option value="hanmail.com">hanmail.com</option>
										<option value="nate.com">nate.com</option>
										<option value="gmail.com">gmail.com</option>
										<option value="direct">직접입력</option>
								</select></td>
							</tr>

							<!-- 휴대전화 -->
							<tr>
								<th scope="row"><em class="ast">*</em> 휴대전화</th>
								<td><label for="mbno1" class="phoneComp">휴대폰국번</label>
									<div class="selector" id="uniform-mbno1"
										style="width: 50px; float: left">
										<span style="width: 43px; user-select: none; float: left">
										</span> <input type="text" name="tel1" size="3" maxlength="3"
											value="${requestScope.tel1}">
									</div> <span class="" style="float: left">&nbsp;-&nbsp;</span> <label
									for="mbno2" class="phoneNum1">휴대폰앞번호</label> <input type="text"
									class="uiform phoneNum1 text" id="mbno2" name="tel2"
									value="${requestScope.tel2}" maxlength="4"
									onkeyup="this.value=this.value.replace(/[^\d\ ]/g, '')"
									autocomplete="off" style="float: left;"> <span class=""
									style="float: left">&nbsp;-&nbsp;</span> <label for="mbno3"
									class="phoneNum2">휴대폰뒷번호</label> <input type="text"
									class="uiform phoneNum2 text" id="mbno3" name="tel3"
									value="${requestScope.tel3}" maxlength="4"
									onkeyup="this.value=this.value.replace(/[^\d\ ]/g, '')"
									autocomplete="off" style="float: left;"></td>
							</tr>
							<!-- 자택전화 -->

							<tr class="last">
								<th scope="row" class="last"><em class="ast">*</em> 주소</th>
								<td class="last">
									<div class="addressWrap">
										<div class="zipcode">
											<label class="zipcode1" for="zipcode1">우편번호앞자리</label><input
												type="text" name="addrNo" readonly="readonly"
												value="${memberData.addrNo}"> <input type="button"
												name="zip_search" value="우편번호 검색" onclick="zipSearch();"
												id="button">
										</div>

										<div class="addressOld">

											<div class="address1">
												<label class="address1" for="newAdr">주소구,동</label> <input
													type="text" name="addr1" size="70"
													value="${memberData.addr}"><br>
											</div>
											<div class="address2">
												<label class="address2" for="newDetlAdr">상세주소</label> <input
													type="text" name="addr2" style="width: 450px">
											</div>
										</div>
									</div>

								</td>
							</tr>

							<tr>
								<td colspan="2" align="center"><input type="submit"
									value="정보수정완료"> <input type="button" value="취소"
									onclick="main();">
								</td>
							</tr>

						</tbody>
					</table>
				</div>
			</div>
		</form>
		<p style="height: 500px;"></p>
		<c:import url="/WEB-INF/common/footer.jsp"></c:import>
	</center>
</body>
</html>