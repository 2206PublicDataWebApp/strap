<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="UTF-8">
<title>STRAP MATCH CALENDAR</title>
<!-- CDN -->
<!-- 부트스트랩 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" />
<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- css -->
<link rel="stylesheet" type="text/css" href="/resources/css/common.css">
<link href="/resources/js/main.css" rel="stylesheet" />
<script src="/resources/js/main.js"></script>
<script src="/resources/js/ko.js"></script>

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
			select : function(arg) {
				var title = prompt('Event Title:');
				if (title) {
					calendar.addEvent({
						title : title,
						start : arg.start,
						end : arg.end,
						allDay : arg.allDay
					})
				}
				calendar.unselect()
			},
			eventClick : function(arg) {
				if (confirm('정말 일정을 삭제하시겠습니까?\n(※상대방과 합의되지 않은 결정은 후기에 불이익이 있을 수 있습니다.)')) {
					arg.event.remove()
				}
			},
			editable : true,
			dayMaxEvents : true, // allow "more" link when too many events
			events : [ {
				title : 'All Day Event',
				start : '2022-10-01'
			}, {
				title : 'Long Event',
				start : '2022-10-07',
				end : '2022-10-10'
			}, {
				groupId : 999,
				title : 'Repeating Event',
				start : '2022-10-09T16:00:00'
			}, {
				groupId : 999,
				title : 'Repeating Event',
				start : '2022-10-16T16:00:00'
			}, {
				title : 'Conference',
				start : '2022-10-11',
				end : '2022-10-13'
			}, {
				title : 'Meeting',
				start : '2022-10-12T10:30:00',
				end : '2022-10-12T12:30:00'
			}, {
				title : 'Lunch',
				start : '2022-10-12T12:00:00'
			}, {
				title : 'Meeting',
				start : '2022-10-25 01:43'
			}, {
				title : 'Happy Hour',
				start : '2022-10-12T17:30:00'
			}, {
				title : 'Dinner',
				start : '2022-10-12T20:00:00'
			}, {
				title : 'Birthday Party',
				start : '2022-10-13T07:00:00'
			}, {
				title : 'Click for Google',
				url : 'http://google.com/',
				start : '2022-10-28'
			} ]
		});

		calendar.render();
	});
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
</style>
</head>
<body>
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
					<span> 매칭 캘린더 </span>
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
</body>
</html>