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
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
<script type="text/javascript">

	$(document).ready(function(){
		
		$('#addImage').click(function() {
			var imgNo = document.getElementById("imgNo").value;
			var img = "image"+imgNo;
			var hidden = "hdImg"+imgNo;
			if($('#'+img).val()!=''){
				imgNo = parseInt(imgNo) +1;
				img = "image"+imgNo;
				if($('#'+img).val()!=''){
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

			    	/* var contentsView = $('#contentsView').html();
			    	
			    	$('#contentsView').html(contentsView+
					"<img id='" + hidden + "' style='display:none;'>");
			    	$('#contents').val(contentsView); */
			    	
					var tr = "sImg td:eq("+ (imgNo-1) +")";
					var	row = "<td id=tdImg"+ imgNo +" style='width:185px; border:none;'><a onclick='addImgtoCont("+ imgNo +")'><img id='" + hidden + "' style='display:none;'></a></td>"
					$('#'+tr).after(row);
					document.getElementById("imgNo").value= parseInt(imgNo) +1;
					var opt = {
					        img: $('#' + hidden),
					        w: 180,
					        h: 180
					};
					
					var defaultOpt = {
					        inputFile: $(this),
					        img: null,
					        w: 180,
					        h: 180
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
	
/* 	function change1() {
		var path = document.getElementById("image1").value;
		var img = path.substring(path.lastIndexOf('\\')+1, path.length);
		document.boardForm.hdImg1.value = img;
	}
	function change2() {
		var path = document.getElementById("image2").value;
		var img = path.substring(path.lastIndexOf('\\')+1, path.length);
		document.boardForm.hdImg2.value = img;
	}
	function change3() {
		var path = document.getElementById("image3").value;
		var img = path.substring(path.lastIndexOf('\\')+1, path.length);
		document.boardForm.hdImg3.value = img;
	} */
		
	function deleteImages(){
		var no = document.getElementById("clickedImgNo").value;
		var img = "image"+no;
		if(no=="0"){
			alert("삭제할 이미지를 선택해주세요.");
			return;
		}
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
	
	function write2(){
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
		$('#transCont').val($('#rCont').html());
		alert($('#transCont').val());
		$('#realContents').css('display','');
	}
	
	
</script>
<style type="text/css">
	.imgName{
		width:180px;
	}
</style>
<title>게시글 쓰기</title>
</head>
<body>
<center>

<b><font size="6" color="gray">후기 게시판 글쓰기</font></b>
<form:form action="writeTest" name="boardForm" method="post" modelAttribute="writeForm"
	enctype="multipart/form-data" onsubmit="return check()">
<input type="hidden" name="writer" value="${authUser}">
<input type="hidden" name="mo" value="${param.mo}">
<input type="hidden" name="modifyNo" value="${param.no}">
<input type="hidden" name="upDir"
	value="C:/work/source/spring/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/Resort/images/review/">
<table width="700px" border="3" bordercolor="lightgray" align="center" id="tbl">
		<tr>
			<td>
				<b>제목</b>
			</td>
			<td colspan="3" width="570px">
				<input type="text" size="70" name="title" value="${board.title}">
			<c:if test="${errors.title}">제목을 입력하세요.</c:if>
			</td>
		</tr>
		<tr>
			<td>
				내용
			</td>
			<td colspan="3">
				<input type="hidden" id="upDir" value="<%=request.getContextPath()%>/images/review/1.jpg">
				<div id="contView" style="width:534px;height:600px;overflow:auto;">
				${cont }
				</div>
				<script>
                	var result = document.getElementById("contView").value;
                	var upDir = document.getElementById("upDir").value;
                	
                	$('#rImg1').attr('src',upDir);
                	$('#rImg1').attr('style','width:300px; height:300px');
                	document.getElementById("contents").value = result.replace(/<br\s*\/?>/mg,"\r\n");
                </script> 
			</td>
		</tr>
		<tr>
			<td align="center">이미지</td>
			<td colspan="3">
				<input type="button" name="addImage" size="40" id="addImage" value="이미지 업로드">
				&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="button" name="deleteImage" size="40" id="deleteImage" value="선택 이미지 삭제" 
				onclick=deleteImages()>
				<input type="file" style="display:none;" name="image[0]" id="image1" size="40">
				<input type="file" style="display:none;" name="image[1]" id="image2" size="40">
				<input type="file" style="display:none;" name="image[2]" id="image3" size="40">
				<!-- <input type="hidden" name="hdImg1" value="">
				<input type="hidden" name="hdImg2" value="">
				<input type="hidden" name="hdImg3" value=""> -->
				<input type="hidden" id="chkImg1" value="x">
				<input type="hidden" id="chkImg2" value="x">
				<input type="hidden" id="chkImg3" value="x">
				<input type="hidden" id="imgNo" value="1">
				<input type="hidden" id="clickedImgNo" value="0">
			</td>
		</tr>
		<tr class="tr1" id="sImg" height="190px">
			<td align="center" style='width:125px'>선택된 이미지</td>
			<!-- <td>
				<input type="text" id="up1" readonly="readonly"><input type="button" value="X" id="del1">
			</td> -->
		</tr>
		<tr>
			<td colspan=4 align="center">
				<c:if test="${param.mo==0}">
                <input type="submit" value="등록">
                </c:if>
                <c:if test="${param.mo==1}">
                <input type="submit" value="수정">
                </c:if>
				<input type="button" value="등록" onclick=write2()>
			</td>
		</tr>
	</table>
	<div id="realContents" style="display:none">
	result
	<table>
		<tr>
		<td>
			<input type="hidden" name="transCont" id="transCont" value="">
			<div id="rCont"></div>
		</td>
		</tr>
	</table>
	</div> 
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