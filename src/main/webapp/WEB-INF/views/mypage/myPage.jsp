<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
<meta charset="UTF-8">
<title>STRAP MyPage</title>
<!-- CDN -->
<!-- 부트스트랩 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" />
<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- css -->
<link rel="stylesheet" type="text/css" href="/resources/css/common.css">
<style>
	.carousel-item.active input{width: 250px; text-align: center;} 
	.carousel-item.active input:hover{background-color: gold; cursor: pointer;} 
	.QnA-title{display: inline-block; width: 250px;}
	.QnA-img{width: 200px; margin: auto;}
	.submit{width: 70px;}
	.simpleQnA{width: 500px; height: 500px;}
	.QnAStart{width: 250px; height: 150px; text-align: center;}
	.QnAStart img{margin-left: 25px;}
	.QnAStart input{width: 250px; text-align: center;}
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
		<div class="sidebar col-3" >
			<jsp:include page="/WEB-INF/views/common/sideBarMyPage.jsp"></jsp:include>
		</div>
		<div class="contents-side col">
			<div class="simpleQnA">
				<div class="QnAStart">
					<input type="text" class="form-control" value="간단 Q&A, 당신의 취향은" readonly>
					<br>
			    	<img src="/resources/image/matching/problem.png" width="100px;" height="100px;">
					<br>
					<button type="button" class="btn btn-dark" onclick="QnA();">시작하기</button>
	    		</div>
			</div>
		</div>
	</div>
</div>
<div class="row">
	<div class="col">
		<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	</div>
</div>
<script>
	function QnA(){
		$.ajax({
			url:"/mypage/qna.strap",
			type:"get",
			success:function(result){
				console.log("성공:"+result);
			},
			error:function(result){
				console.log("실패:"+result);
			}
		})
	}

	var qnaNo;
	var answer;
	var divTag;
// 	function QnA(obj,no){
// 		qnaNo = no;
// 		question = $(obj).parent().children(0).eq(1).text();
// 		answer = $(obj).val();
// 		divTag = $(obj).parent();
// 		console.log(divTag);
// 		$(".Q").css("background-color","white");
// 		$(obj).css("background-color","gold");
// 	}
	
	function submit(){
		if(answer == null ){
			alert("답변을 선택해주세요!");
		} else {
			if(confirm("답변을 제출하시겠습니까?")){
				$(divTag).remove();
// 				$(".carousel-item "+qnaNo).remove();
// 				location.href="/mypage/qnaAnswer.strap?qnaNo="+qnaNo+"&answer="+answer;
// 				$.ajax({
// 					url:"/mypage/qnaAnswer.strap",
// 					type:"post",
// 					data:{"qunNo":qunNo,"answer":answer},
// 					sucess:function(result){
// 						alert(result);
// 					}
// 				})
			}
		}
	}
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>
</body>
</html>