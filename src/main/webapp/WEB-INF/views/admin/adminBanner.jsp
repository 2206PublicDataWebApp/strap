<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Banner</title>
<style>
#banner-panel{
	background-color:#A6A6A6;
	border-radius:5px;
}
</style>
</head>
<body>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
	<jsp:include page="/WEB-INF/views/common/adminHeader.jsp"></jsp:include>
	<div class="container">
		<div class="row" align="center">
			<div class="col">
				<br>
				<p style="text-align:left; font-size:20px;">배너 관리</p>
				<hr>
			</div>
		</div>
		<div class="row row-cols-auto" align="center">
			<div class="col">
				<button class="btn btn-dark" data-bs-toggle="modal" data-bs-target="#bannerModal">배너 생성</button>
			</div>
			<div class="col">
				<button class="btn btn-dark">배너 삭제</button>
			</div>
		</div>
		<br>
		<c:if test="${not empty bnList}">
			<div class="row" id="banner-panel">
				<div class="col-1" style="width: 10px; padding: 10px">
					<input type="checkbox" id="check-banner">
				</div>
				<div class="col">
					<div class="container">
						<div class="row" style="padding: 10px">
							<div class="col">
								<label for="check-banner">배너 제목 :</label>
							</div>
							<div class="col" align="right">
								<button class="btn btn-dark">수정</button>
							</div>
						</div>
						<div class="row">
							<div class="col">
								배너 이미지 :
							</div>
						</div>
					</div>
				</div>
			</div>
		</c:if>
		<c:if test="${empty bnList}">
			<div class="row" id="banner-panel">
				<div class="col" align="center">
					<br><br>
					<h3><b>데이터가 없습니다. 배너를 생성해 주세요!</b></h3>
					<br><br>
				</div>
			</div>
		</c:if>
	</div>
	
	<!--Banner Modal -->
	<div class="modal fade" id="bannerModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">배너 생성</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="modal-body p-5 pt-0">
						<form action="/admin/registerBanner.strap" method="post" enctype="multipart/form-data">
							<div class="form-floating mb-3">
								<p>배너 이름</p>
								<input class="form-control" type="text"  name="bannerTitle">
							</div>
							<div class="mb-3">
								<p>배너 이미지</p>
								<input class="form-control" type="file" id="bannerFile" name="bannerFilename">
								<div class="row">
									<div class="col" align="center">
										<br>
										미리보기
										<img id="bannerView" src="/resources/image/admin/banner_none.png" alt="이미지 미리보기" style="width:350px; height:100px; border: 1px solid black">
									</div>
								</div>
							</div>
							<button class="w-100 mb-2 btn btn-lg btn-dark" type="submit">등록</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
		
	<script type="text/javascript">
		$(function() {
		    $("#bannerFile").on('change', function(){
		    	readURL(this);
		    });
		});
		function readURL(input) {
		    if (input.files && input.files[0]) {
		        var reader = new FileReader();
		        reader.onload = function (e) {
		        $('#bannerView').attr('src', e.target.result);
		        }
		        reader.readAsDataURL(input.files[0]);
		    }
		}
	</script>
</body>
</html>