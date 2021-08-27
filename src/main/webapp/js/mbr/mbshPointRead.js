
document.write("<div id='mbshPotinRead'  style='display:none' ></div>");

var popPointHotlPath = "";
var popPointMbshTyp = "";
var mbshPotinRead = $("#mbshPotinRead");

function popPointRead(hotlPath , mbshTyp){
	path2 = "point";
	popPointHotlPath = hotlPath;
	popPointMbshTyp = mbshTyp;
	var errorCheck = "";
	$.ajax(
            {
                url: '/'+popPointHotlPath+'/mbsh/point/viewPoint.do',
                type: "post",
                dataType: "html",
                data : {"searchMbshTypCd" : popPointMbshTyp},
                error: function(){
                	errorCheck = "fail";
                },
                success: function( strData ){
                	mbshPotinRead.html(strData);
                	mbshPotinRead.show();
                	$("#searchMbshTypCd").val(popPointMbshTyp);
                	$("#mbshPotinRead").attr("tabindex",-1).focus();
                }
            }                           
     );
     if(errorCheck == "fail"){
  		alert('<spring:message code="msg.cmm.fail.select"/>');
     }
}


function popPointSecuRead(hotlPath , mbshTyp){
	path2 = "secu";
	popPointHotlPath = hotlPath;
	popPointMbshTyp = mbshTyp;
	var errorCheck = "";
	$.ajax(
            {
                url: '/'+popPointHotlPath+'/mbsh/secu/viewPoint.do',
                type: "post",
                dataType: "html",
                data : {"searchMbshTypCd" : popPointMbshTyp},
                error: function(){
                	errorCheck = "fail";
                },
                success: function( strData ){
                	mbshPotinRead.html(strData);
                	mbshPotinRead.show();
                	$("#searchMbshTypCd").val(popPointMbshTyp);
                	$("#mbshPotinRead").attr("tabindex",-1).focus();
                }
            }                           
     );
     if(errorCheck == "fail"){
  		alert('<spring:message code="msg.cmm.fail.select"/>');
     }
}


function popCloaePointRead(){
	mbshPotinRead.html("");
	mbshPotinRead.hide();
	$("#mbshPotinReadButton").focus();
}


function selectPopPointRead(){

	if($.trim($('#searchMbshCardNo').val()) == "" || $.trim($('#searchMbshCardNo').val()) == messages["javascript.mbsh.join.msg4"] ){
		alert(messages["javascript.mbsh.join.msg1"]);
		alert("카드번호를 입력해주세요.");
		$('#searchMbshCardNo').focus();
		return;
	}

	if($.trim($('#searchMbshEnLnm').val()) == "" || $.trim($('#searchMbshEnLnm').val()) == messages["javascript.mbsh.join.msg4"] ){
		alert(messages["javascript.mbsh.join.msg2"]);
		alert("영문성을 입력해주세요.");
		$('#searchMbshEnLnm').focus();
		return;
	}

	if($.trim($('#searchMbshEnFnm').val()) == "" || $.trim($('#searchMbshEnFnm').val()) == messages["javascript.mbsh.join.msg4"]){
		alert(messages["javascript.mbsh.join.msg3"]);
		alert("영문이름을 입력해주세요.");
		$('#searchMbshEnFnm').focus();
		return;
	}
	//html 가져오기
	var string = $("form[name=mbshPotitForm]").serialize();
	$.ajax(
            {
                url: '/'+popPointHotlPath+'/mbsh/'+path2+'/viewPointEnd.do',
                data: string,
                type: "post",
                dataType: "html",
                error: function(){
                	errorCheck = "fail";
                },
                success: function( strData ){
                	mbshPotinRead.html(strData);
                }
            }                           
     );
	
}





