// JavaScript Document
////////////// �앹뾽�� /////////////////

function popupSample() {// �섑뵆�앹뾽
	window.open('../COMMON/popup.html','popupSample','scrollbars=no,width=800,height=540,left=100,top=100,resizable=yes');
}

$(document).ready(function () {
	
	
	$(".head").addClass("headHub");
	$(".mainWrap").addClass("mainWrapHub");
	$(".subWrap").addClass("subWrapHub");
	$(".foot").addClass("footHub");
	
	$("input:disabled").addClass("disabled");
	$("textarea:disabled").addClass("disabled");
	$("input:checkbox").addClass("checkbox");
	$("input:radio").addClass("radio");
	
	$("input:text").add("input:password").add("textarea").on({
	  focus: function() {
		$(this).addClass("focus");
	  },
	  blur: function() {
		$(this).removeClass("focus");
	  },
	  mouseover: function() {
		$(this).addClass("hover");
	  },
	  mouseout: function() {
		$(this).removeClass("hover");
	  }
	});
	
	//�낅젰�쇱뿉 �먮룞�꾩꽦李⑤떒
	uiAutocompleteOff = function(){
		$("input").attr("autocomplete","off");
		$("textarea").attr("autocomplete","off");
	}
	uiAutocompleteOff();
	
	//湲곕낯 UL�쒓렇  泥쳊i.first  �쓑i.last 
	ulListSet = function(){
		var ulList= $('ul');
		ulList.find("li:first-child").addClass("first");
		ulList.find("li:last-child").addClass("last");
	}
	ulListSet();


	tableTypeA = function(){
	var tableTypeA = $('.tableTypeA');
	tableTypeA.find(" tbody tr:first").addClass("first");
	tableTypeA.find(" tbody tr:last").addClass("last");
	
	tableTypeA.find("tr td:first").addClass("first");
	tableTypeA.find("tr td:last").addClass("last");
	tableTypeA.find("tr th:first").addClass("first");
	tableTypeA.find("tr th:last").addClass("last");
	}
	tableTypeA();
	
	
	tableTypeD = function(){
	var tableTypeD = $('.tableTypeD');
	tableTypeD.find(" tbody tr:first").addClass("first");
	tableTypeD.find(" tbody tr:last").addClass("last");
	var tableTypeDtr = $('.tableTypeD tr');
	tableTypeDtr.find("td:first").addClass("first");
	tableTypeDtr.find("td:last").addClass("last");
	tableTypeDtr.find("th:first").addClass("first");
	tableTypeDtr.find("th:last").addClass("last");
	}
	tableTypeD();

	tableCol = function(){
	var tableCol = $('table colgroup');
	tableCol.find("col:eq(0)").addClass("col1");
	tableCol.find("col:eq(1)").addClass("col2");
	tableCol.find("col:eq(2)").addClass("col3");
	tableCol.find("col:eq(3)").addClass("col4");
	tableCol.find("col:eq(4)").addClass("col5");
	tableCol.find("col:eq(5)").addClass("col6");
	tableCol.find("col:eq(6)").addClass("col7");
	tableCol.find("col:eq(7)").addClass("col8");
	tableCol.find("col:eq(8)").addClass("col9");
	tableCol.find("col:eq(9)").addClass("col10");
	}
	tableCol();


	// UiForm �곸슜 �대옒�ㅻ뱾..
	//$("select.uiform , input.uiform , textarea.uiform").uniform();
	
	
	//紐⑤떖 �덈룄�� 諛곌꼍//
	$(".mdScreen").height($(document).height() );
	$(window).resize(function() {
	 	$(".mdScreen").height($(document).height() )  ;
	});


	
	//�ㅻ뜑 �묐컮濡쒓�湲� 硫붾돱
	$(".destination a.btn").on("click",function(e){
		if($(".destination .list").is(":visible")){
			$(".destination .list").hide();	
		}else{	
			$(".destination .list").show();
		}
		e.stopPropagation();
	}); 
	$(document).click(function(){
		$(".destination .list").hide();
	});
	$(".destination .list").click(function(e){
		e.stopPropagation();
	}); 
	

	//�쒓� �곸뼱 �쇰낯�� 以묎뎅�� 硫붾돱
	$(".globalBox a.btn").on("click",function(e){
		if($(".globalBox .list").is(":visible")){
			$(".globalBox .list").hide();	
		}else{	
			$(".globalBox .list").show();
		}
		e.stopPropagation();
	}); 
	$(document).click(function(){
		$(".globalBox .list").hide();
	});
	$(".globalBox .list").click(function(e){
		e.stopPropagation();
	}); 
	
	
	//find a hotel 硫붾돱
	$(".hotelBox a.btn").on("click",function(e){
		if($(".hotelBox .list").is(":visible")){
			$(".hotelBox .list").hide();	
		}else{	
			$(".hotelBox .list").show();
		}
		e.stopPropagation();
	}); 
	$(document).click(function(){
		$(".hotelBox .list").hide();
	});
	$(".hotelBox .list").click(function(e){
		e.stopPropagation();
	});
	
	//find a hotel 硫붾돱
	$(".hotelBox2 a.btn").on("click",function(e){
		if($(".hotelBox2 .list").is(":visible")){
			$(".hotelBox2 .list").hide();	
		}else{	
			$(".hotelBox2 .list").show();
		}
		e.stopPropagation();
	}); 
	$(document).click(function(){
		$(".hotelBox2 .list").hide();
	});
	$(".hotelBox2 .list").click(function(e){
		e.stopPropagation();
	});
	
	var bbsList = $('.bbsList');
	bbsList.find(" tbody tr:first").addClass("first");
	bbsList.find(" tbody tr:last").addClass("last");
	
	// 寃뚯떆�먮━�ㅽ듃
	$(".bbsListLine tbody tr").hover(
		function() {
			$(this).addClass("hover");
		},
		function() {
			$(this).removeClass("hover");
		}
	);


	////gnbMenu �ㅽ겕由쏀듃////
	var gnbMenuSm = $('.gnbMenu .sm ul');
	gnbMenuSm.find("li:last").addClass("last");
	
	var gnbMenu = $('.gnbMenu');
	gnbMenu.find('>ul>li>a')
	.mouseover(function(){
		gnbMenu.find('>ul>li>.sm:visible').hide()
		$(this).next('.sm').show()
		
		gnbMenu.find('>ul>li>a').removeClass("over")
		$(this).addClass("over");
		gnbMenu.find('>ul>li>a.on .sm').show()
	})
	.focus(function(){
		$(this).mouseover();
	})	
	gnbMenu.find('>ul>li>.on')
	.mouseover(function(){	
		$(this).next('.sm').show()	
	})

	.focus(function(){
		$(this).mouseover();
	})
	.end()
	
	$('.gnbMenu .menu').mouseleave(function(){
		$('.gnbMenu ul li>a').next().hide();
		$('.gnbMenu ul li>a.on').next().show();
	});
	
	$(".btnGnbReservation").on("click",function(e){
		if($(".gnbReservationBox").is(":visible")){
			$(".gnbReservationBox").hide();	
			$(this).attr("title" , "�덉빟�⑤꼸�닿린");
		}else{	
			$(".gnbReservationBox").show();
			$(this).attr("title" , "�덉빟�⑤꼸�リ린");
		}
		e.stopPropagation();
	}); 
	$(document).click(function(){
		$(".gnbReservationBox").hide();
	});
	$(".gnbReservationBox").click(function(e){
		e.stopPropagation();
	}); 
	
	
	
	$(".btnGnbReservation").on("mouseover focus",function(e){
		if($(".gnbReservationBox").is(":visible")){
			$(".btnGnbReservation").removeClass("on");
		}else{	
			$(".gnbReservationBox").show();
			$(this).attr("title" , "�덉빟�⑤꼸�リ린");
			$(".btnGnbReservation").addClass("on");
		}
		e.stopPropagation();
	}); 
	$(document).mouseover(function(){
		$(".gnbReservationBox").hide();
		$(".btnGnbReservation").removeClass("on");
	});
	$(".gnbReservationBox").mouseover(function(e){
		e.stopPropagation();
	}); 
	
	
	
	
	//�명꽣�먯엳�� �댁뒪�덊꽣�좎껌��
	$(".newsLetter input.newsEmail").val("");
	$(".newsLetter input.newsEmail").on("focus", function(){
		var $idTxt = $(this).val();
		if ( $idTxt ==("") ) {
			$(this).addClass("uiFocus");
		}
	});
	$(".newsLetter input.newsEmail").on("blur", function(){
		var $idTxt = $(this).val();
		if ( $idTxt ==("") ) {
			$(this).val("");
			$(this).removeClass("uiFocus")
		}
	}); 

	
	/////////////////////////////////////



//	var bbsList = $('.bbsList');
//	bbsList.find("tbody tr:odd").addClass("odd");
//	bbsList.find(" tbody tr:first").addClass("first");
//	bbsList.find(" tbody tr:last").addClass("last");




/// ���됲듃硫붾돱 �ㅽ겕由� ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	// Common
	var select_root = $('div.uiSelectA');
	var select_value = $('.myValue');
	var select_a = $('div.uiSelectA>ul>li>a');
	var select_input = $('div.uiSelectA>ul>li>input[type=radio]');
	var select_label = $('div.uiSelectA>ul>li>label');
	
	// Radio Default Value
	$('div.myValue').each(function(){
		var default_value = $(this).next('.iList').find('input[checked]').next('label').text();
		$(this).append(default_value);
	});
	
	// Line
	select_value.bind('focusin',function(){$(this).addClass('outLine');});
	select_value.bind('focusout',function(){$(this).removeClass('outLine');});
	select_input.bind('focusin',function(){$(this).parents('div.uiSelectA').children('div.myValue').addClass('outLine');});
	select_input.bind('focusout',function(){$(this).parents('div.uiSelectA').children('div.myValue').removeClass('outLine');});
	
	// Show
	function show_option(){
		$(this).parents('div.uiSelectA:first').toggleClass('open');
	}
	
	// Hover
	function i_hover(){
		$(this).parents('ul:first').children('li').removeClass('hover');
		$(this).parents('li:first').toggleClass('hover');
	}
	
	// Hide
	function hide_option(){
		var t = $(this);
		setTimeout(function(){
			t.parents('div.uiSelectA:first').removeClass('open');
		}, 1);
	}
	
	// Set Input
	function set_label(){
		var v = $(this).next('label').text();
		$(this).parents('ul:first').prev('.myValue').text('').append(v);
		$(this).parents('ul:first').prev('.myValue').addClass('selected');
	}
	
	// Set Anchor
	function set_anchor(){
		var v = $(this).text();
		$(this).parents('ul:first').prev('.myValue').text('').append(v);
		$(this).parents('ul:first').prev('.myValue').addClass('selected');
	}

	// Anchor Focus Out
	$('*:not("div.uiSelectA a")').focus(function(){
		$('ul').parent('.uiSelectA').removeClass('open');
	});
	
	select_value.click(show_option);
	select_root.find('ul').css('position','absolute');
	select_root.removeClass('open');
	select_root.mouseleave(function(){$(this).removeClass('open');});
	select_a.click(set_anchor).click(hide_option).focus(i_hover).hover(i_hover);
	select_input.change(set_label).focus(set_label);
	select_label.hover(i_hover).click(hide_option);
	
	// Form Reset
	$('input[type="reset"], button[type="reset"]').click(function(){
		$(this).parents('form:first').find('.myValue').each(function(){
			var origin = $(this).next('ul:first').find('li:first label').text();
			$(this).text(origin).removeClass('selected');
		});
	});
	

/// ���됲듃硫붾돱 �ㅽ겕由� ��////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



	//泥⑤��뚯씪 �좏깮 UI 怨듯넻
	$(".uiAttachFile .fileInput").on("change", function(){ 
		$(this).parent().parent().children(".fileLocation").val(this.value);
	});	



});












