<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="<%=request.getContextPath()%>/css/common.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/css/main.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/css/specialoffers.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="js/mainScroll1.js"></script>
<script type="text/javascript" src="js/mainScroll2.js"></script>
<style type="text/css">
	#imgMainDiv{
		z-index:500;
		top:30px;
		position:absolute;
	}
	.imgMain{
		z-index:500;
	}
	#imgMain{
		width:100px;
		height:30px;
		border-radius:25px;
		border:1px;
		background:#ece698;
	}
	#imgViewDiv{
		z-index:500;
		top:30px;
		position:absolute;
	}
	.imgView{
		z-index:500;
		padding:4px 0px;
	}
	#imgView{
		width:100px;
		height:30px;
		border-radius:25px;
		border:1px;
		background:#ece698;
	}
	
	#imgRoomsDiv{
		z-index:500;
		top:30px;
		position:absolute;
	}
	.imgRooms{
		z-index:500;
		padding:4px 0px;
	}
	#imgRooms{
		width:100px;
		height:30px;
		border-radius:25px;
		border:1px;
		background:#ece698;
	}
	
	#imgMealDiv{
		z-index:500;
		top:30px;
		position:absolute;
	}
	.imgMeal{
		z-index:500;
		padding:4px 0px;
	}
	#imgMeal{
		width:100px;
		height:30px;
		border-radius:25px;
		border:1px;
		background:#ece698;
	}
	
	.btnPackage{
		display:none;
		left: 600px;
		position:absolute;
		width:80px;
		height:20px;
		border-radius:25px;
		border:1px;
		background:#ece698;
	}
	
	.btnAdd{
		position:absolute;
		width:80px;
		height:20px;
		border-radius:25px;
		border:1px;
		background:#ece698;
	}
	
	.packageContUpdate{
		display: none;
    	float: left;
    	width: 556px;
	}
</style>
<script>
$(document).ready(function(){
	
		if($("#userGrade").val()=="관리자"){

		$("#imgMain").click(function(){
			$('#imgMain1').css('display','inline').attr('disabled',false);
 			$('#imgMain2').css('display','inline').attr('disabled',false);
 			$('#imgMain3').css('display','inline').attr('disabled',false);
 			$('#imgMainUpdate').css('display','inline');
		});
		
		$("#imgView").click(function(){
			$('#imgView').css('display','block');
			$('#imgView1').css('display','block').attr('disabled',false);
 			$('#imgView2').css('display','block').attr('disabled',false);
 			$('#imgView3').css('display','block').attr('disabled',false);
 			$('#imgViewUpdate').css('display','block');
		});
		
		$("#imgRooms").click(function(){
			$('#imgRooms').css('display','block');
			$('#imgRooms1').css('display','block').attr('disabled',false);
 			$('#imgRooms2').css('display','block').attr('disabled',false);
 			$('#imgRooms3').css('display','block').attr('disabled',false);
 			$('#imgRoomsUpdate').css('display','block');
		});
		
		$("#imgMeal").click(function(){
			$('#imgMeal').css('display','block');
			$('#imgMeal1').css('display','block').attr('disabled',false);
 			$('#imgMeal2').css('display','block').attr('disabled',false);
 			$('#imgMeal3').css('display','block').attr('disabled',false);
 			$('#imgMealUpdate').css('display','block');
		});
		//수정 클릭
		$("#btnUpdatePackage1").click(function(){
			$('#btnUpdatePackage1').css('display','none');
			$("#packageCont1").css('display','none');
			
			$('#btnSuccessPackage1').css('display','block').css('z-index','1');
			$('#btnCancelPackage1').css('display','block').css('left','700px').css('z-index','1');
			$("#packageContUpdate1").css('display','block');
			$("#imgUpdatePackage1").css('display','block');
			
		});
		// 취소 클릭
		$("#btnCancelPackage1").click(function(){
			$("#btnUpdatePackage1").css('display','block');
			$("#packageCont1").css('display','block');
			
			$("#packageContUpdate1").css('display','none');
			$('#btnSuccessPackage1').css('display','none');
			$('#btnCancelPackage1').css('display','none');
			$("#imgUpdatePackage1").css('display','none');
			
		});
		
		//수정 클릭
		$("#btnUpdatePackage2").click(function(){
			$('#btnUpdatePackage2').css('display','none');
			$("#packageCont2").css('display','none');
			
			$('#btnSuccessPackage2').css('display','block').css('z-index','1');
			$('#btnCancelPackage2').css('display','block').css('left','700px').css('z-index','1');
			$("#packageContUpdate2").css('display','block');
			$("#imgUpdatePackage2").css('display','block');
			
		});
		// 취소 클릭
		$("#btnCancelPackage2").click(function(){
			$("#btnUpdatePackage2").css('display','block');
			$("#packageCont2").css('display','block');
			
			$("#packageContUpdate2").css('display','none');
			$('#btnSuccessPackage2').css('display','none');
			$('#btnCancelPackage2').css('display','none');
			$("#imgUpdatePackage2").css('display','none');
			
		});
		
		//수정 클릭
		$("#btnUpdatePackage3").click(function(){
			$('#btnUpdatePackage3').css('display','none');
			$("#packageCont3").css('display','none');
			
			$('#btnSuccessPackage3').css('display','block').css('z-index','1');
			$('#btnCancelPackage3').css('display','block').css('left','700px').css('z-index','1');
			$("#packageContUpdate3").css('display','block');
			$("#imgUpdatePackage3").css('display','block');
			
		});
		// 취소 클릭
		$("#btnCancelPackage3").click(function(){
			$("#btnUpdatePackage3").css('display','block');
			$("#packageCont3").css('display','block');
			
			$("#packageContUpdate3").css('display','none');
			$('#btnSuccessPackage3').css('display','none');
			$('#btnCancelPackage3').css('display','none');
			$("#imgUpdatePackage3").css('display','none');
			
		});
	
		$(".cycle-slideshow").hover(
	 	 function () {
	 	//마우스 올렸을때
	    	$('#imgMain').css('display','inline');
	 	 }, 
	 	 function () {
	   	//마우스 뗏을때
	 		$('#imgMain').css('display','none');
	 		$('#imgMain1').css('display','none').attr('disabled',true);
	 		$('#imgMain2').css('display','none').attr('disabled',true);
	 		$('#imgMain3').css('display','none').attr('disabled',true);
	 		$('#imgMainUpdate').css('display','none');
	 	 });
		
		$("#viewDiv").hover(
		function () {
		//마우스 올렸을때
			$('#imgView').css('display','inline');
		}, 
		function () {
		//마우스 뗏을때
			$('#imgView').css('display','none');
			$('#imgView1').css('display','none');
			$('#imgView2').css('display','none');
			$('#imgView3').css('display','none');
			$('#imgViewUpdate').css('display','none');
		});
		
		$("#roomsDiv").hover(
				function () {
				//마우스 올렸을때
					$('#imgRooms').css('display','inline');
				}, 
				function () {
				//마우스 뗏을때
					$('#imgRooms').css('display','none');
					$('#imgRooms1').css('display','none');
					$('#imgRooms2').css('display','none');
					$('#imgRooms3').css('display','none');
					$('#imgRoomsUpdate').css('display','none');
				});
		
		$("#mealDiv").hover(
				function () {
				//마우스 올렸을때
					$('#imgMeal').css('display','inline');
				}, 
				function () {
				//마우스 뗏을때
					$('#imgMeal').css('display','none');
					$('#imgMeal1').css('display','none');
					$('#imgMeal2').css('display','none');
					$('#imgMeal3').css('display','none');
					$('#imgMealUpdate').css('display','none');
				});
		
		$("#box1").hover(
				function () {
				//마우스 올렸을때
					$('#btnUpdatePackage1').css('display','inline');
					$('#btnDeletePackage1').css('display','block').css('left','700px');
				}, 
				function () {
				//마우스 뗏을때
					$('#btnUpdatePackage1').css('display','none');
					$('#btnDeletePackage1').css('display','none');
				});
		$("#box2").hover(
				function () {
				//마우스 올렸을때
					$('#btnUpdatePackage2').css('display','inline');
					$('#btnDeletePackage2').css('display','block').css('left','700px');
				}, 
				function () {
				//마우스 뗏을때
					$('#btnUpdatePackage2').css('display','none');
					$('#btnDeletePackage2').css('display','none');
				});
		$("#box3").hover(
				function () {
				//마우스 올렸을때
					$('#btnUpdatePackage3').css('display','inline');
					$('#btnDeletePackage3').css('display','block').css('left','700px');
				}, 
				function () {
				//마우스 뗏을때
					$('#btnUpdatePackage3').css('display','none');
					$('#btnDeletePackage3').css('display','none');
				});
		}
});

function selectTitle(tit,no){
	var nName = "cname"+no;
	document.getElementById("name").value = tit;
	document.getElementById("name2").value = tit;
	document.getElementById(nName).value = tit;
}

function addPackage(){
	$('#addPackage').css('display','block');
}

function check(){
	var name = document.packageInsertForm.name.value;
	if(document.packageInsertForm.image.value == ""){
		alert("이미지를 등록해주세요.");
		return false;
	}
	if($('#existName1').val() != null){
		var eName = $('#existName1').val();
		if(name==eName){
			alert("이미 존재하는 패키지입니다.");
			return false;
		}
	}
	if($('#existName2').val() != null){
		var eName = $('#existName2').val();
		if(name==eName){
			alert("이미 존재하는 패키지입니다.");
			return false;
		}
	}
	
}

function updateCheck(no){
	var nName = "cname"+no;
	var eName = "existName";
	var name = document.getElementById(nName).value;
	for(var i = 1; i < 4; i++){
		if(no!=i){
			var exName = eName + i;
			if(document.getElementById(exName).value != null){
				var vName = document.getElementById(exName).value;	
				if(name==vName){
					alert("이미 존재하는 패키지의 이름으로 수정은 불가능합니다.");
					return false;
				}
			}
		}
	}
}

function deletePackage(no){
	var nName = "cname" +no;
	var name = document.getElementById(nName).value;
	location.href="packageContentsDelete?name="+name;
}

</script>
<title>메인화면</title>
</head>
<body style="overflow-x:hidden;">
<div id="wrap">
<c:import url="/WEB-INF/common/top.jsp"></c:import>
<input type="hidden" id="userGrade" value="${sessionScope.authGrade}">
<div class="cycle-slideshow" 
style="text-align:center;overflow:hidden;width:100%;"
    data-cycle-timeout="2000"
    data-cycle-fx="scrollHorzs">
    <c:if test="${sessionScope.authGrade=='관리자'}">
    <form:form action="imageUpdate" name="mainImageForm" method="post" modelAttribute="writeForm"
	enctype="multipart/form-data">
	<input type="hidden" name="upDir"
	value="C:/Users/Administrator/Documents/work/sources/Spring/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/Resort/images/main/mainScroll">
	<div id="imgMainDiv" align="right">
		<input type="button" style="display:none" class="imgMain" value="이미지 수정" id="imgMain">
		<input type="file" style="display:none" class="imgMain" name="images[0]" value="첫번째 이미지 수정" id="imgMain1" disabled="disabled" >
		<input type="file" style="display:none" class="imgMain" name="images[1]" value="두번째 이미지 수정" id="imgMain2" disabled="disabled">
		<input type="file" style="display:none" class="imgMain" name="images[2]" value="세번째 이미지 수정" id="imgMain3" disabled="disabled">
		<input type="submit" style="display:none" class="imgMain" value="업데이트" id="imgMainUpdate">
	</div>
	</form:form>
	</c:if>
	<div class="cycle-pager">
	</div>
	<img src="images/main/mainScroll1.jpg" width="100%" height="600">
	<img src="images/main/mainScroll2.jpg" width="100%" height="600">
	<img src="images/main/mainScroll3.jpg" width="100%" height="600">
	
</div>
<c:import url="/WEB-INF/common/menu.jsp"></c:import>
<div id="mainContent">
	<div id="contentImg">
	<div class="imgGroup" >
		<h2>View</h2>
		<div class="cycle-slideshow subslide" id="viewDiv"
		data-cycle-fx=scrollHorz
		data-cycle-timeout=3000>
		<c:if test="${sessionScope.authGrade=='관리자'}">
    <form:form action="imageUpdate" name="mainImageForm" method="post" modelAttribute="writeForm"
	enctype="multipart/form-data">
	<input type="hidden" name="upDir"
	value="C:/Users/Administrator/Documents/work/sources/Spring/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/Resort/images/viewScroll">
	<div id="imgViewDiv">
		<input type="button" style="display:none" class="imgView" value="이미지 수정" id="imgView">
		<input type="file" style="display:none" class="imgView" name="images[0]" value="첫번째 이미지 수정" id="imgView1" >
		<input type="file" style="display:none" class="imgView" name="images[1]" value="두번째 이미지 수정" id="imgView2" >
		<input type="file" style="display:none" class="imgView" name="images[2]" value="세번째 이미지 수정" id="imgView3" >
		<input type="submit" style="display:none" class="imgView" value="업데이트" id="imgViewUpdate">
	</div>
	</form:form>
	</c:if>
		<div class="cycle-pager"></div>
		<img src="images/viewScroll1.jpg" width="370" height="185" style="margin:0 auto;">
		<img src="images/viewScroll2.jpg" width="370" height="185" style="margin:0 auto;">
		<img src="images/viewScroll3.jpg" width="370" height="185" style="margin:0 auto;">
		</div>
	</div>
	
	<div class="imgGroup">
		<h2>Rooms</h2>
		<div class="cycle-slideshow subslide" id="roomsDiv"
		data-cycle-fx=scrollHorz
		data-cycle-timeout=3000>	
		<c:if test="${sessionScope.authGrade=='관리자'}">
    <form:form action="imageUpdate" name="mainImageForm" method="post" modelAttribute="writeForm"
	enctype="multipart/form-data">
	<input type="hidden" name="upDir"
	value="C:/Users/Administrator/Documents/work/sources/Spring/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/Resort/images/roomsScroll">
	<div id="imgRoomsDiv">
		<input type="button" style="display:none" class="imgRooms" value="이미지 수정" id="imgRooms">
		<input type="file" style="display:none" class="imgRooms" name="images[0]" value="첫번째 이미지 수정" id="imgRooms1" >
		<input type="file" style="display:none" class="imgRooms" name="images[1]" value="두번째 이미지 수정" id="imgRooms2" >
		<input type="file" style="display:none" class="imgRooms" name="images[2]" value="세번째 이미지 수정" id="imgRooms3" >
		<input type="submit" style="display:none" class="imgRooms" value="업데이트" id="imgRoomsUpdate">
	</div>
	</form:form>
	</c:if>
		<img src="images/roomsScroll1.jpg" width="370" height="185" style="margin:0 auto;">
		<img src="images/roomsScroll2.jpg" width="370" height="185" style="margin:0 auto;">
		<img src="images/roomsScroll3.jpg" width="370" height="185" style="margin:0 auto;">
		</div>
	</div>
	
	<div class="imgGroup">
		<h2>Today's Meal</h2>
		<div class="cycle-slideshow subslide" id="mealDiv"
		data-cycle-fx=scrollHorz
		data-cycle-timeout=3000>
		<c:if test="${sessionScope.authGrade=='관리자'}">
    <form:form action="imageUpdate" name="mainImageForm" method="post" modelAttribute="writeForm"
	enctype="multipart/form-data">
	<input type="hidden" name="upDir"
	value="C:/Users/Administrator/Documents/work/sources/Spring/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/Resort/images/mealScroll">
	<div id="imgMealDiv">
		<input type="button" style="display:none" class="imgMeal" value="이미지 수정" id="imgMeal">
		<input type="file" style="display:none" class="imgMeal" name="images[0]" value="첫번째 이미지 수정" id="imgMeal1" >
		<input type="file" style="display:none" class="imgMeal" name="images[1]" value="두번째 이미지 수정" id="imgMeal2" >
		<input type="file" style="display:none" class="imgMeal" name="images[2]" value="세번째 이미지 수정" id="imgMeal3" >
		<input type="submit" style="display:none" class="imgMeal" value="업데이트" id="imgMealUpdate">
	</div>
	</form:form>
	</c:if>
		<img src="images/mealScroll1.jpg" width="370" height="185" style="margin:0 auto;">
		<img src="images/mealScroll2.jpg" width="370" height="185" style="margin:0 auto;">
		<img src="images/mealScroll3.jpg" width="370" height="185" style="margin:0 auto;">
			</div>
		</div>
	</div>
	<div id="content2_outline">
		<div id="content2">
			<div id="con2_letter">
				<p style="height:50px;"></p>
				<p><b style="font-size:17pt;">글램핑 & 바비큐</b></p>
				<p style="font-size:14pt;">Glamping Village 체험</p>
				<p style="font-size:10pt;">카바나 스타일의 넓고 아늑한 텐트에서 즐기는 바비큐 파티의 낭만<br>
				세계적인 럭셔리 아웃도어 트랜드 글램핑에서 만나보세요.</p>
				<br><br>
				<a href="${pageContext.request.contextPath}/activity/camp?check=camp"><img src="images/main/btn.gif"></a>
			</div>
			<div id="con2_img">
				<img alt="글램핑" src="images/contents/activ/GCV/R000000009W5_KR.jpg" width="700" height="400">
			</div>	
		</div>
	</div>
	<div class="ctnSpOffer ctnPackage">
			<div class="headTit">
				<img alt="객실패키지"
				src="${pageContext.request.contextPath}/images/contents/main_img/subTitleSpOffer.gif"
				style="padding-left:50px;">
				<c:if test="${sessionScope.authGrade=='관리자'}">
				<c:if test="${packages.size()<3 }">
					<input type="button" class="btnAdd" onclick=addPackage() value="추가">
				</c:if>
				</c:if>
			</div>
			<div class="recomProduct">
				<div class="packageWrap">
					<div class="bbsTotal"></div>
					<div class="packList" style="padding-left: 0px">
						<ul class="list">
						<c:forEach var="list" items="${requestScope.packages}" varStatus="st">
							<input type="hidden" id="existName${st.index+1}" value="${list.name}">
							<li class="packBox">
							<form:form action="packageUpdate" name="packageUpdateForm" method="post" modelAttribute="writeForm"
							enctype="multipart/form-data" onsubmit="return updateCheck(${st.index+1 })">
								<div class="box" id="box${st.index+1 }">
									<div class="photo">
										<img src="<%=request.getContextPath()%>/images/contents/main_img/${st.index+1}.jpg"
											class="img" alt="제주신라호텔 낮 전경 사진"
											style="width: 270px; height: 160px;">
										<input type="file" style="display:none" name="image" value="수정 할 이미지" id="imgUpdatePackage${st.index+1 }" >
									</div>
									<div class="packDesc">
									<input type="button" class="btnPackage" id="btnUpdatePackage${st.index+1 }" value="수정">
									<input type="submit" class="btnPackage" id="btnSuccessPackage${st.index+1 }" value="완료">
									<input type="button" class="btnPackage" id="btnCancelPackage${st.index+1 }" value="취소">
									<input type="button" class="btnPackage" id="btnDeletePackage${st.index+1 }" value="삭제" onclick=deletePackage(${st.index+1})>
										<div class="packageCont" id="packageCont${st.index+1 }">
										<h5 class="tit">
											${list.name }
										</h5>
										<p class="date">${list.startDate } ~ ${list.endDate }</p>
										<ul class="packDescList">
											<c:forEach var="cont" items="${list.arrCont}">
											<li>${cont}</li>
											</c:forEach>
										</ul>
										<p class="price">${list.minPrice }&nbsp;원 ~ ${list.maxPrice }&nbsp;원</p>
										</div>
										
										<div class="packageContUpdate" id="packageContUpdate${st.index+1 }">
										<input type="hidden" name="name" id="name" value="${list.name }">
										<input type="hidden" name="cname${st.index+1 }" id="cname${st.index+1 }" value="${list.name }">
										<input type="hidden" name="oldName" value="${list.name }">
										<input type="hidden" name="no" value="${st.index+1 }">
										제목 &nbsp;&nbsp;<select id="sTitle" name="sTitle" style="width: 200px;" onchange="selectTitle(this.value,${st.index+1 });">
												<c:forEach var="nList" items="${requestScope.names}">
													<c:if test="${list.name eq nList.name}">	
														<option value="${nList.name}" selected>${nList.name}</option>
													</c:if>
													<c:if test="${list.name ne nList.name}">	
														<option value="${nList.name}">${nList.name}</option>
													</c:if>
												</c:forEach>
											</select><br><br>
										내용 <br>
										<ul class="packDescList">
											<li><input type="text" name="arrCont[0]" size="25" maxlength="30" value="${list.arrCont[0] }"></li>
											<li><input type="text" name="arrCont[1]" size="25" maxlength="30" value="${list.arrCont[1] }"></li>
											<li><input type="text" name="arrCont[2]" size="25" maxlength="30" value="${list.arrCont[2] }"></li>
											<li><input type="text" name="arrCont[3]" size="25" maxlength="30" value="${list.arrCont[3] }"></li>
											<li><input type="text" name="arrCont[4]" size="25" maxlength="30" value="${list.arrCont[4] }"></li>
										</ul>
										</div>
									</div>
								</div>
								</form:form>
							</li>
						</c:forEach>
						
						<li class="packBox" id="addPackage" style="display:none">
						<form:form action="packageInsert" name="packageInsertForm" method="post" modelAttribute="writeForm"
						enctype="multipart/form-data" onsubmit="return check()">
								<div class="box">
									<div class="photo">
										<input type="file" name="image" value="이미지 등록" id="image">
									</div>
									<div class="packDesc">
									<input type="hidden" name="btnCheck" value="">
									
										<div id="packageContUpdate1" style="display:block">
										<input type="hidden" name="no" id="chkNo" value=${requestScope.packages.size() }>
										<input type="submit" class="btnPackage" id="btnSuccessPackage1" value="완료" style="display:block">
										<input type="hidden" name="name" id="name2" value="${requestScope.names[0].name}">
										제목 &nbsp;&nbsp;<select id="sTitle" name="sTitle" style="width: 200px;" onchange="selectTitle(this.value);">
												<c:forEach var="nList" items="${requestScope.names}">
													<option value="${nList.name}">${nList.name}</option>
												</c:forEach>
											</select><br><br>
										내용 <br>
										<ul class="packDescList">
											<li><input type="text" name="arrCont[0]" size="25" maxlength="30"></li>
											<li><input type="text" name="arrCont[1]" size="25" maxlength="30"></li>
											<li><input type="text" name="arrCont[2]" size="25" maxlength="30"></li>
											<li><input type="text" name="arrCont[3]" size="25" maxlength="30"></li>
											<li><input type="text" name="arrCont[4]" size="25" maxlength="30"></li>
										</ul>
										</form:form>
										</div>
									</div>
								</div>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<c:if test="${image}">
	<script type="text/javascript">
		alert("이미지를 선택해주세요.");
	</script>
	</c:if>
	<c:if test="${result}">
	<script type="text/javascript">
		alert("이미 존재하는 패키지입니다.");
	</script>
	</c:if>
<c:import url="/WEB-INF/common/footer.jsp"></c:import>
</div>

</body>
</html>