<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스트랩(관리자) : 배너관리</title>
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
				<p style="text-align:left; font-size:20px;">배너 관리 (<b>※배너 권장 사이즈 - 1116 X 220</b>)</p>
				<hr>
			</div>
		</div>
		<div class="row row-cols-auto" align="center">
			<div class="col">
				<button class="btn btn-dark" data-bs-toggle="modal" data-bs-target="#bannerModal">배너 생성</button>
			</div>
			<div class="col">
				<button class="btn btn-dark" onclick="deleteBanner();" >배너 삭제</button>
			</div>
		</div>
		<br>
		<c:if test="${not empty bnList}">
			<c:forEach items="${bnList }" var="banner" varStatus="i">
				<div class="row" id="banner-panel">
					<div class="col-1" style="width: 10px; padding: 10px">
						<input class="form-check-input chkBox" type="checkbox" id="check-banner${i.index }" name="bannerCheckBox" value="${banner.bannerNo }">
					</div>
					<div class="col">
						<div class="container">
							<div class="row" style="padding: 10px">
								<div class="col">
									<label for="check-banner${i.index }">배너 제목 : ${banner.bannerTitle }</label>
								</div>
								<div class="col" align="right">
									<button class="btn btn-dark" data-bs-toggle="modal" data-bs-target="#modifyModal${i.index }">수정</button>
								</div>
							</div>
							<div class="row">
								<div class="col">
									배너 이미지 : 
									<img src="/resources/bnuploadFiles/${banner.bannerFileRename }" style="width:600px; heigth:300px;">
								</div>
							</div>
						</div>
						<br>
						<!--Banner Modify Modal -->
						<div class="modal fade" id="modifyModal${i.index }" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
							<div class="modal-dialog modal-dialog-centered">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="exampleModalLabel">배너 수정</h5>
										<button type="button" class="btn-close" data-bs-dismiss="modal"
											aria-label="Close"></button>
									</div>
									<div class="modal-body">
										<div class="modal-body p-5 pt-0">
											<form action="/admin/modifyBanner.strap" method="post" enctype="multipart/form-data">
												<input type="hidden" value="${banner.bannerNo }" name="bannerNo">
												<div class="form-floating mb-3">
													<p>수정할 배너 이름</p>
													<input class="form-control" type="text"  name="bannerTitle">
												</div>
												<div class="mb-3">
													<p>수정할 배너 이미지</p>
													<input class="form-control" type="file" id="modifyFile" name="reloadFile">
													<div class="row">
														<div class="col" align="center">
															<br>
															미리보기
															<img id="modifyBannerView" src="/resources/bnuploadFiles/${banner.bannerFileRename }" alt="이미지 미리보기" style="width:350px; height:100px; border: 1px solid black">
														</div>
													</div>
												</div>
												<button class="w-100 mb-2 btn btn-lg btn-dark" type="submit">수정 완료</button>
											</form>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<br>
			</c:forEach>
			<br><br><br>
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
								<input class="form-control" type="text"  name="bannerTitle" required>
							</div>
							<div class="mb-3">
								<p>배너 이미지</p>
								<input class="form-control" type="file" id="bannerFile" name="bannerFilename" required>
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
		
		$(function() {
			$("#modifyFile").on('change', function(){
		    	readModifyURL(this);
		    });
		});
		function readModifyURL(inputModi) {
		    if (inputModi.files && inputModi.files[0]) {
		        var reader = new FileReader();
		        reader.onload = function (e) {
		        $('#modifyBannerView').attr('src', e.target.result);
		        }
		        reader.readAsDataURL(inputModi.files[0]);
		    }
		}
		
		// 배너 삭제
		function deleteBanner(){
			var checkedList = new Array();
			$(".chkBox:checked").each(function(index, item){
				checkedList.push(this.value);
			});
			
			if (checkedList == ''){
				alert("삭제할 칸을 선택해주시기 바랍니다.");
			} else {
				if(confirm("다시 복원 할 수 없습니다.\n정말 삭제하시겠습니까?")){
					$.each(checkedList, function(index, item){
						console.log(checkedList);
						var $form = $("<form>"); // <>꺽쇠를 적어야 태그 생성
		 				$form.attr("action", "/admin/deleteBanner.strap");
		 				$form.attr("method", "post");
		 				$form.append("<input type='hidden' value='"+checkedList+"' name='bnNoList'>");
		 				$form.appendTo("body");
						$form.submit();
					});
				}
			}
		}
		
	</script>
</body>
</html>