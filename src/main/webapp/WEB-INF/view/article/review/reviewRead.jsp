<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="u" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="<%=request.getContextPath()%>/css/common.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/css/review_list.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/css/review_write.css" rel="stylesheet" type="text/css">
<title>게시글 읽기</title>
<style type="text/css">
       #wrap {
	width: 800px;
	margin: 0 auto 0 auto;
}

#detailBoard {
	width:800px;
	text-align: center;
	border-top: #cdcbbe solid 1px;
	width: 100%;
	border-collapse: collapse;
	table-layout: fixed;
	margin: 20px 0px 0px 0px;
}

#WriteComment{
	width:800px;
}

.title {
	width:100px;
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

#content {
	height: 400px;
	font-family: '돋움';
	font-size: 12;
	vertical-align: top;
	text-align: left;
}

#comment {
	text-align: left;
}

#writer {
	font-family: '돋움';
	font-size: larger;
	text-align: left;
}

.review {
	display: block;
	height: 47px;
	border-bottom: 5px solid #432c10;
}

.account {
	margin: 20px 0px 0px 0px;
	border: none;
	border-top: #cdcbbe solid 1px;
	width: 100%;
	border-collapse: collapse;
	table-layout: fixed;
}
td{
	height: 16;
	font-family: '돋움';
	font-size: 12;
	text-align: center;
	color: #666;
    border-bottom: #eceae1 solid 1px;
    
}
.recommendbtn{
	padding-right: 1px 35px;
}
.board1{
	width: 180px;
}

    </style>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.2.0.min.js"></script>
     <script type="text/javascript">
        // 입력값 체크
        function checkValue()
        {
            if(!document.commentInput.comment.value){
                alert("내용을 입력하세요.");
                return false;
            }
        }
        
        function openDelForm(no,bNo,pNo){
        	window.name="parentForm";
        	window.open("commentDelete?no="+no+"&bNo="+bNo+"&pNo="+pNo,"delForm","width=400, height=200, resizable=no,scrollbars=no");
        }
        
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
      
      function checkKey(){
    	  if(window.event.keyCode == 13){
    		  bDelete();
    		 }else{
    		  return ;
    		 }
      }

      function bDelete(){

          var no = document.review_form.no.value;
          var pw = document.review_form.pw.value;
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

        function recommend(){
            var str = document.review_form.like.value;
			var likeCnt = document.review_form.like_cnt.value;
			var cnt = document.review_form.like_cnt.value;
            var intCnt = parseInt(cnt);
            var check = 1;
            
            if (document.review_form.like.value == "좋아요")
            	check = 1;
            else if (document.review_form.like.value == "좋아요 취소")
            	check = 0;
            
            var rcm = "user=+${authUser}";
            rcm += "&no="+${board.no};
            rcm += "&check="+check;
			//var rcm = "user="+${authUser}+"&no="+${reviewData.review.no}+"&check="+check
			
            if (${authUser == board.writer})
            {
				alert("본인글에는 추천할 수 없습니다.");		
            } else 
            {
                $.ajax({
				url : "recommend",
				type : "post",
				data : rcm,
				success : function(result){
					if (str == "좋아요"){
						intCnt += 1;
						$("#recommend").text(intCnt);
						document.review_form.like_cnt.value = intCnt;
						document.review_form.like.value = "좋아요 취소";
					} else if (str == "좋아요 취소"){
						intCnt -= 1;
						$("#recommend").text(intCnt);
						document.review_form.like_cnt.value = intCnt;
						document.review_form.like.value = "좋아요";
					}
				}
                })};	
            }
        
        
   </script>
</head>
<body>
<center>
<c:import url="/WEB-INF/common/top.jsp"></c:import>
<c:import url="/WEB-INF/common/menu.jsp"></c:import>
<input type="hidden" id="imgPath1" value="${board.image1}">
<input type="hidden" id="imgPath2" value="${board.image2}">
<input type="hidden" id="imgPath3" value="${board.image3}">
<input type="hidden" id="upDir" value="<%=request.getContextPath()%>/images/review/">
<div id="wrap">
    <div id="board">
    	<h2 align="left">후기 게시판</h2>
    	<form name="review_form" onsubmit="return false">
    	<input type="hidden" name="no" value="${param.no}">
    	<input type="hidden" name="like_cnt" value="${board.recommend}">
        <table id="detailBoard" width="800px" border="1" bordercolor="lightgray">
        <tr>
                <td class="title">작성일</td>
                <td>${board.uploadDate}</td>
                <td class="title">글 번호</td>
                <td class = "board1">${board.no}</td>
            </tr>
            <tr>
          	    <td class="title">제 목</td>
          	    <td>${board.title}</td>     
                <td class="title">작성자</td>
                <td>${board.writer}</td>
            </tr>
<tr>
	<td class="title">별점</td>
	<td><div class="point1"><fmt:parseNumber var="pages" integerOnly="true" value="${board.grade * 20}"></fmt:parseNumber>
				<div class="point2" style="width:${pages}%;">
					<img src="<%=request.getContextPath()%>/images/products/star_on.gif" alt="10점 만점 중 0.5점"/>
					</div>
	</div></td>
	<td class="title">추천수</td>
	<td><span id="recommend">${board.recommend}</span><br>
		<u:isLogin>
			<input type="button" value="${requestScope.chk}" name="like" onclick="recommend()">
		</u:isLogin>
	</td>
</tr>
<tr>
	<td class="title">내용</td>
	<td id="content" colspan=3 align="left">${board.contents}</td>
	
	<script>
        for(var i = 1 ; i < 4 ; i++){

            var imgPath = "imgPath"+i;
            var rImg = "rImg"+i;
            var upDir = document.getElementById("upDir").value + $('#'+imgPath).val();
        	$('#'+rImg).attr('src',upDir);
        	$('#'+rImg).attr('style','width:300px; height:300px');
        	
        }
   </script> 
</tr>
<tr>
	<td colspan="4">
		<c:if test="${sessionScope.authUser != null}">
                <c:if test="${sessionScope.authUser == board.writer}">
                    <input type="button" value="수정" 
                    		onclick= "javascript:location.href='write?no=${board.no}&mo=1'">
                    	<input type="button" value="삭제" 
                    		onclick="visible()">
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
</form>
</div>
<br><br>
    
    <h3 align="left">댓글</h3>
    <hr>
    <div id="listGuestForm">
        <form method="post" name="">
        <c:if test="${requestScope.cList eq 'empty'}">
      		<h4 style="text-align: center;">남겨진 댓글이 없습니다.</h4>     
		</c:if>
            <!-- 댓글 내용 부분 -->
            <div id="comment">
                <c:forEach var="comment" items="${requestScope.list}" varStatus="status">
                	<c:if test="${status.index ne 0}">
                    <hr size="1">
                    </c:if>
                    <label id="writer"><b>${comment.writer}</b></label>   
                    &nbsp;&nbsp;
                    <label>${comment.uploadDate}</label>
                    <c:if test="${sessionScope.authUser != null}">
               		 	<c:if test="${sessionScope.authUser == comment.writer}">    
                    <a href="#" onclick="openDelForm(${comment.no},${param.no},${param.pageNo})">[삭제]</a>
                    	</c:if>
                    </c:if><br>
                    	
                     ${comment.contents} <br>
                 </c:forEach>
                 <c:if test="${requestScope.cList ne 'empty'}">
      		<hr size="1"> 
		</c:if>    
                     
            </div>
                 
            <!-- 페이지 부분 -->
             <div id="pageForm">
                <c:if test="${startPage != 1}">
                    <a href='read?no=${param.no}&pageNo=${pageNum}&cPageNo=${startPage-1}'>[ 이전 ]</a>
                </c:if>
                
                <c:forEach var="pageNo" begin="${startPage}" end="${endPage}">
                    <c:if test="${pageNo == spage}">
                        ${pageNo} 
                    </c:if>
                    <c:if test="${pageNo != spage}">
                        <a href='read?no=${param.no}&pageNo=${pageNum}&cPageNo=${pageNo}'>${pageNo} </a>
                    </c:if>
                </c:forEach>
                
                <c:if test="${endPage != maxPage }">
                    <a href='read?no=${param.no}&pageNo=${pageNum}&cPageNo=${endPage+1 }'>[다음]</a>
                </c:if>
            </div> 
        </form>
     </div>
<hr>
<c:if test="${sessionScope.authUser != null}">
<div id="writeComment">
    <form name="commentInput" method="post" action="commentWrite"
            onsubmit="return checkValue()" >
    <input type="hidden" name="no" value="${param.no}">
    <input type="hidden" name="pNo" value="${param.pageNo}">
	<table id="WriteComment" width="800">
    	<tr>
        	<td id="title" width="10%">댓글</td>
			<td> <textarea style="width:600px;" name="comment" id="comment"></textarea>
			</td>
			<td><input type="submit" value="등록"></td>
		</tr>
	</table>        
    </form>
</div>
</c:if>
<p style="height:300px;"></p>
</div>
<c:import url="/WEB-INF/common/footer.jsp"></c:import>
</center>

</body>
</html>