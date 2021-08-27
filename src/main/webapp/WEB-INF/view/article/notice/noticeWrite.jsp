<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>게시판 - 글쓰기</title>
    <link href="<%=request.getContextPath()%>/css/common.css" rel="stylesheet" type="text/css">
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
td {
	height: 16;
	font-family: '돋움';
	font-size: 12;
	color: #666;
	border-bottom: #eceae1 solid 1px;
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
    var mo= document.boardForm.mo.value;
    var no= document.boardForm.no.value;
    var param="title="+title+"&contents="+contents;
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
		boardForm.pw.focus();
		return false;
	}//end if
	
	return true;
}

</script>
</head>
<body>
<center>
<c:import url="/WEB-INF/common/top.jsp"></c:import>
<c:import url="/WEB-INF/common/menu.jsp"></c:import>
    <br>
    <b><center><font size="6" color="gray">공지사항 글쓰기</font></center></b>
    <br>
    
    <form method="post" action="write" name="boardForm" enctype="multipart/form-data">
    <input type="hidden" name="writer" value="${authUser}">
    <input type="hidden" name="mo" value="${param.mo}">
    <input type="hidden" name="no" value="${param.no}">
    <table width="700px" border="1" bordercolor="lightgray" align="center">
        <tr>
            <td class="title">작성자</td>
            <td>${authUser}</td>
        </tr>
            <tr>
            <td class="title">
                제 목
            </td>
            <td>
                 	<input name="title" type="text" size="70" maxlength="100" value="${board.title}"/>
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


