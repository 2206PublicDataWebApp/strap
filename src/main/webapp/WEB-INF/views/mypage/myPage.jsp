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
					<div class="myQnA">
						<img width="50px" height="50px" src="/resources/image/question.png"> <b>Q&A</b>
						<br>
						<c:if test="${empty qList }">
							<div>
							<br>
							<input class='form-control no' type='text' value='아직 답변한 Q&A가 없습니다!' style='width:250px; margin-left:50px;' readonly><br>
							</div>
						</c:if>
						<c:if test="${!empty qList }">
							<div id="carouselExampleControlsNoTouching" class="carousel carousel-dark slide" data-bs-touch="false">
							  <div class="carousel-inner">
							    <c:forEach items="${qList }" var="QnA" varStatus="i">
								    <c:if test="${i.index eq 0}">
									    <div class="carousel-item active">
									    	${QnA.qnaTitle }
									    	<input type="text" class="form-control" value="${QnA.qnaAnswer }" readonly>
									    </div>
								    </c:if>
								    <c:if test="${i.index ne 0}">
									    <div class="carousel-item">
									    	${QnA.qnaTitle }
									    	<input type="text" class="form-control" value="${QnA.qnaAnswer }" readonly>
									    </div>
								    </c:if>
							    </c:forEach>
								  </div>
							  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControlsNoTouching" data-bs-slide="prev">
							    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
							    <span class="visually-hidden">Previous</span>
							  </button>
							  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControlsNoTouching" data-bs-slide="next">
							    <span class="carousel-control-next-icon" aria-hidden="true"></span>
							    <span class="visually-hidden">Next</span>
							  </button>
							</div>
						</c:if>
					</div>
					<div class="mannerTrend">
						<br>
						<div class="mannerPercent"><img width="30px" src="/resources/image/score.png"> 현재 ${loginUser.memberManner }점, ${loginUser.memberNick } 님은 매너점수는 상위 ${percent }%입니다!</div>
						<br>
						<input min="0" max="500" step="10" value="${loginUser.memberManner }" type="range" class="form-range" id="disabledRange" disabled>
						<img width="30px;" height="30px;" src="/resources/image/up-arrow.png" style="margin-right: 292px;"><br>
						<span style="margin-right: 292px;">시작</span>
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
						<c:if test="${empty caseMe and empty caseOpponent }">
							<div class="noSurvey">
								<br>
								<img width="150px;" height="150px;" src="/resources/image/no-results.png">
								<br><br>최근 일주일 내 진행된<br>매칭이 없습니다.
								<br><br>
								<button class="btn btn-dark" onclick="location.href='/match/matchingView.strap'">매칭하러 가기</button>
							</div>
						</c:if>
						<c:if test="${!empty caseMe or !empty caseOpponent }">
							<div class="survey-img">
								<img width="100%;" height="100%;" style="padding: 20px;" src="/resources/image/survey.png">
							</div>
							<div class="survey-text">
								<c:if test="${!empty caseMe }">
									${caseMe.matchMemberNick } 님과의<br>운동은 어떠셨나요?
								</c:if>
								<c:if test="${!empty caseOpponent }">
									${caseOpponent.memberNick } 님과의<br>운동은 어떠셨나요?
								</c:if>
							</div>
							<div class="survey-contents">
								<button class="btn btn-light S" onclick="survey(this);">좋았어요<img style="margin-left: 25px;" src="/resources/image/happy-face.png"></button>
								<br>
								<button class="btn btn-light S" onclick="survey(this);">별로였어요<img src="/resources/image/sad-face.png"></button>
								<br>
								<textarea class="survey-opinion" placeholder="  이유를 자유롭게 작성해주세요"></textarea>
								<br>
								<button class="btn btn-dark" onclick="surveySubmit();">제출</button>
							</div>
						</c:if>
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
	var surveyAnswer;
	function survey(obj){
		surveyAnswer = $(obj).text();
		$(".S").css("background-color","lightgray");
		$(obj).css("background-color","gold");
	}
	
	
	function surveySubmit(){
		var matchMemberNick = '${caseMe.matchMemberNick}' 
		if(matchMemberNick != ''){
			var mathMemberId = '${caseMe.matchMemberId}';
			var matchNo = '${caseMe.matchNo}';
			var matchCase = "me";
		} else {
			var matchMemberNick = '${caseOpponent.memberNick}' 
			var mathMemberId = '${caseOpponent.memberId}';
			var matchNo = '${caseOpponent.matchNo}';
			var matchCase = "opponent";
		}
		var surveyOpinion = $(".survey-opinion").val();
		if(surveyAnswer == null){
			alert("답변을 선택해주세요");
		}else if(surveyOpinion == ''){
			alert("내용을 작성해주세요");
		}else {
			$.ajax({
				url:"/mypage/surveyAnswer.strap",
				type:"post",
				data:{"matchNo":matchNo,"surveyAnswer":surveyAnswer, "surveyOpinion":surveyOpinion, "mathMemberId":mathMemberId, "matchCase":matchCase},
				success:function(result){
					console.log(result);
					if(result == "ok"){
						alert("소중한 의견 감사합니다");
						location.reload();
					}
				},
				error:function(result){
					alert("제출 실패, 관리자에게 문의바랍니다.");
				}
			})
		}
		
	}

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
					html +=	"<div class='question'><input style='margin-top:30px;' type='text' class='form-control' value='모든 질문에 답하셨군요!' readonly><br>";
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