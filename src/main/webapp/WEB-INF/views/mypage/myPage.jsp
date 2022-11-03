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
			<div id="carouselExampleControlsNoTouching" class="carousel carousel-dark" data-bs-touch="false" style="width: 500px; height: 250px;">
			  <div class="carousel-inner" style="padding-left: 125px;">
			    <div class="carousel-item active" >
					<div class="QnA-img">
				    	<img src="/resources/image/matching/problem.png" width="100px;" height="100px;">
			    	</div>
					<input type="text" class="form-control" value="간단 Q&A, 당신의 취향은?" readonly>
			    </div>
			    <div class="carousel-item">
			    	<b>Q&A</b>
					<span class="QnA-title">가장 좋아하는 운동 부위</span>
					<input type="text" class="form-control Q" id="leg" value="하체" onclick="QnA(this);" readonly>
					<input type="text" class="form-control Q" id="shoulder" value="어깨" onclick="QnA(this);" readonly>
					<input type="text" class="form-control Q" id="chest" value="가슴" onclick="QnA(this);" readonly>
					<input type="text" class="form-control Q" id="back" value="등" onclick="QnA(this);" readonly>
					<input type="text" class="form-control Q" id="arm" value="팔" onclick="QnA(this);" readonly>
			    	<div class="QnA-img">
			    		<br><button class="btn btn-dark submit" onclick="submit();">제출</button>
			    	</div>
			    </div>
			    <div class="carousel-item">
			    	<b>Q&A</b>
					<span class="QnA-title">현재 진행중인 분할</span>
					<input type="text" class="form-control Q" id="1" value="무분할" onclick="QnA(this);" readonly>
					<input type="text" class="form-control Q" id="2" value="2분할" onclick="QnA(this);" readonly>
					<input type="text" class="form-control Q" id="3" value="3분할" onclick="QnA(this);" readonly>
					<input type="text" class="form-control Q" id="4" value="4분할" onclick="QnA(this);" readonly>
					<input type="text" class="form-control Q" id="5" value="5분할" onclick="QnA(this);" readonly>
					<div class="QnA-img">
						<br><button class="btn btn-dark submit" onclick="submit();">제출</button>
			    	</div>
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
	</div>
	<div class="row">
		<div class="col">
			<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
		</div>
	</div>
<script>
	var question;
	var answer;
	function QnA(obj){
		question = $(obj).parent().children(0).eq(1).text();
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
					url:"/member/myinfoQnA.strap",
					type:"post",
					data:{"question":question, "answer":answer},
					success:function(result){
						alert(result);
					}
				})
			}
		}
	}
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>
</div>
</body>
</html>