<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="UTF-8">
<title>STRAP MATCH CALENDAR</title>
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
				console.log(info);
				var title = info.event.title;
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
				if (confirm('< 운동일정 >' + '\n' + meetDate + '\n' + title + '\n' + '\n정말 일정을 삭제하시겠습니까?\n(※상대방과 합의되지 않은 결정은 후기에 불이익이 있을 수 있습니다.)')) {
					$.ajax({
						type : "post",
						data : {
							matchNo : info.event.id
						},
						url : "/schedule/removeSchedule.strap",
						success : function(response){
							if(response == "success"){
								alert("일정이 삭제되었습니다.");
								window.location.reload();
							}
						}
					})
				}
			},
			eventDrop: function (info){
// 				if(confirm("'"+ info.event.start +"'//// 운동 일정을 수정하시겠습니까 ?")){
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
// 						window.location.reload();
					}
				})
// 				}else{
//                     location.reload();
// 				}
			},
			editable : true,
			dayMaxEvents : true, // allow "more" link when too many events
			events : [
				$.ajax({
					type : "get",
					url : "/mypage/scheduleList.strap",
					success : function(response){
						console.log(response)
						for(i = 0;i < response.length; i++) {
							calendar.addEvent({
								id: response[i]['matchNo'],
								title: response[i]['title'],
								start: response[i]['start'],
								color: response[i]['color']
							})
						}
					}
				})
			]
        })
		calendar.render();
	})
</script>
<style>
/* body { */
/* 	margin: 40px 10px; */
/* 	padding: 0; */
/* 	font-family: Arial, Helvetica Neue, Helvetica, sans-serif; */
/* 	font-size: 14px; */
/* } */

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

</style>
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
</script>
</body>
</html>