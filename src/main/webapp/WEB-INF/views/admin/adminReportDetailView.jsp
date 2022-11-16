<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="icon" href="/resources/image/s.png">
	<title>스트랩(관리자) : 신고 상세페이지</title>
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
			<div class="row" >
				<div class="col">
						<div class="row text-center">
							<div class="col mb-3">
								<div class="mb-3 text-start">
									<h4>신고 처리</h4>
								</div>
							</div>
						</div>
					<form action="/admin/processAdminReport.strap" method="post">
						<input type="hidden" value="${adminReport.reportNo }" name="reportNo">
						<input type="hidden" value="${page}" name="page">
						<div class="row text-center">
							<div class="col" align="right">
							</div>
							<div class="col">
							</div>
							<div class="col">
								<div>게시물 처리</div>
								<select class="form-select" name="contentsProcess" aria-label="Default select example">
									<option value="N" <c:if test="${adminReport.contentsProcess eq 'N'}">selected</c:if>>선택해주세요</option>
									<option value="Y" <c:if test="${adminReport.contentsProcess eq 'Y'}">selected</c:if>>삭제</option>
								</select>
							</div>
							<div class="col" >
								<div>회원 처리</div>
								<select class="form-select" name="memberProcess" aria-label="Default select example">
									<option value="N" <c:if test="${adminReport.memberProcess eq 'N'}">selected</c:if>>선택해주세요</option>
									<option value="Y" <c:if test="${adminReport.memberProcess eq 'Y'}">selected</c:if>>탈퇴</option>
								</select>
							</div>
							<div class="col">
							</div>
							<div class="col">
							</div>
						</div>
						<div class="row text-center">
							<div class="col">
								<button id="Report-modify-done" class="btn btn-dark mt-4" type="submit" >신고 처리 완료</button>
							</div>
						</div>
					</form>
				</div>
			</div>
			<br><br><br>
	</div>
	
</body>
</html>