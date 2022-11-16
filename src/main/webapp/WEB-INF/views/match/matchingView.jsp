<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" href="/resources/image/s.png">
<title>스트랩 : 매칭 방법</title>
<!-- CDN -->
<!-- 부트스트랩 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" />
<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- css -->
<link rel="stylesheet" type="text/css" href="/resources/css/common.css">

	<style>
		.contents-side{text-align: center;}
		#myInfo{table-layout: fixed; width: 400px; margin: 0 auto; border-collapse:separate; border-radius: 10px;}
		#myInfo th{width: 120px; margin-left: 15px;}
		#myInfo td{width: 300px; }
		#myInfo input{width: 280px; border: 0px}
		#myInfo select{border: 0px}
		#myInfo textarea{width: 280px; height: 50px; resize: none; border:0}
		#memberList{table-layout: fixed; width: 700px; height:200px; margin: 0 auto; padding-left: 30px;}
		.member{float:left; width: 100px; height: 200px; margin: 15px;}
		.img{width: 100px; height: 100px; overflow: hidden; border-radius: 30px;}
		.imgDiv{width: 250px; height: 300px; overflow: hidden; border-radius: 70px;}
		.nick{width: 100px; height: 50px;}
		.nick button{width: 110px; height: 30px; font-size: 12px;}
		#profile{margin:0 auto; width: 700px; height: 650px; border:1px solid lightgray;border-radius: 10px;}
		#info{width: 100%; height: 350px;}
		#info-img{float:left; width: 45%; height: 350px;padding:35px;}
		#info-detail{float:left; width: 50%; height: 350px; padding: 30px 0 0;}
		#imgs{width: 100%; height: 300px;}
		.profile-img{float:left; width: 33.3%; height: 300px;border:1px solid lightgray;border-radius: 10px;}
		#manner{width: 100%; height: 100px; text-align: left; padding: 20px;}
		#msg{width: 100%; height: 300px;}	
		#noteBox{width: 700px;margin: auto;}
		#chat{width: 700px; height:500px; margin: auto;border: 1px solid lightgray;border-radius: 10px;}
		#chatTitle{height: 50px;}
		#chatContents{height: 300px;}
		#chatContents p{padding: 10px;}
		.matchingDiv{text-align: center;}
		.guide{width:250px; height:250px; margin-right: 100px;}
		.go{width:250px; height:250px;}
		#profileImgDiv{width: 180px; height: 180px; overflow: hidden; border-radius: 50px; margin:10px auto;}
		.find{width: 320px; text-align: left}
		.findImg{width: 30px; height: 30px;}
		#infoTable {text-align: left;}
		#infoTable tr{height: 35px;}
		#infoTable th{width: 85px; padding: 0px;}
		#infoTable td{padding: 0px;}
		#infoTable input{border:0;}
		#infoTable textarea{border:0;}
		.carousel-item input{width: 250px; margin-left: 50px; text-align: center;}
	</style>
</head>
<body>
	<div class="wrap container">
<!-- 헤더&메뉴바 -->
	<div id="header" class="row">
		<div class="col">
			<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
		</div>
	</div>
<!-- 컨텐츠 -->
	<div id="contents" class="contents row">
		<div class="contents-side col">
			<div class="guideDiv">
				<br><br>
				<img class="guide" src="/resources/image/guide.png">
				<img class="go" src="/resources/image/go.png">
				<br><br>
				<button class="btn btn-dark" style="margin-right: 150px;" onclick="gudieOnOff();">매칭 방법 알아보기</button>
				<button class="btn btn-dark" style="width: 165px;" onclick="goMatching();">매칭하러 가기</button>
				<br><br>
			</div>
			<div class="guideContents" style="display: none;">
				<br><br>
				<h1>How to Matching</h1>
				<br><br>
				<div id="1">
					<img width="50px" height="50px" alt="1" src="/resources/image/matching/one.png">
				</div>
				<br>
				<h6><i>매칭에 활용되는 내 정보를 확인해주세요</i></h6>
				<br>
				<button class="btn btn-dark" onclick="example()">내 정보 보기</button>
				<br>
				<table id="myInfo" class="table">
					<tr>
						<th>프로필 사진</th>
						<td><div id="profileImgDiv"><img width="100%" height="100%" src="/resources/image/matching/chaeunwoo.jpg"></div></td>
					</tr>
					<tr>
						<th>운동경력</th>
						<td>1년~2년</td>
					</tr>
					<tr>
						<th>3대 기록</th>
						<td>300~350</td>
					</tr>
					<tr>
						<th>마이짐</th>
						<td>경기 부천시 원미동 94-5<br>바디업휘트니스</td>
					</tr>
					<tr>
						<th>매너점수</th>
						<td>300점</td>
					</tr>
					<tr>
						<th>자기소개</th>
						<td>안녕하세요 운동하는 30대 <br> 직장인입니다. 주말에 부천,광명에서 <br>같이 운동하실분 쪽지주세요!</td>
					</tr>
				</table>
				<br>
				<br><br><br>
				
				<div id="2">
					<img width="50px" height="50px" alt="2" src="/resources/image/matching/two.png">
				</div>
				<br>
				<h6><i>회원 유형을 선택해주세요</i></h6>
				<br>
				<h6><b>맞춤 추천</b></h6>
				<button class="btn btn-light find" onclick="example();"><img class="findImg" src="/resources/image/matching/opacity.png"> 운동 실력이 비슷한 회원</button><br><br>
				<button class="btn btn-light find" onclick="example();"><img class="findImg" src="/resources/image/matching/place.png"> 내 주변 회원</button><br><br>
				<button class="btn btn-light find" onclick="example();"><img class="findImg" src="/resources/image/matching/heart.png"> 매너 점수가 높은 회원</button><br><br>
				<button class="btn btn-light find" onclick="example();"><img class="findImg" src="/resources/image/matching/master.png"> 짬에서나오는 바이브를 가진 회원</button><br><br>
				<button class="btn btn-light find" onclick="example();"><img class="findImg" src="/resources/image/matching/squat.png"> 쫌 치네? 3대 500 이상 회원</button><br><br>
				<button class="btn btn-light find" onclick="example();"><img class="findImg" src="/resources/image/matching/high-five.png"> 동성 회원</button><br><br>
				<br><br><br>
				
				<div id="3">
					<img width="50px" height="50px" alt="3" src="/resources/image/matching/three.png">
				</div>
				<br>
				<h6><i>선택한 유형의 회원이 추천됩니다</i></h6>
				<br>
				<div id="memberList">
					<div class="member">
						<div class="img">
							<img width="100%" height="100%" src="/resources/image/matching/strap.png">
						</div>
						<br>
						<div class="nick">
							<button class="btn btn-light">언제철들래</button>
						</div>
					</div>
					<div class="member">
						<div class="img">
							<img width="100%" height="100%" src="/resources/image/matching/img2.jpg">
						</div>
						<br>
						<div class="nick">
							<button class="btn btn-light">헬린이</button>
						</div>
					</div>
					<div class="member">
						<div class="img">
							<img width="100%" height="140px" src="/resources/image/matching/img3.jpg">
						</div>
						<br>
						<div class="nick">
							<button class="btn btn-light">3대500g</button>
						</div>
					</div>
					<div class="member">
						<div class="img">
							<img width="100%" height="140px" src="/resources/image/matching/img4.png">
						</div>
						<br>
						<div class="nick">
							<button class="btn btn-light">운동합시다</button>
						</div>
					</div>
					<div class="member">
						<div class="img">
							<img width="100%" height="140px" src="/resources/image/matching/img5.jpg">
						</div>
						<br>
						<div class="nick">
							<button class="btn btn-light">나한테데드냐</button>
						</div>
					</div>
				</div>
				<br><br><br><br>
				
				<div id="4">
					<img width="50px" height="50px" alt="4" src="/resources/image/matching/four.png">
				</div>
				<br>
				<h6><i>프로필을 열람하고 같이 운동하고 싶은 회원에게 쪽지를 보내세요!</i></h6>
				<br>
				<div id="profile">
					<div id="info">
						<div id="info-img">
							<div class="imgDiv">
							<img id="profileImg" width="100%" height="100%" src="/resources/image/matching/strap.png">
							</div>
						</div>
						<div id="info-detail">
							<table id="infoTable" class="table table-borderless">
								<tr>
									<th>닉네임</th>
									<td>
										<input type="text" id="memberNick" value="언제철들래" readonly>
									</td>
								</tr>
								<tr>
									<th>운동경력</th>
									<td>
										<input type="text" id="memberCareer" value="10년 이상" readonly>
									</td>
								</tr>
								<tr>
									<th>3대 기록</th>
									<td>
										<input type="text" id="memberSBD" value="600이상" readonly>
									</td>
								</tr>
								<tr>
									<th>마이짐</th>
									<td>
										<input type="text" id="jymAddress" name="jymAddress" style="width: 250px;border:0;" value="경기도 부천시 원미동 48-4" readonly><br>
										<input type="text" id="jymTitle" name="jymTitle" style="width: 250px;border:0;" value="B&R휘트니스" readonly>	
									</td>
								</tr>
								<tr>
									<th>성별</th>
									<td>
										<input type="text" id="memberGender" name="memberGender" value="남성" style="width: 250px;border: 0" readonly> 
									</td>
								</tr>
								<tr>
									<th>매너점수</th>
									<td>
										<input type="text" id="memberManner" name="membmerManner" value="400점" readonly>
									</td>
								</tr>
								<tr>
									<th>자기소개</th>
									<td><textarea id="memberIntroduce" readonly>안녕하세요 운동좋아하는 ESTJ입니다!!</textarea></td>
								</tr>
							</table>
						</div>
					</div>
				<br><br>
				<div class="memberQnA" style="width: 350px; margin: auto;">
					<img width="50px" height="50px" src="/resources/image/question.png">
					<br><br>
					<div id="carouselExampleControlsNoTouching" class="carousel carousel-dark slide" data-bs-touch="false">
					  <div class="carousel-inner">
					    <div class="carousel-item active">
							자극vs중량?!
							<input type='text' class='form-control' value='중량' readonly>
					    </div>
					    <div class="carousel-item">
					    	가장 좋아하는 운동 부위
							<input type='text' class='form-control' value='하체' readonly>
					    </div>
					    <div class="carousel-item">
					    	현재 진행중인 분할
							<input type='text' class='form-control' value='4분할' readonly>
					    </div>
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
				</div>
				<br><br>
				<button type="button" class="btn btn-dark" id="modalBtn">쪽지 보내기</button>
			</div>
				<br><br><br><br>
				
				<div id="5">
					<img width="50px" height="50px" alt="5" src="/resources/image/matching/five.png">
				</div>
				<br>
				<h6><i>상대방의 수락 이후 쪽지함에서 대화를 이어나갈 수 있습니다.</i></h6>
				<br>
				<div id="noteBox">
					<span><h5> 쪽지함 </h5></span>
					<table class="table" id="noteTable" style="border: 1px solid lightgray">
						<tr>
							<th><input class="form-check-input" type="checkbox" id="nb-chkbox-all"/></th>
							<th width="50"><label class="form-check-label" for="nb-chkbox-all">번호</label></th>
							<th width="200">내용</th>
							<th width="150">보낸 사람</th>
							<th width="150">보낸 날짜</th>
						</tr>
						<tr>
							<th><input class="form-check-input" type="checkbox" id="nb-chkbox-all"/></th>
							<td>1</td>
							<td>
								매칭메시지 도착
								<span style="float: right;" class="badge text-bg-danger">New</span>
							</td>
							<td>언제철들래</td>
							<td>2022.06.13</td>
						</tr>
						<tr>
							<td colspan="5"><button class="btn btn-dark">1</button></td>
						</tr>
						<tr>
							<td colspan="5">
								<div align="center">
									<div style="display:inline-block;">
										<select name="searchCondition" class="btn btn-dark">
											<option value="all">전체</option>
											<option value="contents">내용</option>
											<option value="nickName">닉네임</option>
										</select>
									</div>
									<div style="display:inline-block;">
										<input class="form-control" type="text" name="searchValue" value="">
									</div>	
									<div style="display:inline-block;">
										<input type="submit" value="검색" class="btn btn-dark" onclick="example();">
									</div>
								</div>
							</td>
						</tr>
					</table>
				</div>
				<br><br><br><br>
				
				<div id="6">
					<img width="50px" height="50px" alt="6" src="/resources/image/matching/six.png">
				</div>
				<br>
				<h6><i>1:1 쪽지의 일정잡기 기능을 사용하면 캘린더에 운동 일정이 추가됩니다!</i></h6>
				<br>
				<div id="chat">
					<div class="row">
						<div class="contents-side col">
							<div id="essential info" style="text-align: left; padding-left: 20px; height: 45px;">
								<br>
								<span><h5> 쪽지 </h5></span>
							</div>
						</div>
						<div class="col text-end" style="margin-right: 10px;">
							<br>
							<button class="btn btn-dark" onclick="example();">목록으로</button>
							<button class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#reportNote" id="btn-2">신고</button>
						</div>
					</div>
					<hr>
					<div class="row" style="text-align: left; padding-left: 10px;">
						<div class="col">
							보낸 사람 : 언제철들래
						</div>
					</div>
					<div class="row" style="text-align: left; padding-left: 10px;">
						<div class="col">
							보낸 시간 : 2022-06-13
						</div>
					</div>
					<hr>
					<div class="row text-center">
			</div>
			<div class="row text-center" id="chat-window">
				<div class="col" style="text-align: right; margin-right: 10px;">
					<span id="chat-column" >
						<span style="background-color: #FFE400; border-radius: 10px; margin-right: 10px;">안녕하세요</span>
						<br>
						<span style="font-size: 12px;">2022-06-13 09:00</span>
					</span>
				</div>
			</div>
			<br>
			<div class="row text-center" id="chat-area">
				<div class="col">
					<div class="row">
						<div class="col">
						</div>
						<div class="col-10">
							<input class="form-control" type="text" id="chat-contents" required>
						</div>
						<div class="col-auto">
							<button style="margin-right: 10px;" class="btn btn-dark" id="chat-btn">입력</button>
						</div>
						<div class="col">
						</div>
					</div>
					<hr>
						<div class="row">
							<div class="col" align="center">
								<h6>날짜</h6> 
								<input type="date" id="meet-date" required/>
							</div>
							<div class="col" align="center">
								시간  <input class="timepicker" id="meet-time" required/>
							</div>
							<div class="col" align="center">
								메모  <input type="text" id="meet-memo"  maxlength="15" placeholder="ex)헬스장, 운동부위" required/>
							</div>
						</div>
					<br>
					<div class="row">
						<div class="col" align="right" >
							<button class="btn btn-dark" onclick="example();">일정잡기</button>
						</div>
						<div class="col" align="left">
							<button class="btn btn-dark" onclick="example();">닫기</button>
						</div>
					</div>
				</div>
			</div>
			<br>
				</div>
				<br><br><br>
				<div id="6">
					<img width="50px" height="50px" alt="5" src="/resources/image/matching/six.png">
				</div>
				<br>
				<h6><i>모든 준비가 끝났습니다 파트너를 찾으러 출발!</i></h6>
				<br>
				<button class="btn btn-dark" style="width: 165px;" onclick="goMatching();">매칭하러 가기</button>
			</div>
			<br>
		</div>
		<br><br>
	</div>
	<div id="modalBox" class="modal fade" id="exampleModal" tabindex="-1" data-bs-backdrop="static" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h1 class="modal-title fs-5" id="exampleModalLabel">쪽지보내기</h1>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	        <div class="modal-contents">
	        	<textarea class="form-control" id="note-contents" rows="7">쪽지 예시입니다</textarea>
	        </div>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
	      </div>
	    </div>
	  </div>
	</div>
<!-- 푸터	 -->
	<div id="footer" class="row">
		<div class="col">
			<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
		</div>
	</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>
<script type="text/javascript">
	$("#modalBtn").on("click",function(e){
		$("#modalBox").modal("show");
	})
	
	function gudieOnOff(){
		if($(".guideContents").css("display") == "none"){
			$(".guideContents").show();
			
		}else{
			$(".guideContents").hide();
		}
	}
	function example(){
		alert("예시 페이지입니다.");
	}
	
	function goMatching(){
		var session = '${loginUser.memberNick}'
		if(session == ''){
			alert("로그인 후 이용가능합니다.");
			location.href='/member/loginView.strap';
		}else{
			location.href='/match/matchingFind.strap';
		}
		
	}
</script>
</body>
</html>