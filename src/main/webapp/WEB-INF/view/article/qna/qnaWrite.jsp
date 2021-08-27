<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="<%=request.getContextPath()%>/css/common.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
	
var httpRequest = null;

//httpRequest 객체 생성
function getXMLHttpRequest(){
 var httpRequest = null;

 if(window.ActiveXObject){
     try{
         httpRequest = new ActiveXObject("Msxml2.XMLHTTP");    
     } catch(e) {
         try{
             httpRequest = new ActiveXObject("Microsoft.XMLHTTP");
         } catch (e2) { httpRequest = null; }
     }
 }
 else if(window.XMLHttpRequest){
     httpRequest = new window.XMLHttpRequest();
 }
 return httpRequest;    
}

function input(){
	if(Check())// 빈 칸 확인
	{
    var title = document.boardForm.title.value;
    var contents = document.boardForm.contents.value;
    var category = document.boardForm.category.value;
    var mo= document.boardForm.mo.value;
    var no= document.boardForm.no.value;
    var param="title="+title+"&contents="+contents+"&category="+category;
    if(mo!=null&&mo!=""){
    	param = param+"&mo="+mo+"&no="+no;
    }
    httpRequest = getXMLHttpRequest();
    httpRequest.onreadystatechange = callback;
    httpRequest.open("POST", "write", true);    
    httpRequest.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded'); 
    httpRequest.send(param);
       
	}
}

function callback(){
 if(httpRequest.readyState == 4){
     // 결과값을 가져온다.
     
     var resultText = httpRequest.responseText;
     if(resultText == 0){
    	 // 성공
    	alert("글쓰기에 성공했습니다. 목록 페이지로 이동합니다.")
     	location.href="list";
     } 
     else if(resultText == 1){ 
    	 //실패
     	alert("제목 또는 내용의 최대 글자 수를 초과했습니다.");
     } 
     else if(resultText == 2){ 
    	 alert("글수정에 성공했습니다. 목록 페이지로 이동합니다.")
      	location.href="list";
     } 
     else if(resultText == 3){ 
    	 //실패
     	alert("제목 또는 내용의 최대 글자 수를 초과했습니다.");
     } 
 }
}

function Check(){

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
	
	if (document.boardForm.category.value == "" ||
			document.boardForm.category.value == "test") {
		alert("카테고리를 선택해주세요");
		boardForm.category.focus();
		return false;
	}//end if
	
	return true;
}
	
</script>
<style type="text/css">
       #wrap {
	width: 800px;
	margin: 0 auto 0 auto;
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
<title>문의하기</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
</head>
<body>
<center>
<c:import url="/WEB-INF/common/top.jsp"></c:import>
<c:import url="/WEB-INF/common/menu.jsp"></c:import>
<br>
    <b><center><font size="6" color="gray">문의하기 글쓰기</font></center></b>
    <br>
    
  	<form method="post" action="write" name="boardForm">
  	<input type="hidden" id="category" name="category" value="test">
    <input type="hidden" name="board_id" value="${sessionScope.authUser}">
    <input type="hidden" name="mo" value="${param.mo}">
    <input type="hidden" name="no" value="${param.no}">
    <table width="700px" border="1" bordercolor="lightgray" align="center">
    	<tr>
						<td width="25%" class="title" align="center">질문유형</td>
						<td class="contents">
						<select name="Category_id" id="Category_id" onchange="if($(this).val()!='self')
						{this.form.category.value=this.value}">
									<option value="self" selected="selected">선택하세요</option>
									<option value="예약/변경">예약/변경</option>
									<option value="예약취소">예약취소</option>
									<option value="객실문의">객실문의</option>
									<option value="패키지문의">패키지문의</option>
									<option value="서비스문의">서비스문의</option>
									<option value="기타문의">기타문의</option>
								</select>
						</td>
					</tr>
        <tr>
            <td class="title">작성자</td>
            <td class="contents">${sessionScope.authUser}</td>
        </tr>
            <tr>
            <td class="title">
                제 목
            </td>
            <td>
                 	<input name="title" type="text" size="70" maxlength="100" value="${board.title}"/>
                 	<c:if test="${errors.title}">제목을 입력하세요.</c:if>
            </td>        
        </tr>
        <tr>
           <td class="title">
                내 용
            </td>
            <td>
                <textarea name="contents" id="contents" cols="72" rows="20">${board.contents}</textarea>
               <script>
               var result = document.getElementById("contents").value;
           	document.getElementById("contents").value = result.replace(/<br\s*\/?>/mg,"\r\n");
           	result = document.getElementById("contents").value;
           	document.getElementById("contents").value = result.replace(/&lt;/mg,"<");
           	result = document.getElementById("contents").value;
           	document.getElementById("contents").value = result.replace(/&gt;/mg,">");
                </script>             
            </td>        
        </tr>
        <tr align="center" valign="middle">
            <td colspan="5">
                <c:if test="${param.mo==null}">
                <input type="button" value="등록" onclick=input()>
                </c:if>
                <c:if test="${param.mo==1}">
                <input type="button" value="수정" onclick=input()>
                </c:if>
                <input type="button" value="목록" onclick="javascript:location.href='list'">            
            </td>
        </tr>
    </table>    
    </form>
<p style="height:500px;"></p>
<c:import url="/WEB-INF/common/footer.jsp"></c:import>
</center>

</body>
</html>