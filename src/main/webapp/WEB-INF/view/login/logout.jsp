<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
function logout(){
	alert("로그아웃 되었습니다.\n 메인페이지로 이동합니다.");
	location.href="./main.jsp";
}
</script>
<title>로그아웃</title>
</head>
<body onload="logout()">

</body>
</html>