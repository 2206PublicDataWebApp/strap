<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Admin Report Detail</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/adminHeader.jsp"></jsp:include>
	<div class="container">
			<br>
			<div class="row">
				<div class="col">
				
				</div>
				<div class="col" align="right">
					<button onclick="location.href='/admin/adminReportListView.strap?page=${page}'" class="btn btn-dark">목록으로</button>
				</div>
			</div>
			<br>
			<div class="row">
				<div class="col">
					<div class="table-responsive">
						<table align="center" width="500" border="2" class="table table-bordered">
							<tr>
								<td id="cl" align="center" width="150">신고 회원</td>
								<td>${adminReport.memberNick }</td>
							</tr>
							<tr>
								<td id="cl" align="center" width="150">신고당한 회원</td>
								<td>${adminReport.reportMemberNick }</td>
							</tr>
							<tr>
								<td id="cl" align="center" width="150">작성일</td>
								<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${adminReport.reportDate}"/></td>
							</tr>
							<tr height="200px">
								<td id="cl" align="center" width="150">내용</td>
								<td>${adminReport.reportContents }
								</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
			<hr>
			<c:if test="${adminReport.reportProcess eq 'Y'}">
				<div class="row" >
					<div class="col">
						<form action="/admin/registerAdminReport.strap" method="post">
							<input type="hidden" value="${adminReport.reportNo }" name="ReportNo">
							<input type="hidden" value="${page}" name="page">
							<div class="row text-center">
								<div class="col mb-3">
									<div class="mb-3 text-start">
										<h4>신고 처리</h4>
									</div>
								</div>
							</div>
							<div class="row text-center">
								<div class="col">
									<button id="Report-modify-done" class="btn btn-dark" type="submit" style="display:none;">수정 완료</button>
								</div>
							</div>
						</form>
							<div class="row text-center">
								<div class="col">
									<select class="form-select" aria-label="Default select example">
										<option selected>컨텐츠 처리</option>
										<option value="1">숨김</option>
										<option value="2">삭제</option>
									</select>
								</div>
								<div class="col">
									<select class="form-select" aria-label="Default select example">
										<option selected>회원 처리</option>
										<option value="1">탈퇴</option>
									</select>
								</div>
							</div>
					</div>
				</div>
			</c:if>
			
	</div>
	<script>
		function textareaAble(thisBtn){
			var target = document.getElementById('Report-answer');
			document.getElementById('Report-modify').style.display = "none"
			document.getElementById('Report-modify-done').style.display = "inline-block"
			target.disabled = false;
		}
	</script>
</body>
</html>