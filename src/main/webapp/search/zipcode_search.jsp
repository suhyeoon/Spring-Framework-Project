<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�����ȣ �˻�</title>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
	function openAddr() {
		new daum.Postcode({
			oncomplete : function(data) {
				// �˾����� �˻���� �׸��� Ŭ�������� ������ �ڵ带 �ۼ��ϴ� �κ�.
				// �����ȣ�� �ּ� ������ �ش� �ʵ忡 �ְ�, Ŀ���� ���ּ� �ʵ�� �̵��Ѵ�.
				var fullAddr = data.address;
				var extraAddr = '';
				//��ü �ּ� ����� �ڵ�
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
		// ȸ������ ȭ���� �����ȣ, �ּ�, ���ּ� ���� ���� ����
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
<h3>�����ȣ �˻�</h3>
<hr>
<p>
	<input name="postnum" id='postcode' size=6 type="text" disabled="disabled" placeholder="�����ȣ"/>
	<input value="�˻�" type="button" onclick="openAddr();"/>
</p>
<p>
	<input name="addr1" id="addr1" type="text" size=40 disabled="disabled" placeholder="�ּ�"/>
</p>
<p>
	<input name="addr2" id="addr2" type="text" size=40 placeholder="���ּ�"/>
</p>
<p>
	<input value="�Ϸ�" type="button" onclick="finish();"/>
</p>
</center>
</body>
</html>
