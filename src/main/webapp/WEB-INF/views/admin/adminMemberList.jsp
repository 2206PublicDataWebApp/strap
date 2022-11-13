<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#memberListTable, #memberListTable tr, #memberListTable td {text-align: center;}
	#memberListTable tr:hover {cursor: pointer;}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/adminHeader.jsp"></jsp:include>
		<div class="container">
			<div id="essential info">
				<div class="row">
					<div class="col">
						<br>
						<p style="text-align:left; font-size:20px;">회원 - ${totalCount }</p>
					</div>
					<div class="col-2">
						<br>
						<select class="form-select" id="sortType" name="sort" aria-label="Default select example">
							<option value="all" <c:if test="${memberType eq 'all' }">selected</c:if>>전체</option>
							<option value="general" <c:if test="${memberType eq 'general' }">selected</c:if>>일반 회원</option>
							<option value="kakao" <c:if test="${memberType eq 'kakao' }">selected</c:if>>카카오 회원</option>
						</select>
					</div>
					<hr>
				</div>
			</div>
			<div class="table-responsive">
				<table class="table table-hover" id="memberListTable">
					<tr>
						<th width="150">아이디</th>
						<th width="150">회원 유형</th>
						<th width="150">이름</th>
						<th width="150">닉네임</th>
						<th width="150">이메일</th>
						<th width="350">마이짐</th>
						<th width="120">매너점수</th>
					</tr>
				<c:if test="${!empty mList }">
				<c:forEach items="${mList }" var="member">
					<tr onclick="memberDetail('${member.memberId}')">
						<td>${member.memberId }</td>
						<c:if test="${member.memberType eq 'general'}">
						<td>일반 회원</td>
						</c:if>
						<c:if test="${member.memberType eq 'kakao'}">
						<td>카카오 회원</td>
						</c:if>
						<td>${member.memberName }</td>
						<td>${member.memberNick }</td>
						<td>${member.memberEmail }</td>
						<td>${member.memberJym }</td>
						<td>${member.memberManner }</td>
					</tr>
				</c:forEach>
				</c:if>
				<c:if test="${empty mList }">
					<tr>
						<td colspan="7"><b>데이터가 존재하지 않습니다.</b></td>
					</tr>
				</c:if>
					<tr>
						<td colspan="7">
							<c:if test="${currentPage != 1 }">
								<a href="/admin/${urlVal }.strap?page=${currentPage -1}&searchCondition=${searchCondition}&searchValue=${searchValue}&memberType=${memberType}" class="btn btn-dark">이전</a>
							</c:if>
							<c:forEach var="page" begin="${startNavi }" end="${endNavi }">
								<c:if test="${currentPage eq page }">
									<a class="btn btn-dark">${page }</a>
								</c:if>
								<c:if test="${currentPage ne page }">
									<a href="/admin/${urlVal }.strap?page=${page }&searchCondition=${searchCondition}&searchValue=${searchValue}&memberType=${memberType}" class="btn btn-light">${page }</a>
								</c:if>
							</c:forEach>
							<c:if test="${maxPage > currentPage }">
								<a href="/admin/${urlVal }.strap?page=${currentPage +1}&searchCondition=${searchCondition}&searchValue=${searchValue}&memberType=${memberType}" class="btn btn-dark">다음</a>
							</c:if>
						</td>
					</tr>
					<tr>
						<td colspan="7">
							<form action="/admin/adminMemberSearch.strap" method="get">
								<div align="center">
									<div style="display:inline-block;">
										<select name="searchCondition" class="btn btn-dark">
											<option value="all" <c:if test="${searchCondition eq 'all' }">selected</c:if>>전체</option>
											<option value="memberId" <c:if test="${searchCondition eq 'memberId' }">selected</c:if>>아이디</option>
											<option value="memberNick" <c:if test="${searchCondition eq 'memberNick' }">selected</c:if>>닉네임</option>
										</select>
									</div>
									<div style="display:inline-block;">
										<input style="width:300px; height:33px;" type="text" name="searchValue" id="searchValue" value="${searchValue}">
									</div>	
									<div style="display:inline-block;">
										<input type="submit" value="검색" class="btn btn-dark">
									</div>
								</div>
								<input type="hidden" value="${memberType }" name="memberType">
							</form>
						</td>
					</tr>
				</table>
			</div>
		</div>
<script>
	function memberDetail(memberId){
		var form = document.createElement('form');
		form.setAttribute('method', 'post');
		form.setAttribute('action', '/admin/memberDetail.strap');
		var input = document.createElement('input');
		input.setAttribute('type','hidden');
		input.setAttribute('value',memberId);
		input.setAttribute('name','memberId');
		form.appendChild(input);
		document.body.appendChild(form);
		form.submit();
	}
	$("#sortType").change(function(){
		$("#searchValue").val("");
		if($(this).val() == 'all'){
			location.href="/admin/memberView.strap"
		} else if($(this).val() == "general"){
			location.href="/admin/adminMemberSort.strap?memberType=general"
		} else if($(this).val() == "kakao"){
			location.href="/admin/adminMemberSort.strap?memberType=kakao"
		}
	});
</script>
</body>
</html>
