<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>우편번호 검색</title>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
	function openAddr() {
		new daum.Postcode({
			oncomplete : function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
				// 우편번호와 주소 정보를 해당 필드에 넣고, 커서를 상세주소 필드로 이동한다.
				var fullAddr = data.address;
				var extraAddr = '';
				//전체 주소 만드는 코드
				if (data.addressType === 'R') {
					if (data.bname !== '') {
						extraAddr += data.bname;
					}

					if (data.buildingName !== '') {
						extraAddr += (extraAddr !== '' ? ',' + data.buildingName : data.buildingName);
					}

					fullAddr += (extraAddr !== '' ? '(' + extraAddr + ')' : '');
				}
				document.getElementById('postcode').value = data.zonecode;
				document.getElementById('addr1').value = fullAddr;
				document.getElementById('addr2').focus();
			}
		}).open();
	}
	
	function finish(){
		// 회원가입 화면의 우편번호, 주소, 상세주소 란에 값을 전달
		opener.document.join_form.addrNo.value = document.getElementById("postcode").value;
        opener.document.join_form.addr1.value = document.getElementById("addr1").value;
        opener.document.join_form.addr2.value = document.getElementById("addr2").value;
        
        if (opener != null) {
            opener.chkForm = null;
            self.close();
        }    
	}
</script>
</head>
<body>
<center>
<h3>우편번호 검색</h3>
<hr>
<p>
	<input name="postnum" id='postcode' size=6 type="text" disabled="disabled" placeholder="우편번호"/>
	<input value="검색" type="button" onclick="openAddr();"/>
</p>
<p>
	<input name="addr1" id="addr1" type="text" size=40 disabled="disabled" placeholder="주소"/>
</p>
<p>
	<input name="addr2" id="addr2" type="text" size=40 placeholder="상세주소"/>
</p>
<p>
	<input value="완료" type="button" onclick="finish();"/>
</p>
</center>
</body>
</html>
