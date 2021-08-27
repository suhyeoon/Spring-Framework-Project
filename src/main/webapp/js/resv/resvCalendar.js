(function( $, undefined ) {
	
	$.extend($.ui, { resvCalendar: { version: "1.10.0" } });
	
	var dpuuid = new Date().getTime();
	
	function ResvCalendar() {
		this._today = null; // today date
		this._prevDate = null; // prev date
		this._prevYear = null; // prev year(yy)
		this._prevMonth = null; // pre month(mm)
		this._nextDate = null; // next date
		this._nextYear = null; // next year(yy)
		this._nextMonth = null; // next month(mm)
		
		this._clickCnt = 0; // click count
		this._selCkInDate = null; // selected ckin
		this._selCkOutDate = null; // selected ckout
		this._tmpCkIndate = null; //select chkin
		
		this._limitCnt = 7; // avail day list
		
		this._defaults = { // Global defaults for all the date picker instances
				calDiv: null,
				ckinYmdId: null,
				ckoutYmdId: null,
				nightCnt: null,
				resvDateInfoId:null,
				ckinYmdInfoId: null,
				ckoutYmInfodId: null,
				nightCntInfoId: null,
				today: null
		};
		
	};
	
	$.extend(ResvCalendar.prototype, {

		/* Override the default settings for all instances of the date picker.
		 * @param  settings  object - the new settings to use as defaults (anonymous object)
		 * @return the manager object
		 */
		setDefaults: function(settings) {
			$.extend(this._defaults, settings || {});
			for (var name in settings) {
				if (settings[name] == null) {
					this._defaults[name] = settings[name];
				}
			}
			
			var parts = this._defaults.today.split('-');
			
			this._today = new Date(parts[0], parts[1]-1, 1); // 오늘 날짜 date 셋팅
			this._prevDate= this._today; // 이전(혹은 현재) 날짜 date 셋팅
			this._prevYear = this.formatDate('yy', this._prevDate); // 이전(혹은 현재) 년도
			this._prevMonth = this.formatDate('mm', this._prevDate); // 이전(혹은 현재) 월
			this._nextDate = this.addMonths(this._prevDate, 1);
			this._nextYear = this.formatDate('yy', this._nextDate); // 다음 년도
			this._nextMonth = this.formatDate('mm', this._nextDate); // 다음 월
			
			return this;
		},
		
		createCalendar:function() {
			
			if(this._clickCnt % 2 == 0) {
				this._clickCnt = 0; // click count
			}
			
			var div = $("#" + this._defaults.calDiv);
			div.html(this.getCalendarHtml()); //칼렌더 다시그리기
			
			// Prev
			div.find(".btnPrev").bind('click', function() {
				window["DP_jQuery_" + dpuuid].resvCalendar._refreshCalendar(-1);
			});
			
			// Next
			div.find(".btnNext").bind('click', function() {
				window["DP_jQuery_" + dpuuid].resvCalendar._refreshCalendar(1);
			});
			
			this._setAvailDay();
			
		},
		
		_refreshCalendar: function(period) {
			
			this._prevDate = new Date(this._prevYear, (this._prevMonth-1)+period , 1); // 이전 date
			this._prevYear = this.formatDate('yy', this._prevDate); // 이전 년도
			this._prevMonth = this.formatDate('mm', this._prevDate); // 이전 월
			
			this._nextDate= new Date(this._prevYear, this._prevMonth,1); // 다음 date
			this._nextYear = this.formatDate('yy', this._nextDate); // 다음 년
			this._nextMonth = this.formatDate('mm', this._nextDate); // 다음 월
			
			
			this.createCalendar();
			
			if(period < 0) { //시작날짜 초기화
				this._clickCnt = 0; // click count
			}
			
		},
		
		getCalendarHtml: function() {
			
			var calHtml = "";
			calHtml +=  this._getNavHtmlL();
			calHtml +=  "  <div class='calendarReserve calendarPrevL'>";
			calHtml +=  this._getCalendarTableHtml(this._prevYear, this._prevMonth);
			calHtml +=  "  </div>";
			calHtml +=  this._getNavHtmlR();
			calHtml +=  "  <div class='calendarReserve calendarNextR'>";
			calHtml +=  this._getCalendarTableHtml(this._nextYear, this._nextMonth);
			calHtml +=  "  </div>";
			/*calHtml +=  "  <div class='rStatus'>";
			calHtml +=  "    <ul>";
			calHtml +=  "      <li class='first'><em class='ico1'>"+messages["javascript.calendar.resv.posb.date"]+"</em></li>";
			calHtml +=  "      <li class='last'><em class='ico2'>"+messages["javascript.calendar.resv.non.posb.date"]+"</em></li>";
			calHtml +=  "    </ul>";
			calHtml +=  "  </div>";*/
		
			return calHtml;
		},
		
		/* pre, next 네비게이션 html 생성. */
		_getNavHtml: function() {
			
			var navHtml = "", prevClassNm = "";
			navHtml +=  "  <div class='dateNav'>";
			if(this.formatDate('yy', this._today) == this._prevYear && this.formatDate('mm', this._today) == this._prevMonth) {
				prevClassNm = "btnNone";
			} else {
				prevClassNm = "btnPrev";
			}
			navHtml +=  "    <div class='datePrev'><a href='javascript:;' class='" + prevClassNm + "'>" + this._prevYear + "." + this._prevMonth +"</a></div>";
			navHtml +=  "    <div class='dateNext'><a href='javascript:;' class='btnNext'>" + this._nextYear + "." + this._nextMonth + "</a></div>";
			navHtml +=  "  </div>";
			
			return navHtml;
			
		},
		
		_getNavHtmlL: function() {
			
			var navHtml = "", prevClassNm = "";
			navHtml +=  "  <div class='dateNavL'>";
			if(this.formatDate('yy', this._today) == this._prevYear && this.formatDate('mm', this._today) == this._prevMonth) {
				prevClassNm = "btnNone";
			} else {
				prevClassNm = "btnPrev";
			}
			navHtml +=  "    <div class='datePrev'><a href='javascript:;' class='" + prevClassNm + "'>" + this._prevYear + "." + this._prevMonth +"</a></div>";
			navHtml +=  "  </div>";
			
			return navHtml;
			
		},

		_getNavHtmlR: function() {
			
			var navHtml = "", prevClassNm = "";
			navHtml +=  "  <div class='dateNavR'>";
			navHtml +=  "    <div class='dateNext'><a href='javascript:;' class='btnNext'>" + this._nextYear + "." + this._nextMonth + "</a></div>";
			navHtml +=  "  </div>";
			
			return navHtml;
			
		},
		
		_getCalendarTableHtml: function(drawYear, drawMonth) {
			
			var tableHtml = "";
			tableHtml +=  "    <table summary='"+messages["javascript.calendar.table.summary"]+"'>";
			tableHtml +=  "      <caption>"+messages["javascript.calendar.table.caption"].replaceMsg([drawYear+'.'+drawMonth])+"</caption>";
			tableHtml +=  "      <thead>";
			tableHtml +=  "        <tr>";
			tableHtml +=  "          <th class='sun' scope='col'><span>"+messages["javascript.calendar.table.col.sun"]+"</span></th>";
			tableHtml +=  "          <th class='mon' scope='col'><span>"+messages["javascript.calendar.table.col.mon"]+"</span></th>";
			tableHtml +=  "          <th class='tue' scope='col'><span>"+messages["javascript.calendar.table.col.tue"]+"</span></th>";
			tableHtml +=  "          <th class='wed' scope='col'><span>"+messages["javascript.calendar.table.col.wed"]+"</span></th>";
			tableHtml +=  "          <th class='thu' scope='col'><span>"+messages["javascript.calendar.table.col.thu"]+"</span></th>";
			tableHtml +=  "          <th class='fri' scope='col'><span>"+messages["javascript.calendar.table.col.fri"]+"</span></th>";
			tableHtml +=  "          <th class='sat' scope='col'><span>"+messages["javascript.calendar.table.col.sat"]+"</span></th>";
			tableHtml +=  "        </tr>";
			tableHtml +=  "      </thead>";
			tableHtml +=  "      <tbody>";
			
			// td loop
			var month = parseInt(drawMonth) -1;
			var dayOfMonth = 1;
			var daysInMonth = this._getDaysInMonth(drawYear, month); // 마지막 날
		    
			// tr loop
			for(var row=0; row < 6; row++) {
				
				var trClassNm = "";
				if(row==0) trClassNm = "class='first'"; else if(row==5) trClassNm = "class='last'"; else trClassNm = ''; 
				
				tableHtml +=  "        <tr " + trClassNm + ">";
				
				for(var col=0; col < 7; col++) {
					
					if(col == 0) tdClassNm = "class='sun'"; else if(col == 6) tdClassNm = "class='sat'"; else tdClassNm = '';
					tableHtml +=  "<td " + tdClassNm + ">";
					
					if(col == this.getDayOfWeek(drawYear, month, dayOfMonth) && dayOfMonth <= daysInMonth) {
						
						var spanClassNm = "";
						var idDate = this.formatDate('yy-mm-dd', new Date(drawYear, month, dayOfMonth)) ;
						
						//alert('today:'+this._defaults.today+',id:'+idDate);
						if(this._defaults.today == idDate) {
							spanClassNm = "class='today'"; 
						//} else if(this._getDiffOfDate(this._defaults.today, idDate) < 0) {
						//} else {
						//	spanClassNm = "class='rNoDate'";
						}
						
						tableHtml +=  "<span id="+ idDate +" " + spanClassNm + ">";
						//tableHtml +=  "<a href='javascript:;'>";
						tableHtml +=  "<a>";
						tableHtml +=  dayOfMonth;
						tableHtml +=  "</a>";
						tableHtml +=  "</span>";
						dayOfMonth++;
					} else {
						tableHtml +=  "<span>&nbsp;</span>";
					}
					
					tableHtml +=  "</td>";
					
				} // end of day
				
				tableHtml +=  "        </tr>";
			} // end of row
			
			tableHtml +=  "      </tbody>";
			tableHtml +=  "    </table>";
			
			return tableHtml;
		},
		
		_setAvailDay: function() {
			
			var today = this._defaults.today;
			var ckinYmd = this.formatDate('yy-mm-dd', this._prevDate); 
			var ckoutYmd = this.formatDate('yy-mm-dd',this.getLastDateOfMonth(this._nextDate)); 
			//var hotlId = $("select[name='hotlId_selection']").val() ? $("select[name='hotlId_selection']").val() : null;
			var hotlId =$("#hotlId").val() ? $("#hotlId").val() : null;
			var resvTypCd = $("#resvTypCd") ? $("#resvTypCd").val() : null;
			var roomCd = $("#roomCd") ? $("#roomCd").val() : null;
			var spofrId = $("#spofrId") ? $("#spofrId").val() : null;
			//var grRblokId = $("#grRblokId") ? $("#grRblokId").val() : null;
			//var coporateVal = $("#coporateVal") ? $("#coporateVal").val() : null;
			var coporateVal = $("#coporateVal").val()||'';
			var coporateCd = $("#coporateCd") ? $("#coporateCd").val() : null;
			
			var g_selCkInDate = this._selCkInDate;
			
			//ajax 로딩이미지 삽입
			$('.opacity').show();
			$('.re-loader').show();
			
			//console.log("loader open");
			
			$.ajaxSetup({
				timeout: 60000
			});
			
			var data = {'hotlId':hotlId, 'ckinYmd':ckinYmd,'ckoutYmd':ckoutYmd,'resvTypCd':resvTypCd,'roomCd':roomCd,'spofrId':spofrId,'coporateVal':coporateVal,'coporateCd':coporateCd};
			
			
			$.getJSON( "/membership/resv/rpm/memListAvailDay.do", 
					 "data="+encodeURIComponent(JSON.stringify(data))
			).done(function( json ) {
				var dayList= json.model.availDayList;
				if(dayList != "fail" || dayList != null ) {
					for(var i = 0 ; i < dayList.length ; i ++){
						var dayArray = dayList[i].split("|");
						//if(today != dayArray[0]) {
							if(dayArray[1] == 'Y') {
								$(".calendarRsvBox #"+dayArray[0]).attr("class" , dayArray[1] == 'Y'? "rDate" : "rNoDate");
								$(".calendarRsvBox #"+dayArray[0]).attr("title" , messages["javascript.calendar.resv.posb.date"]);
								$(".calendarRsvBox #"+dayArray[0] + " a").attr("href" ,"javascript:;");
							} else {
								$(".calendarRsvBox #"+dayArray[0]).attr("class" , "rNoDate");
								$(".calendarRsvBox #"+dayArray[0]).attr("title" , messages["javascript.calendar.resv.non.posb.date"]);
							}
						//}
					}// end of for
				}
				//ajax 로딩 이미지 회수
				$('.opacity').hide();
				$('.re-loader').hide();
				
				//console.log("loader close");
				// 예약가능일자 click event
				$(".calendarRsvBox").find(".rDate").bind('click', function() {
					window["DP_jQuery_" + dpuuid].resvCalendar._selResvDate($(this).attr("id"));
				});
				
				// 예약불가능일자 click event
				$(".calendarRsvBox").find(".rNoDate").bind('click', function() {
					window["DP_jQuery_" + dpuuid].resvCalendar._selResvDate($(this).attr("id"));
				});
				
				//이전 월 다시 셋팅
				var daySpan = $("span#"+g_selCkInDate);
				$(daySpan).addClass("selDate");
				
				
				if($('#resvChkOutDate').val() != '' && $('#resvChkOutDate').val() == $('#ckoutYmd').val() && $('#resvChkGbn').val() == 'Y'){
					$('#' + $('#resvChkOutDate').val()).click();
				}
				
				$('#resvChkGbn').val('Y');
				
			}).fail(function( jqxhr, textStatus, error ) {
				
				
				if(textStatus == "timeout") {

					//ajax 로딩 이미지 회수
					//$('.opacity').hide();
					//$('.re-loader').hide();
					
					alert(messages["javascript.fetchcalendar.timeout"]);
					
					location.href = location.pathname;

				} else {

					var err = textStatus + ', ' + error;
					  alert( "_setAvailDay Request Failed: " + err);
				}
			  
			});
			
		},
		
		_selResvDate: function(id) {
			this._clickCnt++;
			var aDate = null,  sId = ""; 
			var daySpan = $("span#"+id);
			
			if(this._clickCnt == 1) { // 첫번째 클릭이면
				
				if(daySpan.hasClass("rDate")) { //예약가능일자면
					// 선택일자 class 적용
					this._selCkInDate = id;
					this._tmpCkIndate = id;
					$(daySpan).addClass("selDate");
					
					// input box 셋팅
					$("#"+this._defaults.ckinYmdId).val(this._selCkInDate); // 체크인날짜
					
				} else {
					alert(messages["javascript.calendar.resv.msg.not.ckin"]);
					this._clickCnt--;
				}
				
			} else if(this._clickCnt == 2 && this._selCkInDate != null) {
				
				if(daySpan.hasClass("rDate")) { //예약가능일자면
				
					this._selCkOutDate = id;
	
					// 체크인,아웃기간 class 적용
					var cnt = this._getDiffOfDate(this._selCkInDate, this._selCkOutDate);
					
					if(cnt > 30) {
						
						this._clickCnt--;
						
						// 선택한 날짜 리셋
						this._resetSelDate();
						
						alert(messages["javascript.calendar.day.over"].replace("{0}", "30"));
						
						return;
						
						
					}
					
					if(cnt > 0) {
						
						for(var i=0; i <= cnt ; i++ ){
							aDate = this.addDates(this._selCkInDate, i);
							sId = this.formatDate('yy-mm-dd', aDate); 
							$("span#"+sId).addClass("selDate");
						} // end of for
							
						var packItNightCnt = $("#packItNightCnt") ? $("#packItNightCnt").val() : null;
						
						if(packItNightCnt != null && packItNightCnt > 0 && packItNightCnt != cnt) {
							alert(messages["javascript.calendar.resv.msg.pack.night.cnt"].replaceMsg([packItNightCnt]));
						} else {
						
							// input box 셋팅
							//$("#"+this._defaults.ckinYmdId).val(this._selCkInDate); // 체크인날짜
							$("#"+this._defaults.ckoutYmdId).val(this._selCkOutDate);// 체크아웃 날짜
							$("#"+this._defaults.nightCntId).val(cnt); // 숙박일수

							var chkcnt = 0;
							for(var j=0; j <= cnt ; j++ ){
								aDate = this.addDates(this._selCkInDate, j);
								sId = this.formatDate('yy-mm-dd', aDate);
								var daySpan = $("span#"+sId).hasClass("rNoDate");
								if(daySpan){
									chkcnt++;
								}
							} // end of for

							// 선택한 예약일자 중에 예약이 불가능한 날짜가 포함되어 있습니다.
							if(chkcnt > 0) {
								alert(messages["javascript.calendar.resv.msg.not.ckout.end"]);
								this._clickCnt--;
								
								//선택 부분 삭제 begin
								for(var i=1; i <= cnt ; i++ ){
									aDate = this.addDates(this._selCkInDate, i);
									sId = this.formatDate('yy-mm-dd', aDate); 
									$("span#"+sId).removeClass("selDate");
								} // end of for
								
								$("#"+this._defaults.ckoutYmdId).val("");// 체크아웃 날짜
								$("#"+this._defaults.nightCntId).val(""); // 숙박일수
								//선택 부분 삭제 end
								
								return;
							}
							
							// 예약화면에서 예약날짜 정보 셋팅
							if($("#"+this._defaults.resvDateInfoId)) {
								$("#"+this._defaults.ckinYmdInfoId).text(this._selCkInDate);
								$("#"+this._defaults.ckoutYmInfodId).text(this._selCkOutDate);
								$("#"+this._defaults.nightCntInfoId).text(cnt + ' ' + messages["javascript.calendar.night"]);
								$("#"+this._defaults.resvDateInfoId).show();
							}
							
							if($("#calendarReserveBox").is(":visible")){
								$("#calenderDiv").empty(); 
								$("#calendarReserveBox").hide();
								
								if($(".btnCalendar").size() > 0) {
									$(".btnCalendar").focus();
								} else if($("#ckoutYmd").size() > 0) {
									$("#ckoutYmd").focus();
								}
					 		}
							
							this._selCkInDate = null; //시작일 초기화
							
						}
					} else if(cnt == 0) {
						//같은 날짜 선택시
						
						// 선택한 날짜 리셋
						this._resetSelDate();
						
					} else {
						// 체크인날짜보다 같거나 적은 날짜 선택시 
						alert(messages["javascript.calendar.resv.msg.not.ckout.prev"]);
						this._clickCnt--;
					}
					
				} else {
					//alert(messages["javascript.calendar.resv.msg.not.ckout"]);
					//this._clickCnt--;
					this._selCkOutDate = id;
					
					// 체크인,아웃기간 class 적용
					var cnt = this._getDiffOfDate(this._selCkInDate, this._selCkOutDate);
					
					if(cnt > 30) {
						
						this._clickCnt--;
						
						// 선택한 날짜 리셋
						this._resetSelDate();
						
						alert(messages["javascript.calendar.day.over"].replace("{0}", "30"));
						
						return;
						
						
					}
					
					if(cnt > 0) {
						
						for(var i=0; i <= cnt ; i++ ){
							aDate = this.addDates(this._selCkInDate, i);
							sId = this.formatDate('yy-mm-dd', aDate); 
							$("span#"+sId).addClass("selDate");
						} // end of for
							
						var packItNightCnt = $("#packItNightCnt") ? $("#packItNightCnt").val() : null;
						
						if(packItNightCnt != null && packItNightCnt > 0 && packItNightCnt != cnt) {
							alert(messages["javascript.calendar.resv.msg.pack.night.cnt"].replaceMsg([packItNightCnt]));
						} else {
						
							// input box 셋팅
							//$("#"+this._defaults.ckinYmdId).val(this._selCkInDate); // 체크인날짜
							$("#"+this._defaults.ckoutYmdId).val(this._selCkOutDate);// 체크아웃 날짜
							$("#"+this._defaults.nightCntId).val(cnt); // 숙박일수

							var chkcnt = 0;
							for(var j=0; j <= cnt ; j++ ){
								aDate = this.addDates(this._selCkInDate, j);
								sId = this.formatDate('yy-mm-dd', aDate);
								var daySpan = $("span#"+sId).hasClass("rNoDate");
								if(daySpan){
									chkcnt++;
								}
							} // end of for

							// 선택한 예약일자 중에 예약이 불가능한 날짜가 포함되어 있습니다.
							if(chkcnt > 1) {
								alert(messages["javascript.calendar.resv.msg.not.ckout.end"]);
								this._clickCnt--;
								
								//선택 부분 삭제 begin
								for(var i=1; i <= cnt ; i++ ){
									aDate = this.addDates(this._selCkInDate, i);
									sId = this.formatDate('yy-mm-dd', aDate); 
									$("span#"+sId).removeClass("selDate");
								} // end of for
								
								$("#"+this._defaults.ckoutYmdId).val("");// 체크아웃 날짜
								$("#"+this._defaults.nightCntId).val(""); // 숙박일수
								//선택 부분 삭제 end
								
								return;
							}
							
							// 예약화면에서 예약날짜 정보 셋팅
							if($("#"+this._defaults.resvDateInfoId)) {
								$("#"+this._defaults.ckinYmdInfoId).text(this._selCkInDate);
								$("#"+this._defaults.ckoutYmInfodId).text(this._selCkOutDate);
								$("#"+this._defaults.nightCntInfoId).text(cnt + ' ' + messages["javascript.calendar.night"]);
								$("#"+this._defaults.resvDateInfoId).show();
							}
							
							if($("#calendarReserveBox").is(":visible")){
								$("#calenderDiv").empty(); 
								$("#calendarReserveBox").hide();
								
								if($(".btnCalendar").size() > 0) {
									$(".btnCalendar").focus();
								} else if($("#ckoutYmd").size() > 0) {
									$("#ckoutYmd").focus();
								}
					 		}
							
							this._selCkInDate = null; //시작일 초기화
							
						}
					} else if(cnt == 0) {
						//같은 날짜 선택시
						
						// 선택한 날짜 리셋
						this._resetSelDate();
						
					} else {
						// 체크인날짜보다 같거나 적은 날짜 선택시 
						alert(messages["javascript.calendar.resv.msg.not.ckout.prev"]);
						this._clickCnt--;
					}
				}
				
				
			} else { // 두번클릭이상이면
				
				// 선택한 날짜 리셋
				this._resetSelDate();
				
			}
		},
		
		//첫번째 날짜 값 검증(memIndex)
		_selResvDate3_1: function(id) {
			this._selCkInDate = id;
				
			return true;
				
		},
		
		//두번째 날짜 값 검증(memIndex)
		_selResvDate3_2: function(id) {
			this._selCkOutDate = id;
			
			// 체크인,아웃기간 class 적용
			var cnt = this._getDiffOfDate(this._selCkInDate, this._selCkOutDate);
			
			if(cnt > 30) {
				
				alert(messages["javascript.calendar.day.over"].replace("{0}", "30"));
				
				return false;
				
				
			}
			
			if(cnt > 0) {
					
				var packItNightCnt = $("#packItNightCnt") ? $("#packItNightCnt").val() : null;
				
				if(packItNightCnt != null && packItNightCnt > 0 && packItNightCnt != cnt) {
					alert(messages["javascript.calendar.resv.msg.pack.night.cnt"].replaceMsg([packItNightCnt]));
					return false;
				} else {

					var chkcnt = 0;
					for(var j=0; j <= cnt ; j++ ){
						aDate = this.addDates(this._selCkInDate, j);
						sId = this.formatDate('yy-mm-dd', aDate);
						var daySpan = $("span#"+sId).hasClass("rNoDate");
						if(daySpan){
							chkcnt++;
						}
					} // end of for

					// 선택한 예약일자 중에 예약이 불가능한 날짜가 포함되어 있습니다.
					if(chkcnt > 1) {
						alert(messages["javascript.calendar.resv.msg.not.ckout.end"]);
						return false;
					}
					
					
					return true;
				}

			} else {
				// 체크인날짜보다 같거나 적은 날짜 선택시 
				alert(messages["javascript.calendar.resv.msg.not.ckout.prev"]);
				return false;
			}
		},
		
		//첫번째 날짜 값 검증
		_selResvDate2_1: function(id) {
			var daySpan = $("span#"+id);
			
			if(daySpan.hasClass("rDate")) { //예약가능일자면
				this._selCkInDate = id;
				
				return true;
				
			} else {
				alert(messages["javascript.calendar.resv.msg.not.ckin"]);
				
				return false;
				
			}
				
		},
		
		//두번째 날짜 값 검증
		_selResvDate2_2: function(id) {
			var aDate = null,  sId = ""; 
			var daySpan = $("span#"+id);
				
			if(daySpan.hasClass("rDate")) { //예약가능일자면
			
				this._selCkOutDate = id;
				
				// 체크인,아웃기간 class 적용
				var cnt = this._getDiffOfDate(this._selCkInDate, this._selCkOutDate);
				
				if(cnt > 30) {
					
					alert(messages["javascript.calendar.day.over"].replace("{0}", "30"));
					
					return false;
					
					
				}
				
				if(cnt > 0) {
						
					var packItNightCnt = $("#packItNightCnt") ? $("#packItNightCnt").val() : null;
					
					if(packItNightCnt != null && packItNightCnt > 0 && packItNightCnt != cnt) {
						alert(messages["javascript.calendar.resv.msg.pack.night.cnt"].replaceMsg([packItNightCnt]));
						return false;
					} else {

						var chkcnt = 0;
						for(var j=0; j <= cnt ; j++ ){
							aDate = this.addDates(this._selCkInDate, j);
							sId = this.formatDate('yy-mm-dd', aDate);
							var daySpan = $("span#"+sId).hasClass("rNoDate");
							if(daySpan){
								chkcnt++;
							}
						} // end of for

						// 선택한 예약일자 중에 예약이 불가능한 날짜가 포함되어 있습니다.
						if(chkcnt > 1) {
							alert(messages["javascript.calendar.resv.msg.not.ckout.end"]);
							return false;
						}
						
						// 예약화면에서 예약날짜 정보 셋팅
						/*
						if($("#"+this._defaults.resvDateInfoId)) {
							$("#"+this._defaults.ckinYmdInfoId).text(this._selCkInDate);
							$("#"+this._defaults.ckoutYmInfodId).text(this._selCkOutDate);
							$("#"+this._defaults.nightCntInfoId).text(cnt + ' ' + messages["javascript.calendar.night"]);
							$("#"+this._defaults.resvDateInfoId).show();
						}
						
						if($("#calendarReserveBox").is(":visible")){
							$("#calenderDiv").empty(); 
							$("#calendarReserveBox").hide();
							
							if($(".btnCalendar").size() > 0) {
								$(".btnCalendar").focus();
							} else if($("#ckoutYmd").size() > 0) {
								$("#ckoutYmd").focus();
							}
				 		}
						
						this._selCkInDate = null; //시작일 초기화
						*/
						
						return true;
					}

				} else {
					// 체크인날짜보다 같거나 적은 날짜 선택시 
					alert(messages["javascript.calendar.resv.msg.not.ckout.prev"]);
					return false;
				}
				
			} else {
				//alert(messages["javascript.calendar.resv.msg.not.ckout"]);
				//return false;
				this._selCkOutDate = id;
				
				// 체크인,아웃기간 class 적용
				var cnt = this._getDiffOfDate(this._selCkInDate, this._selCkOutDate);
				
				if(cnt > 30) {
					
					alert(messages["javascript.calendar.day.over"].replace("{0}", "30"));
					
					return false;
					
					
				}
				
				if(cnt > 0) {
						
					var packItNightCnt = $("#packItNightCnt") ? $("#packItNightCnt").val() : null;
					
					if(packItNightCnt != null && packItNightCnt > 0 && packItNightCnt != cnt) {
						alert(messages["javascript.calendar.resv.msg.pack.night.cnt"].replaceMsg([packItNightCnt]));
						return false;
					} else {

						var chkcnt = 0;
						for(var j=0; j <= cnt ; j++ ){
							aDate = this.addDates(this._selCkInDate, j);
							sId = this.formatDate('yy-mm-dd', aDate);
							var daySpan = $("span#"+sId).hasClass("rNoDate");
							if(daySpan){
								chkcnt++;
							}
						} // end of for

						// 선택한 예약일자 중에 예약이 불가능한 날짜가 포함되어 있습니다.
						/*if(chkcnt > 0) {
							alert(messages["javascript.calendar.resv.msg.not.ckout.end"]);
							return false;
						}*/
						
						// 예약화면에서 예약날짜 정보 셋팅
						/*
						if($("#"+this._defaults.resvDateInfoId)) {
							$("#"+this._defaults.ckinYmdInfoId).text(this._selCkInDate);
							$("#"+this._defaults.ckoutYmInfodId).text(this._selCkOutDate);
							$("#"+this._defaults.nightCntInfoId).text(cnt + ' ' + messages["javascript.calendar.night"]);
							$("#"+this._defaults.resvDateInfoId).show();
						}
						
						if($("#calendarReserveBox").is(":visible")){
							$("#calenderDiv").empty(); 
							$("#calendarReserveBox").hide();
							
							if($(".btnCalendar").size() > 0) {
								$(".btnCalendar").focus();
							} else if($("#ckoutYmd").size() > 0) {
								$("#ckoutYmd").focus();
							}
				 		}
						
						this._selCkInDate = null; //시작일 초기화
						*/
						
						return true;
					}

				} else {
					// 체크인날짜보다 같거나 적은 날짜 선택시 
					alert(messages["javascript.calendar.resv.msg.not.ckout.prev"]);
					return false;
				}
			}
				
		},
		
		/* 선택한 날짜 초기화. */
		_resetSelDate:function() {
			if(this._selCkOutDate != null) {
				var cnt = this._getDiffOfDate(this._tmpCkIndate, this._selCkOutDate);
				
				for(var i=0; i <= cnt ; i++ ){
					var aDate = this.addDates(this._tmpCkIndate, i);
					var sId = this.formatDate('yy-mm-dd', aDate); 
					$("span#"+sId).removeClass("selDate");
				} // end of for
			}else{
				$("span#"+this._tmpCkIndate).removeClass("selDate");
			}	
			
			this._selCkInDate = null;	
			this._tmpCkIndate = null;
			this._selCkOutDate = null;
			this._clickCnt = 0;
			$("#"+this._defaults.ckinYmdId).val(""); // 체크인날짜
			$("#"+this._defaults.ckoutYmdId).val("");// 체크아웃 날짜
			$("#"+this._defaults.nightCntId).val(""); // 숙박일수
			
			// 예약화면에서 예약날짜 정보 셋팅
			if($("#"+this._defaults.resvDateInfoId)) {
				$("#"+this._defaults.ckinYmdInfoId).text("");
				$("#"+this._defaults.ckoutYmInfodId).text("");
				$("#"+this._defaults.nightCntInfoId).text(0);
				$("#"+this._defaults.resvDateInfoId).hide();
			}
			
			
		},
		
		/* 날짜일수 조회. */
		_getDiffOfDate:function (startDate, endDate) {
			
			var d1 = this.parseDate('yy-mm-dd', startDate);
			var d2 = this.parseDate('yy-mm-dd', endDate);
			var count = d2 - d1;
			return Math.floor(count/(24*3600*1000));
			
		},
		
		_isLeapYear: function (year) { 
		    return (((year % 4 === 0) && (year % 100 !== 0)) || (year % 400 === 0)); 
		},

		_getDaysInMonth: function (year, month) {
		    return [31, (this._isLeapYear(year) ? 29 : 28), 31, 30, 31, 30, 31, 31, 30, 31, 30, 31][month];
		},

		/* 해당월의 마지막 일자 조회. */
		getDaysInMonth: function (date) { 
		    return this._getDaysInMonth(date.getFullYear(), date.getMonth());
		},
		
		/* 요일 조회. */
		getDayOfWeek: function (year, month, day) {
			return new Date(year, month, day).getDay();
		},
		
		getLastDateOfMonth: function(date) {
			var newDate = new Date(date.getFullYear(), date.getMonth(), this.getDaysInMonth(date));
			/*newDate.setFullYear(date.getFullYear());
			newDate.setMonth(date.getMonth());
			newDate.setDate(this.getDaysInMonth(date));*/
			return newDate;
		},
		
		/* date에 month 추가. */
		addMonths: function (date, value) {
			var newDate = new Date(date.getFullYear(), date.getMonth() + value, 1);
			/*newDate.setFullYear(date.getFullYear());
			newDate.setDate(1);
			newDate.setMonth(date.getMonth() + value);*/
		    return newDate;
		},
		
		addDates: function (strDate, value) {
			var parts = strDate.split('-');
			var d = new Date(parts[0], parts[1]-1, parts[2]); 
			  
			var newDate = new Date(d.getFullYear(), d.getMonth(), d.getDate()+value);
			/*newDate.setFullYear(d.getFullYear());
			newDate.setDate(d.getDate()+value);
			newDate.setMonth(d.getMonth());*/
			return newDate;
		},
		
		parseDate: function(format, date) {
			
			var newDate = new Date();

			if('yy-mm-dd' == format && date != '') {
				var parts = date.split('-');
				newDate = new Date(parts[0], parts[1]-1, parts[2]); 
			}
			
			return newDate;
		},
		
		/* date를 string date로 변환. */
		formatDate: function(format, date) {
			var strDate = "";
			if('yy' == format) {
				strDate = date.getFullYear();
			} else if('mm' == format) {
				strDate = (date.getMonth()+1);
			} else if('dd' == format) {
				date.getDate();
			} else if('yy-mm-dd' == format) {
				strDate = date.getFullYear() + "-" + LPad((date.getMonth()+1), 2, '0') + "-" + LPad(date.getDate(), 2, '0');
			}
			return strDate;
		}
		
	});
	
	$.resvCalendar = new ResvCalendar(); // singleton instance
	$.resvCalendar.uuid = new Date().getTime();
	$.resvCalendar.version = "1.0.0";

	window["DP_jQuery_" + dpuuid] = $;
	
})(jQuery);
