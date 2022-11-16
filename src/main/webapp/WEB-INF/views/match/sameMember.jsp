<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" href="/resources/image/s.png">
<title>스트랩 : 매칭</title><!-- CDN -->
<!-- 부트스트랩 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" />
<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- css -->
<link rel="stylesheet" type="text/css" href="/resources/css/common.css">
<link rel="stylesheet" type="text/css" href="/resources/css/matchingPage.css">
<style>
	.QnA input{width: 250px; text-align: center;}
	#carouselExampleControlsNoTouching{width: 100%;}
	#carouselExampleControlsNoTouching input{margin-left: 50px;}
	.findImg{width: 30px; height: 30px;}
	
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
		<br><br>
			<div class="memberRecomend">
				<div id="memberList">
					<button class="btn btn-light find" onclick="findMember1();"><img class="findImg" src="/resources/image/matching/opacity.png"> 운동 실력이 비슷한 회원</button><br><br>
					<c:forEach items="${mList }" var="member">
						<div class="member">
							<div class="img">
								<c:if test="${member.mProfileRename eq null }">
									<img width="100%" height="100%" src="/resources/profileUploadFiles/default.png">
								</c:if>
								<c:if test="${member.mProfileRename ne null }">
									<img alt="이미지" width="100%" height="100%" src="/resources/profileUploadFiles/${member.mProfileRename }">
								</c:if>
							</div>
							<br>
							<div class="nick">						
								<button onclick="profileDetail('${member.memberId}','${member.mProfileRename}','${member.memberNick}','${member.memberCareer}','${member.memberSBD}','${member.memberJym}','${member.memberGender}','${member.memberIntroduce}','${member.memberManner}');" class="btn btn-light">${member.memberNick }</button>
							</div>
						</div>
					</c:forEach>
				</div>
				<br><br>
				<div style="margin: auto; width: 150px;">
				<button onclick="sameRefresh();" class="btn btn-dark">새로 추천 받기</button>
				</div>
			</div>
			<br><br><br>
						<div id="profile">
				<div id="info">
					<div id="info-img">
						<div class="imgDiv">
						<img id="profileImg" width="100%" height="100%" src="/resources/profileUploadFiles/default.png">
						</div>
					</div>
					<div id="info-detail">
						<table id="infoTable" class="table table-borderless">
							<tr>
								<th>닉네임</th>
								<td>
									<input type="text" id="memberNick" readonly>
								</td>
							</tr>
							<tr>
								<th>운동경력</th>
								<td>
									<input type="text" id="memberCareer" readonly>
								</td>
							</tr>
							<tr>
								<th>3대 기록</th>
								<td>
									<input type="text" id="memberSBD" readonly>
								</td>
							</tr>
							<tr>
								<th>마이짐</th>
								<td>
									<input type="text" id="jymAddress" name="jymAddress" style="width: 250px;border:0;" readonly><br>
									<input type="text" id="jymTitle" name="jymTitle" style="width: 250px;border:0;" readonly>	
								</td>
							</tr>
							<tr>
								<th>성별</th>
								<td>
									<input type="text" id="memberGender" name="memberGender" style="width: 250px;border: 0" readonly> 
								</td>
							</tr>
							<tr>
								<th>매너점수</th>
								<td>
									<input type="text" id="memberManner" name="membmerManner" readonly>
								</td>
							</tr>
							<tr>
								<th>자기소개</th>
								<td><textarea id="memberIntroduce" readonly></textarea></td>
							</tr>
						</table>
					</div>
				</div>
				<br><br>
				<div class="memberQnA" style="width: 350px; margin: auto;">
					<img width="50px" height="50px" src="/resources/image/question.png">
					<br>
				</div>
				<br><br>
				<button type="button" class="btn btn-dark" id="modalBtn">쪽지 보내기</button>
			</div>
			<br><br><br>
		</div>
	</div>
<!-- Modal -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>
<div id="modalBox" class="modal fade" id="exampleModal" tabindex="-1" data-bs-backdrop="static" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">쪽지보내기</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <div class="modal-contents">
        	<textarea class="form-control" id="note-contents" rows="7"></textarea>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" onclick="noteReset();">닫기</button>
        <button type="button" class="btn btn-dark" onclick="sendNote();">보내기</button>
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
<script>
	$("#modalBtn").on("click",function(e){
		var memberNick = $("#memberNick").val();
		$.ajax({
			url:"/match/sendCheck.strap",
			data:{"memberNick":memberNick},
			type:"post",
			success:function(result){
				if(result == "ok"){
					$("#modalBox").modal("show");
				}else{
					alert("상대방의 쪽지 수락을 대기중입니다.");
				}
			},
			errer:function(result){
				alert("관리자에게 문의바랍니다.")
			}
		})
	})
	function sameRefresh(){
		var count ;
		$.ajax({
			url: "/match/countNumber.strap",
			type:"get",
			success:function(result){
				count = result
				if(confirm("회원을 새로 추천받으시겠습니까? 하루:3회 (남은 횟수:"+count+"회)")){
					if(count >  0){
							location.href="/match/sameRefresh.strap";
					} else{
							alert("일일 횟수 3회를 모두 사용하였습니다.")
					}
					
				}
			}
		})
		
	}
	function noteReset(){
		$("#note-contents").val("");
	}
	
	function sendNote(){
		var recipientNick = $("#memberNick").val();
		var noteContents = $("#note-contents").val();
		if(!noteContents.length==0){
			if(confirm("쪽지를 보내시겠습니까?")){
				$.ajax({
					url:"/match/sendNote.strap",
					type:"post",
					data:{"recipientNick":recipientNick,"noteContents":noteContents},
					success:function(result){
						if(result=="ok"){
							alert("쪽지 보내기 성공! 상대가 쪽지를 수락하면 마이페이지의 1:1 쪽지창이 개설됩니다.")
							location.reload();
						} else {
							alert("쪽지 보내기 실패!")
						}
					},
					error:function(result){
						alert("관리자에게 문의 바랍니다.");
					}
				})
			}
		}else{
			alert("쪽지의 제목과 내용을 입력해주세요");
		}
	}
	function profileDetail(memberId, mProfileRename,memberNick, memberCareer,memberSBD,memberJym,memberGender,memberIntroduce,memberManner){
		$("#profile").show();
		var jym = memberJym.split(",");
		var jymAddress = jym[0];
		var jymTitle = jym[1];
		//profileImg
		if(mProfileRename != ''){
		$("#profileImg").attr("src","/resources/profileUploadFiles/"+mProfileRename);
		}else{
		$("#profileImg").attr("src","/resources/profileUploadFiles/default.png");
		}
		//nickname
		$("#memberNick").val(memberNick);
		//Career
		if(memberCareer =='1'){
			$("#memberCareer").val("1년 이하");
		} else if(memberCareer == '1-2'){
			$("#memberCareer").val("1년~2년");
		} else if(memberCareer == '2-3'){
			$("#memberCareer").val("2년~3년");
		} else if(memberCareer == '3-5'){
			$("#memberCareer").val("3년~5년");
		} else if(memberCareer == '5-10'){
			$("#memberCareer").val("5년~10년");
		} else if(memberCareer == '10'){
			$("#memberCareer").val("10년 이상");
		}
		//SBD
		if(memberSBD == '200'){
			$("#memberSBD").val("200이하");
		}else if(memberSBD == '200~300'){
			$("#memberSBD").val("200~300");
		}else if(memberSBD == '300~350'){
			$("#memberSBD").val("300~350");
		}else if(memberSBD == '350~400'){
			$("#memberSBD").val("350~400");
		}else if(memberSBD == '400~450'){
			$("#memberSBD").val("400~450");
		}else if(memberSBD == '450~500'){
			$("#memberSBD").val("450~500");
		}else if(memberSBD == '500~600'){
			$("#memberSBD").val("500~600");
		}else if(memberSBD == '600'){
			$("#memberSBD").val("600이상");
		}
		//JYM
		$("#jymAddress").val(jymAddress);
		$("#jymTitle").val(jymTitle);
		//Gender
		if(memberGender ='M'){
		$("#memberGender").val('남성');
		} else if(memberGender = 'F'){
		$("#memberGender").val('여성');
		}
		//manner
		$("#memberManner").val(memberManner+'점');
		//Introduce
		memberIntroduce = memberIntroduce.replace(/<br>/g, '\n');
		$("#memberIntroduce").val(memberIntroduce);
		//Q&A
		$.ajax({
			url:"/match/memberQnA.strap",
			type:"get",
			data:{
				"memberId":memberId
			},
			success:function(result){
				$("#carouselExampleControlsNoTouching").remove();
				$(".noDiv").remove();
				var html = "";
				if(result.length != 0){
					html += "<div id='carouselExampleControlsNoTouching' class='carousel carousel-dark slide' data-bs-touch='false'>";
					html += "<div class='carousel-inner'>"
					for(var i = 0 ; i<result.length; i++){
						if(i==0){
							html += "<div class='carousel-item active QnA'>";
						}else{
							html += "<div class='carousel-item QnA'>";
						}
						html += result[i].qnaTitle;
						html += "<input type='text' class='form-control' value='"+result[i].qnaAnswer+"' readonly>";
						html += "<br></div>";
					}
					html += "<button class='carousel-control-prev' type='button' data-bs-target='#carouselExampleControlsNoTouching' data-bs-slide='prev'>";
				    html += "<span class='carousel-control-prev-icon' aria-hidden='true'></span>";
				    html += "<span class='visually-hidden'>Previous</span>";
				    html += "</button>";
				    html += "<button class='carousel-control-next' type='button' data-bs-target='#carouselExampleControlsNoTouching' data-bs-slide='prev'>";
				    html += "<span class='carousel-control-next-icon' aria-hidden='true'></span>";
				    html += "<span class='visually-hidden'>Next</span>";
				    html += "</button>";
				}else{
					html += "<div class='noDiv'>";
					html += "<br><input class='form-control no' type='text' value='아직 답변한 Q&A가 없습니다!' style='width:250px; margin-left:50px;' readonly><br>";
					html += "</div>";
				} 
				$(".memberQnA").append(html);
			}
		})
	}
</script>
</body>
</html>