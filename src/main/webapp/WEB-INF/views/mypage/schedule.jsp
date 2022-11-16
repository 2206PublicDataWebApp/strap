<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" href="/resources/image/s.png">
<title>스트랩 : 캘린더</title>
<!-- CDN -->
<!-- 부트스트랩 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- css -->
<link rel="stylesheet" type="text/css" href="/resources/css/common.css">
<link rel="stylesheet" type="text/css" href="/resources/css/modal.css">
<link href="/resources/js/main.css" rel="stylesheet" />
<script src="/resources/js/main.js"></script>
<script src="/resources/js/ko.js"></script>
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
<style>

#calendar {
	max-width: 1100px;
	margin: 0 auto;
}

.contents-side.col {
	padding-left: 15px;
}

.contents-side.col th, .contents-side.col td {
	height: 50px;
}


select.select {
	width: 185px;
}


td button {
	width: 200px;
}


span.id, span.pwd, span.pwdCheck, span.nick {
	display: none;
	font-size: 12px;
	top: 12px;
	right: 10px;
}

.ui-timepicker-container{
	z-index: 10000!important
}
/* 일요일 날짜 빨간색 */
.fc-day-sun a {
  color: red;
  text-decoration: none;
}

/* 토요일 날짜 파란색 */
.fc-day-sat a {
  color: blue;
  text-decoration: none;
}
</style>
<script>
	document.addEventListener('DOMContentLoaded', function() {
		var calendarEl = document.getElementById('calendar');

        var calendar = new FullCalendar.Calendar(calendarEl, {
			headerToolbar : {
				left : 'prev,next today',
				center : 'title',
				right : 'dayGridMonth,listWeek'				
			},
			locale : 'ko',
			navLinks : true, // can click day/week names to navigate views
			selectable : true,
			selectMirror : true,
// 			select: function(info) {
// 					alert('clicked ' + info.dateStr);
// 					calendar.unselect()
// 				},			
			dateClick : function(info) {
				$('#addSchedule').modal('show');
				$("#date").val(info.dateStr);
			},
			eventClick : function(info) {
				console.log(info.event);
				var matchNo = info.event.id;
				var title = info.event.title;
				var date = info.event.start;
				var contents = info.event.textColor;
				function convert(str) {
					var date = new Date(str);
				  	mnth = ("0" + (date.getMonth() + 1)).slice(-2);
				  	day = ("0" + date.getDate()).slice(-2);
				  	hours  = ("0" + date.getHours()).slice(-2);
				  	minutes = ("0" + date.getMinutes()).slice(-2);
				  	return [date.getFullYear(), mnth, day].join("-") + " " + [hours, minutes].join(":");
				}
				var meetDate = convert(date);
				$('#detailSchedule').modal('show');
				$("#calendar-title").val(title);
				var dateTime = meetDate.split(" ");
				$("#calendar-date").val(dateTime[0]);
				$("#calendar-time").val(dateTime[1]);
				if(contents == 'undefined'){
					$("#calendar-contents").val("");
				}else{
					$("#calendar-contents").val(contents);
				}
				$("#calendar-matchNo").val(matchNo);
			},
			eventDrop: function (info){
				var date = info.event.start;
				function convert(str) {
					var date = new Date(str);
				  	mnth = ("0" + (date.getMonth() + 1)).slice(-2);
				  	day = ("0" + date.getDate()).slice(-2);
				  	hours  = ("0" + date.getHours()).slice(-2);
				  	minutes = ("0" + date.getMinutes()).slice(-2);
				  	return [date.getFullYear(), mnth, day].join("-") + " " + [hours, minutes].join(":");
				}
				var meetDate = convert(date);
				$.ajax({
					type : "post",
					data : {
						matchNo : info.event.id,
						meetDate : meetDate
					},
					url : "/schedule/modifySchedule.strap",
					success : function(response){
						alert("일정이 수정되었습니다.");
					}
				})
			},
			editable : true,
			dayMaxEvents : true, // allow "more" link when too many events
			events : [
				$.ajax({
					type : "get",
					url : "/mypage/scheduleList.strap",
					success : function(response){ // response json 데이터
						for(i = 0;i < response.length; i++) {
							calendar.addEvent({
								id: response[i]['matchNo'],
								title: response[i]['title'],
								start: response[i]['start'],
								color: response[i]['color'],
								textColor: response[i]['contents']
							})
						}
					}
				})
			]
        })
		calendar.render();
	})
</script>
</head>
<body>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>
	<script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
	<div class="wrap container">
		<!-- 헤더&메뉴바 -->
		<div class="row">
			<div class="col">
				<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
			</div>
		</div>
		
		<div class="contents row">
			<div class="sidebar col-3">
				<jsp:include page="/WEB-INF/views/common/sideBarMyPage.jsp"></jsp:include>
			</div>
			<div class="contents-side col">
				<div id="essential info">
					<span> 캘린더 </span>
					<hr>
					<div class="row">
						<div class="col-8" align="right">
						</div>
						<div class="col" with align="right">
							<div style="background-color:rgb(55,136,216); width:8px; height:8px; border-radius:15px;position:relative;top:6px;left:18px;"></div>
							<div style="background-color:rgb(251,188,4); width:8px; height:8px; border-radius:15px;position:relative;top:24px;left:18px;"></div>
						</div>
						<div class="col" style="width:70px;">
							<div>매칭 일정</div>
							<div>개인 일정</div>
						</div>
					</div>
					<div id='calendar'></div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col">
				<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
			</div>
		</div>
	</div>
	
	<!--Add Schedule Modal -->
	<div class="modal fade" id="addSchedule" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content" style="width:400px">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">개인 일정 추가</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="modal-body p-5 pt-0">
						<form id="addSchedule-form" action="/schedule/registerDaySchedule.strap" method="post">
							<input type="hidden" value="#FBBC04" name="color">
							<input type="hidden" id="date" name="matchDate">
							<div class="mb-3">
								시간 : <input class="timepicker form-control" name="addTime" required/>
							</div>
							<div class="mb-3">
								메모 : <input type="text" class="form-control" name="matchDetail" required/>
							</div>
							<button class="w-100 mb-2 btn btn-lg btn-dark" type="submit">일정추가</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!--Detail Schedule Modal -->
	<div class="modal fade" id="detailSchedule" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content" style="width:400px">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">일정 상세</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="modal-body p-5 pt-0">
<!-- 						<form id="addSchedule-form" action="/schedule/removeSchedule.strap" method="post"> -->
<!-- 							<input type="hidden" value="#FBBC04" name="color">  -->
							<input type="hidden" value="#FBBC04" name="color"> 
							<input type="hidden" id="calendar-matchNo" name="matchNo">
							<div class="mb-3">
								매칭 : <input type="text" class="form-control" id="calendar-title" name="matchMemberNick" disabled/>
							</div>
							<div class="mb-3">
								날짜 : <input type="text" class="form-control" id="calendar-date" name="addDate" disabled/>
							</div>
							<div class="mb-3">
								시간 : <input class="timepicker form-control" id="calendar-time" name="addTime"/>
							</div>
							<div class="mb-3">
								메모 : <input type="text" class="form-control" id="calendar-contents" name="matchDetail" />
							</div>
							<div class="row">
								<div class="col">
									<button class="w-100 mb-2 btn btn-lg btn-dark" id="modify-schedule">수정</button>
								</div>
								<div class="col">
									<button class="w-100 mb-2 btn btn-lg btn-dark" id="remove-schedule">삭제</button>
								</div>
							</div>
<!-- 						</form> -->
					</div>
				</div>
			</div>
		</div>
	</div>

<script>
	$(document).ready(function(){
		$('.timepicker').timepicker({
		    timeFormat: 'HH:mm',
		    interval: 30,
		    minTime: '8',
		    maxTime: '9:00pm',
		    defaultTime: '8',
		    startTime: '8:00',
		    dynamic: false,
		    dropdown: true,
		    scrollbar: true
		});
	});
	
	
	$("#remove-schedule").on("click", function(){
		if (confirm('운동일정을 삭제하시겠습니까?')) {
			$.ajax({
				type : "post",
				data : {
					matchNo : $("#calendar-matchNo").val()
				},
				url : "/schedule/removeSchedule.strap",
				success : function(response){
					if(response == "success"){
						alert("일정이 삭제되었습니다.");
						window.location.reload();
					}
				}
			});
		}
	});
	
	$("#modify-schedule").on("click", function(){
		$.ajax({
			type : "post",
			data : {
				matchNo : $("#calendar-matchNo").val(),
				matchDetail : $("#calendar-contents").val(),
				meetDate : $("#calendar-date").val() + " " + $("#calendar-time").val()
			},
			url : "/schedule/modifyTimeMemo.strap",
			success : function(response){
				if(response == "success"){
					alert("일정이 수정되었습니다.");
					window.location.reload();
				}
			}
		});
	});
</script>
</body>
</html>