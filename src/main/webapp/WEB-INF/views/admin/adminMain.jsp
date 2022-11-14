<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Main</title>

</head>
<body>
	<jsp:include page="/WEB-INF/views/common/adminHeader.jsp"></jsp:include>
	<div class="container">
		<div class="row" align="center">
			<div class="col">
				<br>
				<p style="text-align:left; font-size:20px;">대시보드</p>
				<hr>
			</div>
		</div>
		<div class="row" align="center">
			<div class="col" align="left">
				<h3>문의</h3>
				<div class="row">
					<div class="col-auto">
						<c:if test="${qnaCount eq 0 }">
							<h1>남은 문의 : <b>${qnaCount }</b></h1>
						</c:if>
						<c:if test="${qnaCount ne 0 }">
							<a href="/admin/adminUnsolvedQna.strap" style="text-decoration:none;color:black;"><h1>남은 문의 : <b>${qnaCount }</b></h1></a>
						</c:if>
					</div>
					<div class="col">
						<h1><span></span></h1>
					</div>
				</div>
				<div class="row">
					<div class="col">
						<h3>오늘 문의 처리 : <b>${todayQnaAnswer }</b></h3>
					</div>
				</div>
				<div class="row">
					<div class="col">
						총 문의 수 : ${totalQna }
					</div>
				</div>
				<div class="row">
					<div class="col">
						총 처리 문의 수 : ${qnaAnswer }
					</div>
				</div>
			</div>
			<div class="col" align="left">
				<h3>신고</h3>
				<div class="row">
					<div class="col">
						<c:if test="${reportCount eq 0 }">
							<h1>남은 신고 : <b>${reportCount }</b></h1>
						</c:if>
						<c:if test="${reportCount ne 0 }">
							<a href="/admin/adminReportListView.strap" style="text-decoration:none;color:black;"><h1>남은 신고 : <b>${reportCount }</b></h1></a>
						</c:if>
					</div>
				</div>
				<div class="row">
					<div class="col">
						<h3>오늘 신고 처리 : <b>${todayReportProcess }</b></h3>
					</div>
				</div>
				<div class="row">
					<div class="col">
						총 신고 수 : ${totalReport }
					</div>
				</div>
				<div class="row">
					<div class="col">
						총 처리 신고 수 : ${reportProcess }
					</div>
				</div>
			</div>
		</div>
		<hr>
		<h3>방문자</h3>
		<hr>
		<h3>배너</h3>
	</div>
	<script>
		var removeToast;
		function toast(string) {
		    const toast = document.getElementById("toast");
	
		    toast.classList.contains("reveal") ?
		        (clearTimeout(removeToast), removeToast = setTimeout(function () {
		            document.getElementById("toast").classList.remove("reveal")
		        }, 3000)) :
		        removeToast = setTimeout(function () {
		            document.getElementById("toast").classList.remove("reveal")
		        }, 3000)
		    toast.classList.add("reveal"),
		        toast.innerText = string
		}
	</script>
</body>
</html>