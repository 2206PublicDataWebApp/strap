<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
<meta charset="UTF-8">
<title>STRAP MyPage</title>
<!-- CDN -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"/>
<!-- 부트스트랩 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" />
<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- css -->
<link rel="stylesheet" type="text/css" href="/resources/css/common.css">
<link rel="stylesheet" type="text/css" href="/resources/css/myPageMain.css">
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
		<div class="sidebar col-3" >
			<jsp:include page="/WEB-INF/views/common/sideBarMyPage.jsp"></jsp:include>
		</div>
		<div class="contents-side col">
			<div class="mypageContents">
				<div id="profile">
					<div id="info">
						<div id="info-img">
							<div class="imgDiv">
								<c:if test="${loginUser.mProfileRename eq null }">
									<img id="profileImg" width="100%" height="100%" src="/resources/profileUploadFiles/default.png">
								</c:if>
								<c:if test="${loginUser.mProfileRename ne null }">
									<img id="profileImg" width="100%" height="100%" src="/resources/profileUploadFiles/${loginUser.mProfileRename }">
								</c:if>
							</div>
						</div>
						<div id="info-detail">
							<table id="infoTable" class="table table-borderless">
								<tr>
									<th>닉네임</th>
									<td>
										<input type="text" id="memberNick" value="${loginUser.memberNick }" readonly>
									</td>
								</tr>
								<tr>
									<th>운동경력</th>
									<td>
										<input type="text" id="memberCareer" value="${loginUser.memberCareer }년" readonly>
									</td>
								</tr>
								<tr>
									<th>3대 기록</th>
									<td>
										<input type="text" id="memberSBD" value="${loginUser.memberSBD }" readonly>
									</td>
								</tr>
								<tr>
									<th>마이짐</th>
									<td>
										<input type="text" id="jymAddress" name="jymAddress" value="${jymAddress }" style="width: 250px;border:0;" readonly><br>
										<input type="text" id="jymTitle" name="jymTitle" value="${jymTitle }" style="width: 250px; height:35px; border:0;" readonly>	
									</td>
								</tr>
								<tr>
									<th>자기소개</th>
									<td><textarea id="memberIntroduce" readonly>${loginUser.memberIntroduce }</textarea></td>
								</tr>
							</table>
							<br>
						</div>
					</div>
					<div class="mannerTrend">
						<br>
						<div class="mannerPercent"><img width="30px" src="/resources/image/score.png"> 현재 ${loginUser.memberManner }점, ${loginUser.memberNick } 님은 매너점수는 상위 ${percent }%입니다!</div>
						<br>
						<input min="0" max="500" step="10" value="${loginUser.memberManner }" type="range" class="form-range" id="disabledRange" disabled>
						<img width="30px;" height="30px;" src="/resources/image/up-arrow.png" style="margin-right: 300px;"><br>
						<span style="margin-right: 300px;">시작</span>
					</div>
				</div>
				<div class="simpleQnA">
					<div class="QnAStart">
						<input type="text" class="form-control" value="간단 Q&A, 당신의 취향은" readonly>
						<br>
				    	<img src="/resources/image/matching/problem.png" width="100px;" height="100px;">
						<br>
						<button type="button" class="btn btn-dark" onclick="start();">시작하기</button>
		    		</div>
				</div>
				<div class="matchingHistory">
					<div class="survey">
						<div class="survey-img">
							<img width="100%;" height="100%;" style="padding: 20px;" src="/resources/image/survey.png">
						</div>
						<div class="survey-text">
							십일용자 님과의<br>운동은 어떠셨나요?
						</div>
						<div class="survey-contents">
							<button class="btn btn-light">&nbsp;&nbsp;좋았어요&nbsp;&nbsp;<img src="/resources/image/happy-face.png"></button>
							<br>
							<button class="btn btn-light">별로였어요 <img src="/resources/image/sad-face.png"></button>
							<br>
							<textarea placeholder="이유를 자유롭게 작성해주세요"></textarea>
							<br>
							<button class="btn btn-dark">제출</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<br><br>
<div class="row">
	<div class="col">
		<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	</div>
</div>
<script>
	function start(){
		$.ajax({
			url:"/mypage/qna.strap",
			type:"get",
			success:function(result){
				var html = '';
				if(result !=null){
					html += "<div class='question'>";
					html +=	"<b>Q&A</b>  "+result.qnaTitle+"<br>";
					html +=	"<input type='text' class='form-control Q' value='"+result.ex1+"' onclick='QnA(this,"+result.qnaNo+")' readonly>";
					html +=	"<input type='text' class='form-control Q' value='"+result.ex2+"' onclick='QnA(this,"+result.qnaNo+")' readonly>";
					if(result.ex3 !=null){
						html +=	"<input type='text' class='form-control Q' value='"+result.ex3+"' onclick='QnA(this,"+result.qnaNo+")' readonly>";
					}
					if(result.ex4 !=null){
						html +=	"<input type='text' class='form-control Q' value='"+result.ex4+"' onclick='QnA(this,"+result.qnaNo+")' readonly>";
					}
					if(result.ex5 !=null){
						html +=	"<input type='text' class='form-control Q' value='"+result.ex5+"' onclick='QnA(this,"+result.qnaNo+")' readonly>";
					}
					html +=	"<br><button class='btn btn-dark' onclick='submit();'>제출</button></div>";
					$(".QnAStart").remove();
					$(".simpleQnA").append(html);
				}else{
					html +=	"<div class='question'><input type='text' class='form-control' value='모든 질문에 답하셨군요!' readonly><br>";
					html += "<img src='/resources/image/clapping.png' width='100px;' height='100px;'></div>";
					$(".QnAStart").remove();
					$(".simpleQnA").append(html);
				}
					
			},
			error:function(result){
				console.log("실패:"+result);
			}
		})
	}

	var qnaNo;
	var answer;
	function QnA(obj,no){
		qnaNo = no;
		answer = $(obj).val();
		$(".Q").css("background-color","white");
		$(obj).css("background-color","gold");
	}
	
	function submit(){
		if(answer == null ){
			alert("답변을 선택해주세요!");
		} else {
			if(confirm("답변을 제출하시겠습니까?")){
				$.ajax({
					url:"/mypage/qnaAnswer.strap",
					type:"post",
					data:{"qnaNo":qnaNo,"answer":answer},
					success:function(result){
						//초기화 작업
						qnaNo = null;
						answer = null;
						$(".question").remove();
						start();
					},
					error:function(result){
						console.log(result)
						console.log("실패");
					}
				})
			}
		}
	}
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>
</body>
</html>