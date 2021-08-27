/*
 * ---------------------------------------------------------------------------------------------
 * 객실/패키지/MICE 예약
 * ---------------------------------------------------------------------------------------------
 */

/*
 * ---------------------------------------------------------------------------------------------
 * 성인수, 어린이수 selectbox 옵션 셋팅
 * ---------------------------------------------------------------------------------------------
 */
function setGuestCntOpt(type, hotlId) {
	
	var roomCnt  = $("#roomCnt").val();
	var adltCnt = $("#adltCnt").val();
	var chldCnt = $("#chldCnt").val();
	var grRblokId = $("#grRblokId").val();
	var roomCd = $("#roomCd").val();
	
	if(roomCnt != '') {
		
		var param = {'type':type, 
	               	 'hotlId':hotlId,
	               	 'roomCnt':roomCnt,
	               	 'adltCnt':adltCnt,
	               	 'chldCnt':chldCnt,
	               	 'grRblokId':grRblokId,
	               	 'roomCd':roomCd};
		$.ajax({
			  url: URL_PREFIX + "/resv/rpm/memListGuestCntOpt.do",
			  cache: false,
			  type: "POST",
			  data:"data="+encodeURIComponent(JSON.stringify(param))
			}).done(function( html ) {
				
				$("#guestCntOpt").empty();
			  	$("#guestCntOpt").html(html);

			  	$("select").not("#hotlId_selection").uniform();
			  	
				// 예약화면 객실수 정보 표시
				setRoomCntInfo();
				
				$("#coporateCd").focus();
			}).fail(function(jqXHR, textStatus) {
				  alert( "setGuestCntOpt Request failed: " + textStatus );
			}); // end of ajax
			
	}
	
}

/*
 * ---------------------------------------------------------------------------------------------
 * 객실/패키지/MICE 예약
 * ---------------------------------------------------------------------------------------------
 */

/*
 * ---------------------------------------------------------------------------------------------
 * 성인수, 어린이수 selectbox 옵션 셋팅
 * ---------------------------------------------------------------------------------------------
 */
function setGuestCntOpt2(type, hotlId) {
	
	var roomCnt  = $("#roomCnt").val();
	var adltCnt = $("#adltCnt").val();
	var chldCnt = $("#chldCnt").val();
	var grRblokId = $("#grRblokId").val();
	var roomCd = $("#roomCd").val();
	
	if(roomCnt != '') {
		
		var param = {'type':type, 
				               'hotlId':hotlId,
							   'roomCnt':roomCnt,
							   'adltCnt':adltCnt,
							   'chldCnt':chldCnt,
							   'grRblokId':grRblokId,
							   'roomCd':roomCd};
		$.ajax({
			  url: URL_PREFIX + "/resv/rpm/memListGuestCntOpt.do",
			  cache: false,
			  type: "POST",
			  data:"data="+encodeURIComponent(JSON.stringify(param))
			}).done(function( html ) {
				
				//alert(html);
				$("#guestCntOpt").empty();
			  	$("#guestCntOpt").html(html);

			  	$("select").uniform();
			  	
				// 예약화면 객실수 정보 표시
				setRoomCntInfo();
				
				if($("#roomCnt").size() > 0) {
					$("#roomCnt:eq(0)").focus();
				}
				
			}).fail(function(jqXHR, textStatus) {
				  alert( "setGuestCntOpt Request failed: " + textStatus );
			}); // end of ajax
			
	}
	
}

/*
 * ---------------------------------------------------------------------------------------------
 * 성인수, 어린이수 selectbox 옵션 셋팅 - setstep1용
 * ---------------------------------------------------------------------------------------------
 */
function setGuestCntOpt3(type, hotlId) {
	
	var roomCnt  = $("#roomCnt").val();
	var adltCnt = $("#adltCnt").val();
	var chldCnt = $("#chldCnt").val();
	var grRblokId = $("#grRblokId").val();
	var roomCd = $("#roomCd").val();
	
	type = "";
	hotlId = "";
	roomCnt = "1";
	adltCnt = "";
	chldCnt = "";
	grRblokId = "";
	roomCd = "";
	
	if(roomCnt != '') {
		var param = {'type':type, 
				               'hotlId':hotlId,
							   'roomCnt':roomCnt,
							   'adltCnt':adltCnt,
							   'chldCnt':chldCnt,
							   'grRblokId':grRblokId,
							   'roomCd':roomCd};
		
		$.ajax({
			  url: URL_PREFIX + "/resv/rpm/memListGuestCntOpt.do",
			  cache: false,
			  type: "POST",
			  data:"data="+encodeURIComponent(JSON.stringify(param))
			}).done(function( html ) {
				
				$("#guestCntOpt").empty();
			  	$("#guestCntOpt").html(html);

			  	$("select").uniform();
			  	
				// 예약화면 객실수 정보 표시
				setRoomCntInfo();
				
				$("#tmpCoporateCd").focus();
				
			}).fail(function(jqXHR, textStatus) {
				  alert( "setGuestCntOpt Request failed: " + textStatus );
			}); // end of ajax
			
	}
	
}
function setGuestCntOpt4(type, hotlId) {
	
	var roomCnt  = $("#roomCnt").val();
	var adltCnt = $("#adltCnt").val();
	var chldCnt = $("#chldCnt").val();
	var grRblokId = $("#grRblokId").val();
	var roomCd = $("#roomCd").val();
	
	if(roomCnt != '') {
		var param = {'type':type, 
					 'hotlId':hotlId,
					 'roomCnt':roomCnt,
					 'adltCnt':adltCnt,
					 'chldCnt':chldCnt,
					 'grRblokId':grRblokId,
					 'roomCd':roomCd};
		$.ajax({
			  url: URL_PREFIX + "/resv/rpm/memListGuestCntOpt.do",
			  cache: false,
			  type: "POST",
			  data:"data="+encodeURIComponent(JSON.stringify(param))
			}).done(function( html ) {
				
				$("#guestCntOpt").empty();
			  	$("#guestCntOpt").html(html);

			  	//$("select").uniform();
			  	
				// 예약화면 객실수 정보 표시
				setRoomCntInfo();
				
				if($("#hotlIdSel").size() > 0) {
					$("#hotlIdSel").focus();
				}
				
				
			}).fail(function(jqXHR, textStatus) {
				  alert( "setGuestCntOpt Request failed: " + textStatus );
			}); // end of ajax
			
	}
	
}
/*
 * ---------------------------------------------------------------------------------------------
 * 어린이수 selectbox 옵션 셋팅
 *
 * @param roomIdx 객실index
 * ---------------------------------------------------------------------------------------------
 */
function setChildCntOpt(roomIdx) {
	
	var opt = "";
	var adultCnt = $("select[name='adultCnt"+roomIdx+"']").val();
	
	
	if(adultCnt == '1'){
		for(var i=0;i<3;i++) {
			opt += "<option value='"+i+"'>"+i+"</option>";
		} // end of for
	}else if(adultCnt == '2'){
		 if($("#hotlId").val() == 'S' || $("#hotlId").val() == 'C'){
			for(var i=0;i<3;i++) {
				opt += "<option value='"+i+"'>"+i+"</option>";
			}	 
		 }else{
			for(var i=0;i<2;i++) {
				opt += "<option value='"+i+"'>"+i+"</option>";
			}
		 } 
		
		if('${HOTL_TYPE}' == 'HUB'){
			opt += "<option value='2'>2</option>";
		}
	}else{
		opt += "<option value='0'>0</option>";
	}
	
	$("#childCnt"+roomIdx).empty();
	$("#childCnt"+roomIdx).append(opt);
	
	$("select").not("#hotlId_selection").uniform();
	
	// 예약화면 객실수 정보 표시
	setRoomCntInfo();
	
	if($("select[name='adultCnt"+roomIdx+"']").size() > 0) {
		$("select[name='adultCnt"+roomIdx+"']").focus();
	}
}

function setChildCntOpt2(roomIdx) {
	
	var opt = "";
	var adultCnt = $("select[name='adultCnt"+roomIdx+"']").val();
	
	if('3' == adultCnt) {
		opt += "<option value='0'>0</option>";
	} else if('2' == adultCnt || '1' == adultCnt) {
		
		var _MAX_LOOP_COUNT = 3;
		
		if($("#hotlIdSel").val() == "D" && $("#roomAd1").val() == "2") {
			_MAX_LOOP_COUNT = 2;
		}
		
		for(var i=0;i<_MAX_LOOP_COUNT;i++) {
			opt += "<option value='"+i+"'>"+i+"</option>";
		} // end of for
	} 
	
	$("#roomKid"+roomIdx).empty();
	$("#roomKid"+roomIdx).append(opt);
	
	$("select").uniform();
	
	// 예약화면 객실수 정보 표시
	setRoomCntInfo();
	
	if($("select[name='adultCnt"+roomIdx+"']").size() > 0) {
		$("select[name='adultCnt"+roomIdx+"']:eq(0)").focus();
	}
}

/*
 * ---------------------------------------------------------------------------------------------
 * 예약달력 생성
 *
 * @param today 오늘날짜(yy-mm-dd)
 * ---------------------------------------------------------------------------------------------
 */
function createresvCalendar(options) {

	//$("#ckinYmd").val(""); // 체크인날짜
	//$("#ckoutYmd").val("");// 체크아웃 날짜
	//$("#nightCnt").val(""); // 숙박일수
	
	//if($.trim($("#calenderDiv").html()) == "") {
		$.resvCalendar.setDefaults(options).createCalendar();
	//}
    
	$(".calendarReserveBox").show();
} 

/*
 * ---------------------------------------------------------------------------------------------
 * 예약달력 리셋
 *
 * @param today 오늘날짜(yy-mm-dd)
 * ---------------------------------------------------------------------------------------------
 */
function reseteresvCalendar(options) {
	
	$("#ckinYmd").val(""); // 체크인날짜
	$("#ckoutYmd").val("");// 체크아웃 날짜
	$("#nightCnt").val(""); // 숙박일수
	
	$.resvCalendar._resetSelDate();
	
	$.resvCalendar.setDefaults(options).createCalendar();
    
	$(".calendarReserveBox").show();
}

/*
 * ---------------------------------------------------------------------------------------------
 * 예약화면 객실수 정보 표시
 * ---------------------------------------------------------------------------------------------
 */
function setRoomCntInfo() {
	
	// 예약화면이면 객실수 정보 표시
	if($("#roomCntInfo")) {
		
		
		var adltList = [], chldList = [];
		var roomCnt = $("#roomCnt").val();
		var resvTypCd = $("#resvTypCd").val();
		
		$("select[name^='adultCnt']").each(function(index){
			adltList.push($("select[name='adultCnt"+(index+1)+"']").val());
		});
		
		
		//if('M' !=  resvTypCd) {
			$("select[name^='childCnt']").each(function(index){
				chldList.push($("select[name='childCnt"+(index+1)+"']").val());
			});
		//}
		
		var data = { 'resvTypCd':resvTypCd, 
				           'roomCnt':roomCnt, 
				           'adltCnt':adltList.toString(), 
				           'chldCnt':chldList.toString()};
		
		$.ajax({
			  url: URL_PREFIX + "/resv/rpm/memRoomCntInfo.do",
			  cache: false,
			  type: "POST",
			  data:"data="+encodeURIComponent(JSON.stringify(data))
			}).done(function( html ) {
			  	$("#roomCntInfo").html(html);
			  	
			}).fail(function(jqXHR, textStatus) {
				  //alert( "roomCntInfo Request failed: " + textStatus );
			}); // end of ajax
		
	} // end of roomCntInfo
	
}

/*
 * ---------------------------------------------------------------------------------------------
 * 예약정보 초기화
 * ---------------------------------------------------------------------------------------------
 */
function resetResv(step, kind) {
	
	if('A' == kind) {
		$("#ckinYmd").val("");
		$("#ckoutYmd").val("");
		$("#nightCnt").val("");
		$("#roomCnt").val("1");
		$("#adltCnt").val("1");
		$("#chldCnt").val("");
		$("#resvTypCd").val("");
		$("#roomCd").val("");
		$("#spofrId").val("");
		$("#packItNo").val("");
		$("#grRblokId").val("");
		$("#modResvId").val("");
		$("#modMultiResvId").val("");
		$("#coporateCd").val("");
		$("#coporateVal").val("");
	} 
	
	$("#roomCnt").remove();
	$("#adltCnt").remove();
	$("#chldCnt").remove();	

	$('#resvForm').attr('action', URL_PREFIX + "/resv/rpm/memSetStep1.do").submit();
	
}

/*
 * ---------------------------------------------------------------------------------------------
 * 요금상세 레이어 열기
 * ---------------------------------------------------------------------------------------------
 */
function openStayPricDetail(id, isSecured) {
	
	var url = "";
	if(isSecured == 'true') {
		url = URL_PREFIX + "/secu/rpm/stayPricDetail.do";
	} else {
		url = URL_PREFIX + "/resv/rpm/memStayPricDetail.do";
	}
	
	$("#"+id).append('<input type="hidden" id="formId" name="formId" value="'+id+'" />');
	
	
	$.ajax({
		  url: url,
		  cache: false,
		  type: "POST",
		  data:"data="+encodeURIComponent(JSON.stringify($("#"+id).serializeObject()))
		}).done(function( html ) {

			$('body').prepend("<div id='stayPricDetail' style='display:none'></div><div style='display: block;' class='mdScreen'></div>");
			$("#stayPricDetail").html(html);
			$("#stayPricDetail").show();
			$("#stayPricDetail").attr("tabindex",-1).focus();
			
		}).fail(function(jqXHR, textStatus) {
			  alert( "openStayPricDetail Request failed: " + textStatus );
		}); // end of ajax
			
	
}

/*
 * ---------------------------------------------------------------------------------------------
 * 요금상세 레이어 닫기
 * ---------------------------------------------------------------------------------------------
 */
function closeStayPricDetail() {
	
	$("#stayPricDetail").remove();
	$(".mdScreen").remove();
	$("#stayPricDetailBtn").focus();
	$("#formId").remove();
	$("#printYn").remove();
	$("#data").remove();
}

/*
 * ---------------------------------------------------------------------------------------------
 * 달력이동
 * ---------------------------------------------------------------------------------------------
 */
function goResvCalendar(ckinYmd) {
	
	//값이 입력 되지 않으면 진행하지 않는다.
	if(ckinYmd==''){
		return;
	}
	
	//var diffDay = $.resvCalendar._getDiffOfDate($.resvCalendar._defaults.today,ckinYmd);
	//var diffMonth = Math.floor(diffDay/30);
	var today = $.resvCalendar._defaults.today;
	var todayYearMonth = today.replace("-", "").substring(0, 6); 
	var ckinYmdYearMonth = ckinYmd.replace("-", "").substring(0, 6);	
	var diffMonth =0;
	
	
	/**
	 * 입력 순서에 주의
	 * 
	 * 에러나면 0를 던짐
	 */
	diffMonth =monthDiff(todayYearMonth, ckinYmdYearMonth);
	
	/*
	 * 
	console.log("today:"+today);
	console.log("checkIn:"+ckinYmd);
	console.log("todayYearMonth"+todayYearMonth);
	console.log("ckinYmdYearMonth"+ckinYmdYearMonth);
	*/
	
	/*
	 * 과거 로직
	if(diffMonth >= 1){
		console.log("start2");
		$.resvCalendar._refreshCalendar(diffMonth);
	}
	*/

	$.resvCalendar._refreshCalendar(diffMonth);
	
}

/**
 * 사용시 from to 순서가 중요함
 * 형태 yyyyMM : String
 * -로 나오는 경우에는 to 과거임
 */
function monthDiff(from, to){
	
	var fromYear = from.substring(0,4);
	var fromMonth = from.substring(4, 6);
	var toYear = to.substring(0,4);
	var toMonth = to.substring(4, 6);
	var diff =0;
	
	try{
		yearDiff = parseInt(toYear) - parseInt(fromYear);
		monthDiff =parseInt(toMonth) - parseInt(fromMonth);
		diff = yearDiff * 12 + monthDiff;
		
		return diff;
		
	}catch(err){
		//에러가 발생하는 경우
		return 0;
	}
	
	
	
	
}
