<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="<%=request.getContextPath()%>/css/idCheck.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.2.0.min.js"></script>

<script type="text/javascript">
	
	var httpRequest = null;
	
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
	
	function idCheck(){
        var id = document.getElementById("userId").value;
		var reg = /^[a-zA-Z0-9]{6,15}$/;
		
        if (!id) {
            alert("아이디를 입력하지 않았습니다.");
            document.getElementById("cancelBtn").style.visibility='visible';
			document.getElementById("useBtn").style.visibility='hidden';
            document.getElementById("msg").innerHTML = "";
            return false;
        } 
        else if(!(reg.test(id))){
        	alert("아이디 입력이 잘못됬습니다.");
        	document.chkForm.id.value = "";
        	document.chkForm.id.focus();
        	document.getElementById("cancelBtn").style.visibility='visible';
			document.getElementById("useBtn").style.visibility='hidden';
        	document.getElementById("msg").innerHTML = "";
        	return false;
        }
        else
        {
            var param="id="+id;
            httpRequest = getXMLHttpRequest();
            httpRequest.onreadystatechange = callback;
            httpRequest.open("POST", "../IdCheck", true); 
            httpRequest.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
            httpRequest.send(param);
        }
    }
	
	function pValue(){
		document.getElementById("userId").value = opener.document.join_form.id.value;
	}

	function callback(){
		if(httpRequest.readyState == 4){
			var resultText = httpRequest.responseText;
			if(resultText == 0){
				alert("사용할 수 없는 아이디입니다.");
				document.getElementById("cancelBtn").style.visibility='visible';
				document.getElementById("useBtn").style.visibility='hidden';
				document.getElementById("msg").innerHTML = "";
			} else if(resultText == 1){
				alert("사용 가능한 아이디입니다.")
				document.getElementById("cancelBtn").style.visibility='hidden';
				document.getElementById("useBtn").style.visibility='visible';
				document.getElementById("msg").innerHTML = "사용 가능한 아이디입니다.";	
			}
		}
	}
	
	function sendCheckValue(){
		opener.document.join_form.idDuplication.value = "idCheck";
		opener.document.join_form.id.value = document.getElementById("userId").value;
		
		if(opener != null){
			opener.chkForm = null;
			self.close();
		}
	}
</script>
<title>아이디 중복 체크 폼</title>
</head>
<body onload="pValue()">


<center>
<div id="wrap">
	<br>
	<b>아이디 중복체크</b>
	<hr>
	<br>
	<div id="chk">
		<form id="checkForm" name="chkForm">
		
				ID : <input type="text" name="id" size="15" maxlength="15" 
						id="userId">
				<input type="button" value="중복확인" onclick="idCheck()">

		</form>
		<div id="msg"></div>
		<br>
		<input type="button" id="cancelBtn" value="취소" onclick="window.close()"><br>
		<input type="button" id="useBtn" type="button" value="사용하기" onClick="sendCheckValue()">
	</div>
</div>
</center>
</body>
</html>