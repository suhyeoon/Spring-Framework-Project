<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>방명록 삭제</title>
 
    <style type="text/css">
        #wrap {
            width: 400px;
            text-align: center;
            margin: 0 auto 0 auto;
        }
        
        #deleteReplyForm{
            text-align: center;
        }
    </style>
    
    <script type="text/javascript">
    
        var httpRequest = null;
        
        // httpRequest 객체 생성
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
        
        // 삭제확인
        function complete(){

        	var form = document.forms[0];
            var num = form.no.value;

            var param="no="+num;
            httpRequest = getXMLHttpRequest();
            httpRequest.onreadystatechange = checkFunc;
            httpRequest.open("POST", "commentDelete", true);    
            httpRequest.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded'); 
            httpRequest.send(param);
            
        }
        
        function checkFunc(){
            if(httpRequest.readyState == 4){
                // 결과값을 가져온다.
                var resultText = httpRequest.responseText;
                if(resultText == 0){
                    alert("댓글 삭제에 실패 했습니다.");
                } 
                else{
                    if (opener != null) {
                        // 방명록(부모창) 새로고침
                        var form = document.forms[0];
            			var bNo = form.bNo.value;
            			var pNo = form.pNo.value;
                        window.opener.document.location.href="read?no="+bNo+"&pageNo="+pNo;
                        opener.delForm = null;
                        self.close();
                    }
                }
            }
        }
    </script>
    
</head>
<body>
 
<div id="wrap">
    <br>
    <b><font size="5" color="gray">댓글을 삭제 하시겠습니까?</font></b>
    <hr size="1" width="400">
    <br>
    <div id="deleteReplyForm">
        <form name="delGuestbook" target="parentForm">
        <input type="hidden" name="no" value="${requestScope.commentNo}"/>
        <input type="hidden" name="bNo" value="${requestScope.bNo}"/>
        <input type="hidden" name="pNo" value="${requestScope.pNo}"/>
            <input type="button" value="확인" onclick="complete()">
            <input type="button" value="취소" onclick="window.close()">
        </form>
    </div>
</div>    
 
</body>
</html>
