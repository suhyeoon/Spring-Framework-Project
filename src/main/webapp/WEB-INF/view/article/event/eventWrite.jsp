<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>게시글 쓰기</title>

<link href="<%=request.getContextPath()%>/css/common.css" rel="stylesheet" type="text/css">
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css"
	type="text/css" />
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<link rel="stylesheet" href="/resources/demos/style.css" />
<script>

	$(function() {
		$("#startDate").datepicker({
			dateFormat : "yy-mm-dd",
			changeMonth : true,
			changeYear : true,
			nextText : '다음 달',
			prevText : '이전 달',
			minDate: 0,
			numberOfMonths: 2,
			onSelect: function(selected) {
				$("#endDate").datepicker("option","minDate", selected)
				}
		});
	});
	$(function() {
		$("#endDate").datepicker({
			dateFormat : "yy-mm-dd",
			changeMonth : true,
			changeYear : true,
			nextText : '다음 달',
			prevText : '이전 달',
			numberOfMonths: 2,
			onSelect: function(selected) {
			$("#startDate").datepicker("option","maxDate", selected)
			}
		});
	});

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
		
		if (document.boardForm.startDate.value == "") {
			alert("시작 날짜를 입력해주세요");
			boardForm.startDate.focus();
			return false;
		}//end if
		if (document.boardForm.endDate.value == "") {
			alert("종료 날짜를 입력해주세요");
			boardForm.endDate.focus();
			return false;
		}//end if
		alert(document.boardForm.no.value);
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


</head>
<body>
<center>
<c:import url="/WEB-INF/common/top.jsp"></c:import>
<c:import url="/WEB-INF/common/menu.jsp"></c:import>
<br>
    <b><font size="6" color="gray">이벤트 글쓰기</font></b>
    <br><br>
    <form:form method="post" action="write" name="boardForm" enctype="multipart/form-data" 
    modelAttribute="writeForm" onsubmit="return check()">
    <input type="hidden" name="writer" value="${authUser}">
    <input type="hidden" name="mo" value="${param.mo}">
    <input type="hidden" name="modifyNo" value="${param.no}">
    <input type="hidden" name="upDir"
	value="C:/Users/Administrator/Documents/work/sources/Spring/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/Resort/images/event/">
	<table width="700px" border="1" bordercolor="lightgray" align="center">
		<tr>
		<td class="title" align="center">제목</td>
			<td>
				<input type="text" name="title" size="70" maxlength="100" value="${board.title}">
				<c:if test="${errors.title}">제목을 입력하세요.</c:if>
			</td>
		</tr>
		<tr>
			<td class="title" align="center">내용</td>
			<td><textarea name="contents" id="contents" cols="72" rows="20">${board.contents}</textarea>
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
		<tr>
			<td class="title" align="center">이미지 첨부</td>
			<td><input type="file" name="eventImg"/></td>
		</tr>
		<tr>
			<td class="title" align="center">시작일</td>
			<td><input type="text" size="20" maxlength="20" id="startDate" name="startDate" value="${board.startDate}" /></td>
		</tr>
		<tr>
			<td class="title" align="center">종료일</td>
			<td><input type="text" size="20" maxlength="20" id="endDate" name="endDate" value="${board.endDate}" /></td>
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
	 <p style="height:500px;"></p>
    <c:import url="/WEB-INF/common/footer.jsp"></c:import>
</center>
</body>
</html>