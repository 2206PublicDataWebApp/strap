<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- CDN -->
<!-- 부트스트랩 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" />
<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- css -->
<link rel="stylesheet" type="text/css" href="/resources/css/common.css">
<style>
	.contents-side{text-align: center;}
	#memberList{table-layout: fixed; width: 700px; height:250px; margin: 0 auto; padding-left: 30px;}
	.member{float:left; width: 100px; height: 200px; margin: 15px;}
	.img{width: 100px; height: 100px; overflow: hidden; border-radius: 70px;}
	.nick{width: 100px; height: 50px;}
	.nick button{width: 110px; height: 30px; font-size: 12px;}
	#profile{display:none; margin:0 auto; width: 700px; height: 1000px; border:1px solid lightgray;border-radius: 10px;}
	#info{width: 100%; height: 300px;}
	#info table{text-align: left;}
	#infoTable input, #infoTable textarea{border: 0} 
	#infoTable th{width: 150px; text-align: center;} 
	#info-img{float:left; width: 33%; height: 300px;padding:30px;}
	#info-detail{float:left; width: 67%; height: 300px;}
	#imgs{width: 100%; height: 300px;}
	.profile-img{float:left; width: 33.3%; height: 300px;border:1px solid lightgray;border-radius: 10px;}
	#manner{width: 100%; height: 100px; text-align: left; padding: 20px;}
	#msg{width: 100%; height: 300px;}
	#noteTitle{width: 566px; border: 1px solid lightgray; border-radius: 10px;}	
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
			<div id="memberList">
				<h6 align="center"><b>매너 점수가 높은 회원</b></h6>
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
							<button onclick="profileDetail('${member.mProfileRename}','${member.memberNick}','${member.memberCareer}','${member.memberSBD}','${member.memberJym}','${member.memberGender}','${member.memberIntroduce}','${member.memberManner}');" class="btn btn-light">${member.memberNick }</button>
						</div>
					</div>
				</c:forEach>
			</div>
			<div id="profile">
				<div id="info">
					<div id="info-img">
						<div class="img" style="width: 150px; height:150px; ">
						<img id="profileImg" width="100%" height="100%" src="/resources/profileUploadFiles/default.png">
						</div>
						<br>
						<div class="nick">
							<button class="btn btn-light nickname" style="width: 150px;">언제철들래</button>
						</div>
					</div>
					<div id="info-detail">
						<table id="infoTable" class="table">
							<tr>
								<th>운동경력</th>
								<td>
									<input type="text" id="memberCareer">
								</td>
							</tr>
							<tr>
								<th>3대 기록</th>
								<td>
									<input type="text" id="memberSBD">
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
								<th>자기소개</th>
								<td><textarea id="memberIntroduce" style="width: 280px; height: 60px;" readonly></textarea></td>
							</tr>
						</table>
					</div>
				</div>
				<div id="imgs">
					<div class="profile-img"></div>
					<div class="profile-img"></div>
					<div class="profile-img"></div>
				</div>
				<div id="manner">
					<span style="display: inline-block; width: 150px; padding-left: 30px;">3대 매너점수</span>
					<span id="memberManner" class="alert alert-dark" style="display:inline-block; width: 465px; text-align: center;"></span>
				</div>
				<div id="msg">
					<br>
					<input type="text" id="noteTitle" name="noteTitle" placeholder="쪽지 제목">
					<textarea id="noteContents" name="noteContents" rows="7" cols="73" placeholder="쪽지 내용" style="border:1px solid lightgray; border-radius: 10px; resize: none"></textarea> <br><br>
					<button class="btn btn-dark" onclick="sendNote()">쪽지 보내기</button>
				</div>
			</div>
			<br>
			<button onclick="mannerRefresh();" class="btn btn-dark">새로 추천 받기</button>
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
	function mannerRefresh(){
		var count ;
		$.ajax({
			url: "/match/countNumber.strap",
			type:"get",
			success:function(result){
				count = result
				if(confirm("회원을 새로 추천받으시겠습니까? 하루:3회 (남은 횟수:"+count+"회)")){
					if(count >  0){
							location.href="/match/mannerRefresh.strap";
					} else{
							alert("일일 횟수 3회를 모두 사용하였습니다.")
					}
					
				}
			}
		})
		
	}
	
	function sendNote(){
		var recipientNick = $(".nickname").text();
		var noteTitle = $("#noteTitle").val();
		var noteContents = $("#noteContents").val();
		if(!noteTitle.length == 0 && !noteContents.length==0){
			if(confirm("쪽지를 보내시겠습니까?")){
				$.ajax({
					url:"/match/sendNote.strap",
					type:"post",
					data:{"recipientNick":recipientNick,"noteTitle":noteTitle, "noteContents":noteContents},
					success:function(result){
						console.log(result)
						if(result=="ok"){
							alert("쪽지 보내기 성공! 상대가 쪽지를 수락하면 마이페이지의 1:1 쪽지창이 개설됩니다.")
						} else {
							alert("쪽지 보내기 실패!")
						}
					},
					error:function(result){
						alert("관리자에게 문의 바랍니다.");
					}
				})
			}
		} 
	}
	function profileDetail(mProfileRename,memberNick, memberCareer,memberSBD,memberJym,memberGender,memberIntroduce,memberManner){
		$("#profile").show();
		var jym = memberJym.split(",");
		var jymAddress = jym[0];
		var jymTitle = jym[1];
		//profileImt
		if(mProfileRename != ''){
		$("#profileImg").attr("src","/resources/profileUploadFiles/"+mProfileRename);
		}else{
		$("#profileImg").attr("src","/resources/profileUploadFiles/default.png");
		}
		//nickname
		$(".nickname").text(memberNick);
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
		}else if(memberSBD = '200~300'){
			$("#memberSBD").val("200~300");
		}else if(memberSBD = '300~350'){
			$("#memberSBD").val("300~350");
		}else if(memberSBD = '350~400'){
			$("#memberSBD").val("350~400");
		}else if(memberSBD = '400~450'){
			$("#memberSBD").val("400~450");
		}else if(memberSBD = '450~500'){
			$("#memberSBD").val("450~500");
		}else if(memberSBD = '500~600'){
			$("#memberSBD").val("500~600");
		}else if(memberSBD = '600'){
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
		$("#memberManner").text(memberManner+'점');
		//Introduce
		$("#memberIntroduce").val(memberIntroduce);
	}
</script>
</body>
</html>