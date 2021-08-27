<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>글 상세보기</title>
    <link href="<%=request.getContextPath()%>/css/common.css" rel="stylesheet" type="text/css">
    <style type="text/css">
       #wrap {
	width: 800px;
	margin: 0 auto 0 auto;
}

#detailBoard {
	text-align: center;
	margin: 20px 0px 0px 0px;
	border-top: #cdcbbe solid 1px;
	width: 100%;
	border-collapse: collapse;
	table-layout: fixed;
}

.title {
	width: 100px;
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

.contents {
	width: 400px;
}
.contents2 {
	width: 130px;
}

#content {
	height: 400;
	font-family: '돋움';
	font-size: 12;
	vertical-align: top;
}

body {
	margin: 0;
	padding: 0;
}

td {
	height: 16;
	font-family: '돋움';
	font-size: 12;
	color: #666;
	border-bottom: #eceae1 solid 1px;
}

#content1 {
	text-align: left;
	height: 400;
	font-family: '돋움';
	font-size: 12;
	vertical-align: top;
}

    </style>
    <script>
    function visible(){
    	document.getElementById("pw").style.display='inline';
    	document.getElementById("btnOk").style.display='inline';
    }
    
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

  function bDelete(){

      var no = document.deleteForm.no.value;
      var pw = document.deleteForm.pw.value;
      var param="no="+no +"&pw="+pw;
      httpRequest = getXMLHttpRequest();
      httpRequest.onreadystatechange = callback;
      httpRequest.open("POST", "delete", true);    
      httpRequest.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded'); 
      httpRequest.send(param);
  }

  function callback(){
   if(httpRequest.readyState == 4){
       // 결과값을 가져온다.
       
       var resultText = httpRequest.responseText;
       if(resultText == 0){
      	 // 성공
      	alert("글 삭제에 성공했습니다. 목록 페이지로 이동합니다.")
       	location.href="list";
       } 
       else if(resultText == 1){ 
      	 //실패
       	alert("글 삭제에 실패했습니다.");
       } 
   }
  }
  
  function checkKey(){
	  if(window.event.keyCode == 13){
		  bDelete();
		 }else{
		  return ;
		 }
  }
    
    </script>
    
</head>
<body>
<form method="post" action="delete" name="deleteForm" onsubmit="return false">
<input type="hidden" name="no" value="${param.no}">
<center>
<c:import url="/WEB-INF/common/top.jsp"></c:import>
<c:import url="/WEB-INF/common/menu.jsp"></c:import>
<div id="wrap">
    <div id="board">
    	<h2 align="left">공지사항 게시판</h2>
        <table id="detailBoard" width="800" border="1" bordercolor="lightgray">
            <tr>
                <td class="title">작성일</td>
                <td class="contents">${board.uploadDate}</td>
                <td class="title">글 번호</td>
                <td class="contents2">${board.no}</td>
            </tr>
            <tr>
          	    <td class="title">제 목</td>
          	    <td>${board.title}</td>     
                <td class="title">작성자</td>
                <td>${board.writer}</td>
            </tr>
            <tr>
                <td class="title"> 내 용</td>
                <td id="content" align="left" colspan=3 height="400px">
                    ${board.contents}
                </td>        
            </tr>
    
            <tr align="center" valign="middle">
                <td colspan="4">
                
                <c:if test="${sessionScope.authUser != null}">
                <c:if test="${sessionScope.authUser == board.writer}">
                    <input type="button" value="수정" 
                    onclick= "javascript:location.href='write?no=${board.no}&mo=1'">
                    <input type="button" value="삭제"
                    	onclick="visible()"> 
                    	<%-- onclick= "javascript:location.href='delete?no=${board.no}'"> --%>
                    <input name="pw" type="password" id="pw" size="10" maxlength="10" onkeydown="checkKey()" style="display: none"/>
                    <input id="btnOk" type="button" value="확인" style="display: none"
                    	onclick="bDelete()" > 
                        </c:if>
                </c:if>
                    <input type="button" value="목록" 
                        onclick="javascript:location.href='list?page=${pageNum}'">            
                </td>
            </tr>
        </table>
    </div>
</div>    
 <p style="height:500px;"></p>
<c:import url="/WEB-INF/common/footer.jsp"></c:import>
</center>
</form>
</body>
</html>
