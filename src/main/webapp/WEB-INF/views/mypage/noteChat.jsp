<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="row text-center border border-secondary border-opacity-50" id="chat-window" style="display:none;">
		<div class="col">
			**님과 채팅
			<div class="row text-center border border-secondary border-opacity-50" >
				<div class="col">
					내용
				</div>
			</div>
		</div>
	</div>
	<br>
	<div class="row text-center" id="chat-button" style="display:none;">
		<div class="col">
			<button class="btn btn-primary">입력</button>
		</div>
		<div class="col">
			<button class="btn btn-primary">일정잡기</button>
		</div>
	</div>
	
	<script>
		setTimeout("location.href='/mypage/noteDetailView.strap?noteNo=${noteBox.noteNo }'", 3000);
	</script>
</body>
</html>