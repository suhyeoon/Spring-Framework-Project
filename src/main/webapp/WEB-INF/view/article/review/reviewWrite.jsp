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
		
		
		if (document.boardForm.grade.value == "") {
			alert("별점을 입력해주세요");
			boardForm.grade.focus();
			return false;
		}//end if
		
		transCont();
		
		if (document.boardForm.transCont.value == "") {
			alert("내용을 입력해주세요");
			boardForm.contents.focus();
			return false;
		}//end if
		return true;
	}
	
	
	$(document).ready(function(){

		$('#addImage').click(function() {
			var imgNo = document.getElementById("imgNo").value;
			var img = "image"+imgNo;
			var hidden = "hdImg"+imgNo;
			if(document.getElementById("chkImgVal"+imgNo).value!=''){
				imgNo = parseInt(imgNo) +1;
				img = "image"+imgNo;
				if(imgNo > 3){
					alert("이미지는 최대 3개 까지만 가능합니다.");
					return;
				}
				if(document.getElementById("chkImgVal"+imgNo).value!=''){
					imgNo = parseInt(imgNo) +1;
				}
			}
			
			if(imgNo > 3){
				alert("이미지는 최대 3개 까지만 가능합니다.");
			} else {
				
				$('#' + img).trigger('click');
				$('#' + img).unbind('change');
				$('#' + img).on("change",function(){
					img = "image"+imgNo;
					hidden = "hdImg"+imgNo;
					var imgPath = $('#' + img).val();
					var imgName = imgPath.substring(imgPath.lastIndexOf('\\')+1, imgPath.length);
					
					document.getElementById("chkImgVal"+imgNo).value = $('#' + img).val();
					
					var tr = "sImg td:eq("+ (imgNo-1) +")";
					var	row = "<td id=tdImg"+ imgNo +" style='width:210px; border:none;'><a onclick='addImgtoCont("+ imgNo +")'><img id='" + hidden + "' style='display:none;'></a></td>"
					$('#'+tr).after(row);
					document.getElementById("imgNo").value= parseInt(imgNo) +1;
					var opt = {
					        img: $('#' + hidden),
					        w: 205,
					        h: 205
					};
					
					var defaultOpt = {
					        inputFile: $(this),
					        img: null,
					        w: 205,
					        h: 205
					};
					$.extend(defaultOpt, opt);
			        
			        var previewImage = function(){
				        if (!defaultOpt.inputFile || !defaultOpt.img) return;
				 
				        var inputFile = defaultOpt.inputFile.get(0);
				        var img       = defaultOpt.img.get(0);
				 
				        // FileReader
				        if (window.FileReader) {
				            // image 파일만
				            if (!inputFile.files[0].type.match(/image\//)) return;

				            // preview
				            try {
				                var reader = new FileReader();
				                reader.onload = function(e){
				                    img.src = e.target.result;
				                    img.style.width  = defaultOpt.w+'px';
				                    img.style.height = defaultOpt.h+'px';
				                    img.style.display = '';
				                }
				                reader.readAsDataURL(inputFile.files[0]);
				            } catch (e) {
				                // exception...
				            }
				        } 
				    };
				  previewImage();
			    });
			}
		});
	});
	
	function deleteImages(){
		var no = document.getElementById("clickedImgNo").value;
		var img = "image"+no;
		var hdImg = "hdImg" +no;
		
		if(no=="0"){
			alert("삭제할 이미지를 선택해주세요.");
			return;
		}
		
		$('#'+hdImg).css('border','none');
		document.getElementById("chkImg"+no).value = "x";
		document.getElementById("chkImgVal"+no).value = '';
		
		$('#'+img).val('');
		document.getElementById("imgNo").value = no;
		var td = "tdImg"+ no;
		$('#'+td).remove();
		var contImg = "contImg"+no; 
		$('#'+contImg).remove();
		
		document.getElementById("imgNo").value = 1;
	}
	
	function addImgtoCont(no){
		var chk = document.getElementById("chkImg"+no).value;
		var hdImg = "hdImg" +no;
		document.getElementById("clickedImgNo").value= no;
		
		if(chk=="x"){
			$('#'+hdImg).css('border','3px solid red');
			document.getElementById("chkImg"+no).value = "o";
			
			var contentsView = $('#contentsView').html();
	    	var contImg = "contImg"+no; 
	    	$('#contentsView').html(contentsView+
			"<img id='" + contImg + "' src='"+ $('#'+hdImg).attr('src') +"' style='width:300px; height:300px;'>");

		}
		else{
			$('#'+hdImg).css('border','none');
			document.getElementById("chkImg"+no).value = "x";
			var contImg = "contImg"+no; 
			$('#'+contImg).remove();
		}
	}
	
	function transCont(){
		var contentsView = $('#contentsView').html();
		
		contentsView = contentsView.replace(/contImg/g,"rImg");
		$('#rCont').html(contentsView);
		var rImg = "rImg";
		for(var i = 1 ; i < 4 ; i++){
			rImg += i;
		
			$('#'+rImg).attr('src','');
			$('#'+rImg).attr('style','');
			rImg = "rImg";
		}
		$('#contents').val($('#rCont').html());
	}
	
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
	width:130px;
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
<input type="hidden" name="contents" id="contents" value="">
<input type="hidden" name="upDir"
	value="C:/Users/Administrator/Documents/work/sources/Spring/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/Resort/images/review/">
	
<input type="hidden" id="imgPath1" value="${board.image1}">
<input type="hidden" id="imgPath2" value="${board.image2}">
<input type="hidden" id="imgPath3" value="${board.image3}">
<input type="hidden" id="loadImg" value="<%=request.getContextPath()%>/images/review/">
	
<table width="800px" border="1" bordercolor="lightgray" align="center">
	<tr>
		<td class="title" width="130px"><b>별점주기</b>
		</td>
		<td colspan="3" width="670px">
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
			<td colspan="3" width="570px">
				<input type="text" size="70" name="title" value="${board.title}">
			<c:if test="${errors.title}">제목을 입력하세요.</c:if>
			</td>
		</tr>
		<tr>
			<td class="title">
				<b>내용</b>
			</td>
			<td colspan="3">
				<div contentEditable="true" id="contentsView" style="height:600px;overflow:auto;">${board.contents }</div>
				<script>
					
					var contentsView = $('#contentsView').html();
				
					contentsView = contentsView.replace(/rImg/g,"contImg");
					$('#contentsView').html(contentsView);
				
        			for(var i = 1 ; i < 4 ; i++){
           				var imgPath = "imgPath"+i;
            			var contImg = "contImg"+i;
            			var loadImg = document.getElementById("loadImg").value + $('#'+imgPath).val();
        				$('#'+contImg).attr('src',loadImg);
        				$('#'+contImg).attr('style','width:300px; height:300px');
        			}
  			 	</script> 
			</td>
		</tr>
		<tr>
			<td class="title" align="center">이미지</td>
			<td colspan="3">
				<input type="button" name="addImage" size="40" id="addImage" value="이미지 업로드">
				&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="button" name="deleteImage" size="40" id="deleteImage" value="선택 이미지 삭제" 
				onclick=deleteImages()>
				<input type="file" style="display:none;" name="images[0]" id="image1" size="40">
				<input type="file" style="display:none;" name="images[1]" id="image2" size="40">
				<input type="file" style="display:none;" name="images[2]" id="image3" size="40">
				<input type="hidden" name="chkImg1" id="chkImg1" value="x">
				<input type="hidden" name="chkImg2" id="chkImg2" value="x">
				<input type="hidden" name="chkImg3" id="chkImg3" value="x">
				<input type="hidden" name="chkImgVal1" id="chkImgVal1" value="${board.image1 }">
				<input type="hidden" name="chkImgVal2" id="chkImgVal2" value="${board.image2 }">
				<input type="hidden" name="chkImgVal3" id="chkImgVal3" value="${board.image3 }">
				<input type="hidden" name="oldImg1" value="${board.image1 }">
				<input type="hidden" name="oldImg2" value="${board.image2 }">
				<input type="hidden" name="oldImg3" value="${board.image3 }">
				<input type="hidden" id="imgNo" value="1">
				<input type="hidden" id="clickedImgNo" value="0">
			</td>
		</tr>
		<tr class="tr1" id="sImg" height="210px">
			<td class="title" align="center" style='width:130px'>선택된 이미지</td>
			<c:if test="${not empty board.image1 }">
			<td id="tdImg1" style="width:210px; border:none;">
			<a onclick="addImgtoCont(1)">
			<img id="hdImg1" src="<%=request.getContextPath()%>/images/review/${board.image1}" style='width:205px;height:205px'></a></td>
			<script>
				$('#hdImg1').css('border','3px solid red');
				document.getElementById("chkImg1").value = "o";
			</script>
			</c:if>
			<c:if test="${not empty board.image2 ne '' }">
			<td id="tdImg2" style="width:210px; border:none;">
			<a onclick="addImgtoCont(2)">
			<img id="hdImg2" src="<%=request.getContextPath()%>/images/review/${board.image2}" style='width:205px;height:205px'></a></td>
			<script>
				$('#hdImg2').css('border','3px solid red');
				document.getElementById("chkImg2").value = "o";
			</script>
			</c:if>
			<c:if test="${not empty board.image3 ne '' }">
			<td id="tdImg3" style="width:210px; border:none;">
			<a onclick="addImgtoCont(3)">
			<img id="hdImg3" src="<%=request.getContextPath()%>/images/review/${board.image3}" style='width:205px;height:205px'></a></td>
			<script>
				$('#hdImg3').css('border','3px solid red');
				document.getElementById("chkImg3").value = "o";
			</script>
			</c:if>
		</tr>
		<tr>
			<td colspan=4 align="center">
				<c:if test="${param.mo==0}">
                <input type="submit" value="등록">
                </c:if>
                <c:if test="${param.mo==1}">
                <input type="submit" value="수정">
                </c:if>
				<input type="button" value="목록" onclick="javascript:location.href='list'">
			</td>
		</tr>
	</table>
	<div id="rCont" style="display:none"></div>
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