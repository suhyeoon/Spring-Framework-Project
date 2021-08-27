<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="u" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="<%=request.getContextPath()%>/css/common.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/css/review_write.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.2.0.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/guraUtil.js"></script>
<script type="text/javascript">
	function changeImg1(){
		$("#selectStar").css("width","10%");
		document.boardForm.grade.value = 0.5;
	}
	function changeImg2(){
		$("#selectStar").css("width","20%");
		document.boardForm.grade.value = 1.0;
	}
	function changeImg3(){
		$("#selectStar").css("width","30%");
		document.boardForm.grade.value = 1.5;
	}
	function changeImg4(){
		$("#selectStar").css("width","40%");
		document.boardForm.grade.value = 2.0;
	}
	function changeImg5(){
		$("#selectStar").css("width","50%");
		document.boardForm.grade.value = 2.5;
	}
	function changeImg6(){
		$("#selectStar").css("width","60%");
		document.boardForm.grade.value = 3.0;
	}
	function changeImg7(){
		$("#selectStar").css("width","70%");
		document.boardForm.grade.value = 3.5;
	}
	function changeImg8(){
		$("#selectStar").css("width","80%");
		document.boardForm.grade.value = 4.0;
	}
	function changeImg9(){
		$("#selectStar").css("width","90%");
		document.boardForm.grade.value = 4.5;
	}
	function changeImg10(){
		$("#selectStar").css("width","100%");
		document.boardForm.grade.value = 5.0;
	}

	function check(){
		
		if (document.boardForm.title.value == "") {
			alert("제목 입력하세요");
			boardForm.title.focus();
			return false;
		}//end if
		if (document.boardForm.contents.value == "") {
			alert("내용을 입력해주세요");
			boardForm.contents.focus();
			return false;
		}//end if
		
		if (document.boardForm.grade.value == "") {
			alert("별점을 입력해주세요");
			boardForm.grade.focus();
			return false;
		}//end if
		

		return true;
	}
	
	
	$(document).ready(function(){
		var imgNo =1;
		$('#addImage').click(function() {
			if(imgNo >= 5){
				alert("이미지는 최대 5개 까지만 가능합니다.");
			}
			else{
				var img = "image"+imgNo;
				$('#'+img).trigger('click');
				imgNo = parseInt(imgNo) + 1 ;	
			}
				
			
		  return false;
		 });
		
		
		 $('.fileInsert').click(function() { 
		  var contents = $('#contentsView').val();
		 /*  $('.contents').val(contents+"<img alt='여기에 이미지 이름을 넣으세요.' src='여기에 링크주소를 붙여넣으세요.'>"); */
		   $('#contents').val(contents+"<div class=\"newImage\"><img height='300px' width='300px' alt='여기에 이미지 이름을 넣으세요.' src='<%=request.getContextPath()%>/images/review/1.jpg'></div>"); 
		   $('#contentsView').val(contents+"여기에 첫번째 이미지가 들어갑니다.");
		  return false;
		 });
		});
	
</script>
<style type="text/css">
       #wrap {
	width: 800px;
	margin: 0 auto 0 auto;
}
#star ul{
	padding-left:5px;
	position:absolute;
}

#detailBoard {
	text-align: center;
}

#content {
	height: 400;
	font-family: '돋움';
	font-size: 12;
	vertical-align: top;
}

td {
	font-family: '돋움';
	font-size: 12;
	color: #666;
	border-bottom: #eceae1 solid 1px;
}

.contents{
	padding: 2px 2px;
}

.title{
	width:200px;
	height: 16;
	font-family: '돋움';
	font-size: 12;
	text-align: center;
	color: #666;
	background: #faf9f4;
	border: none;
	padding: 2px 13px;
	text-align: left;
	line-height: 22px;
	border-bottom: #eceae1 solid 1px;
	color: #333333;
	font-weight: bold;
}
.main{
	margin: 20px 0px 0px 0px;
	border: none;
	border-top: #cdcbbe solid 1px;

	border-collapse: collapse;
	table-layout: fixed;
}
.title2{
	width: 530px;
	text-align: left;
	padding-left: 5px;
}
        
    </style>

<title>게시글 쓰기</title>
</head>
<body>
<center>
<c:import url="/WEB-INF/common/top.jsp"></c:import>	
<c:import url="/WEB-INF/common/menu.jsp"></c:import>
<br>
<b><font size="6" color="gray">후기 게시판 글쓰기</font></b>
<h3>별점과 함께 후기글을 올려주세요</h3>
<form:form action="write" name="boardForm" method="post" modelAttribute="writeForm"
	enctype="multipart/form-data" onsubmit="return check()">
<input type="hidden" name="writer" value="${authUser}">
<input type="hidden" name="mo" value="${param.mo}">
<input type="hidden" name="modifyNo" value="${param.no}">
<input type="hidden" name="upDir"
	value="C:/Users/Administrator/Documents/work/sources/Spring/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/Resort/images/review/">
<table width="700px" border="1" bordercolor="lightgray" align="center">
	<tr>
		<td class="title" width="150px"><b>별점주기</b>
		</td>
		<td>
			<div id="star">
				<ul>
					<li>
						<div class="point1">
						<fmt:parseNumber var="pages" integerOnly="true" value="${board.grade * 20}"></fmt:parseNumber>
							<div class="point2" id="selectStar" style="width:100%;">
								<a href="#" >
									<img src="<%=request.getContextPath()%>/images/products/star_on.png" alt="10점 만점 중 1점"/>
								</a>
							</div>
						</div>
						<ul>
							<li>
								<div>
									<div>
									<a href="#" style="font-size:10pt;">0.5 ~ 5.0</a>
									</div>
								</div>
							</li>
							<li>
								<div class="point1">
									<div class="point2" onclick="changeImg1()" style="width:10%;">
									<a href="#"><img src="<%=request.getContextPath()%>/images/products/star_on.png" alt="10점 만점 중 0.5점"/>
									</a>
									</div>
								</div>
							</li>
							<li>
								<div class="point1">
									<div class="point2" onclick="changeImg2()" style="width:20%">
									<a href="#">
										<img src="<%=request.getContextPath()%>/images/products/star_on.png" alt="10점 만점 중 1점"/>
									</a>
									</div>
								</div>
							</li>
							<li>
								<div class="point1">
									<div class="point2" onclick="changeImg3()" style="width:30%">
									<a href="#">
										<img src="<%=request.getContextPath()%>/images/products/star_on.png" alt="10점 만점 중 1.5점"/>
									</a>
									</div>
								</div>
							</li>
							<li>
								<div class="point1">
									<div class="point2" onclick="changeImg4()" style="width:40%">
									<a href="#">
										<img src="<%=request.getContextPath()%>/images/products/star_on.png" alt="10점 만점 중 2.0점"/>
									</a>
									</div>
								</div>
							</li>
							<li>
								<div class="point1">
									<div class="point2" onclick="changeImg5()" style="width:50%">
									<a href="#">
										<img src="<%=request.getContextPath()%>/images/products/star_on.png" alt="10점 만점 중 2.5점"/>
									</a>
									</div>
								</div>
							</li>
							<li>
								<div class="point1">
									<div class="point2" onclick="changeImg6()" style="width:60%">
									<a href="#">
										<img src="<%=request.getContextPath()%>/images/products/star_on.png" alt="10점 만점 중 3.0점"/>
									</a>
									</div>
								</div>
							</li>
							<li>
								<div class="point1">
									<div class="point2" onclick="changeImg7()" style="width:70%">
									<a href="#">
										<img src="<%=request.getContextPath()%>/images/products/star_on.png" alt="10점 만점 중 3.5점"/>
									</a>
									</div>
								</div>
							</li>
							<li>
								<div class="point1">
									<div class="point2" onclick="changeImg8()" style="width:80%">
									<a href="#">
										<img src="<%=request.getContextPath()%>/images/products/star_on.png" alt="10점 만점 중 4.0점"/>
									</a>
									</div>
								</div>
							</li>
							<li>
								<div class="point1">
									<div class="point2" onclick="changeImg9()" style="width:90%">
									<a href="#">
										<img src="<%=request.getContextPath()%>/images/products/star_on.png" alt="10점 만점 중 4.5점"/>
									</a>
									</div>
								</div>
							</li>
							<li>
								<div class="point1">
									<div class="point2" onclick="changeImg10()" style="width:100%">
									<a href="#">
										<img src="<%=request.getContextPath()%>/images/products/star_on.png" alt="5점 만점 중 5점"/>
									</a>
									</div>
								</div>
							</li>
						</ul>
					</li>
				</ul>
			</div>
			<input type="hidden" name="grade" value="${board.grade}">
		</td>
		<tr>
			<td class="title">
				<b>제목</b>
			</td>
			<td>
				<input type="text" size="70" name="title" value="${board.title}">
			<c:if test="${errors.title}">제목을 입력하세요.</c:if>
			</td>
		</tr>
		<tr>
			<td class="title">
				<b>내용</b>
			</td>
			<td>
				<textarea name="contentsView" id="contentsView" rows="35" cols="70">${board.contents}</textarea>
				<textarea style="display:none" name="contents" id="contents" rows="35" cols="70">${board.contents}
				</textarea>
				<script>
                	var result = document.getElementById("contents").value;
                	document.getElementById("contents").value = result.replace(/<br\s*\/?>/mg,"\r\n");
                </script>  
			</td>
		</tr>
		<tr>
			<td class="title" align="center">이미지1</td>
			<td><input type="button" name="addImage" size="40" id="addImage" value="이미지 업로드">
				<input type="file" style="display:none" name="images[0]" size="40" id="image1">
				<input type="file" style="display:none" name="images[1]" size="40" id="image2">
				<input type="file" style="display:none" name="images[2]" size="40" id="image3">
				<input type="file" style="display:none" name="images[3]" size="40" id="image4">
				<input type="file" style="display:none" name="images[4]" size="40" id="image5">
			</td>
		</tr>
		<tr>
			<td class="title" align="center">이미지2</td>
			<td></td>
		</tr>
		<tr>
			<td class="title" align="center">이미지3</td>
			<td></td>
		</tr>
		<tr>
			<td colspan=2 align="center">
				<c:if test="${param.mo==0}">
                <input type="submit" value="등록">
                </c:if>
                <c:if test="${param.mo==1}">
                <input type="submit" value="수정">
                </c:if>
				<input type="button" value="목록" onclick="javascript:location.href='list'">
				<input type="button" class="fileInsert" value="추가">
			</td>
		</tr>
	</table>
</form:form>
<c:if test="${write.write}">
	<script type="text/javascript">
		alert("글쓰기에 성공했습니다.\n 목록 페이지로 이동합니다.");
		location.href="list";
	</script>
</c:if>
<c:if test="${modify.modify}">
	<script type="text/javascript">
		alert("글수정에 성공했습니다.\n 목록 페이지로 이동합니다.");
		location.href="list";
	</script>
</c:if>
<c:if test="${error.error}">
	<script type="text/javascript">
		alert("제목 또는 내용의 최대 글자 수를 초과했습니다.");
		location.href="list";
	</script>
</c:if>

<p style="height:50px;"></p>
<c:import url="/WEB-INF/common/footer.jsp"></c:import>
</center>
</body>
</html>