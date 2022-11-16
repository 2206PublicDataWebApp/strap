<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
<link rel="icon" href="/resources/image/s.png">
<title>스트랩 : 쪽지함</title>
<!-- CDN -->
<!-- 부트스트랩 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" />
<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- css -->
<link rel="stylesheet" type="text/css" href="/resources/css/common.css">

<style>
	.container{
		max-width: 660px;
	}
	.contents-side.col{
		padding-left: 15px;
	}
	.contents-side.col th, .contents-side.col td{
		height: 50px;
	}
	select.select{
		width: 185px;
	}
	#memberJym{
		margin-left: 115px;
	}
	td button{
		width: 200px;
	}
	.change{
		width:  180px;
	}
	span.id, span.pwd, span.pwdCheck, span.nick{
		display:none;
		font-size:12px;
		top:12px;
		right:10px;
	}
	#noteContents:hover{
		color:darkorange;
	}
</style>
</head>
<body>
	<div class="container">
		<div id="essential info">
			<br>
			<div class="row">
				<div class="col">
					<span><h5> 쪽지함 </h5></span>
				</div>
				<div class="col text-end">
					<button class="btn btn-dark" onclick="removeNote();">삭제</button>
				</div>
			</div>
			<hr>
			<table align="center" class="table table-hover border border-secondary border-opacity-50 text-truncate">
				<tr>
				</tr>
				<tr align="center">
					<th><input class="form-check-input" type="checkbox" id="nb-chkbox-all"/></th>
					<th width="50"><label class="form-check-label" for="nb-chkbox-all">번호</label></th>
					<th width="200">내용</th>
					<th width="150">보낸 사람</th>
					<th width="150">보낸 날짜</th>
				</tr>
			<c:if test="${!empty nList }">
				<c:forEach items="${nList }" var="notebox" varStatus="i">
					<tr align="center">
						<td><input class="nb-chk form-check-input" id="nb-chk${i.count }" type="checkbox" value="${notebox.noteNo }"/></th>
						<td><label class="form-check-label" for="nb-chk${i.count }">${i.count }</label></td>
						<td>
							<a id="noteContents" href="#none" onclick="noteDetail('${notebox.noteNo }', '${notebox.recipientId }', '${notebox.senderId }');">
								<c:if test="${not empty notebox.noteContents }">
									<c:if test="${fn:length(notebox.noteContents) > 12}">
										${fn:substring(notebox.noteContents,0,12)}...
									</c:if>
									<c:if test="${fn:length(notebox.noteContents) <= 12}">
										${notebox.noteContents }
									</c:if>
								</c:if>
								<c:if test="${empty notebox.noteContents }">
									매칭 메세지 도착
								</c:if>
							</a>
							<c:if test="${notebox.noteCheck eq 'N' }">
								<span style="float: right;" class="badge text-bg-danger">New</span>
							</c:if>
							<c:if test="${notebox.noteCheck eq 'Y' }">
								<c:forEach items="${map }" var="map">
									<c:if test="${map.CHAT_NO eq notebox.noteNo }">
										<span style="float: right;" class="badge text-bg-danger">
										${map.COUNT }
										</span>
									</c:if> 
								</c:forEach>
							</c:if>
						</td>
						<td>
							<c:if test="${notebox.senderId eq loginUser.memberId }">
								${notebox.recipientNick }
							</c:if>
							<c:if test="${notebox.senderId ne loginUser.memberId }">
								${notebox.senderNick }
							</c:if>
						</td>
						<td><fmt:formatDate pattern="yyyy-MM-dd" value="${notebox.senderDate }"/> </td>
						<c:if test="${notebox.noteAccept eq 'N' }">
						</c:if>
					</tr>
				</c:forEach>
				<tr align="center" height="20">
					<td colspan="5">
						<c:if test="${currentPage != 1 }">
							<a href="/mypage/${urlVal }.strap?page=${currentPage - 1 }&searchCondition=${searchCondition}&searchValue=${searchValue}" class="btn btn-dark">이전</a>
						</c:if>
						<c:forEach var="p" begin="${startNavi }" end="${endNavi }">
							<c:if test="${currentPage eq p }">
								<b class="btn btn-dark">${p }</b>
							</c:if>
							<c:if test="${currentPage ne p }">
								<a href="/mypage/${urlVal }.strap?page=${p }&searchCondition=${searchCondition}&searchValue=${searchValue}" class="btn btn-light">${p }</a>
							</c:if>
						</c:forEach>
						<c:if test="${maxPage > currentPage }">
							<a href="/mypage/${urlVal }.strap?page=${currentPage + 1 }&searchCondition=${searchCondition}&searchValue=${searchValue}" class="btn btn-dark">다음</a>
						</c:if>
					</td>
				</tr>
				<tr>
					<td colspan="5" align="center">
						<form action="/mypage/noteBoxSearch.strap" method="get">
							<div align="center">
								<div style="display:inline-block;">
									<select name="searchCondition" class="btn btn-dark">
										<option value="all" <c:if test="${searchCondition eq 'all' }">selected</c:if>>전체</option>
										<option value="contents" <c:if test="${searchCondition eq 'contents' }">selected</c:if>>내용</option>
										<option value="nickName" <c:if test="${searchCondition eq 'nickName' }">selected</c:if>>닉네임</option>
									</select>
								</div>
								<div style="display:inline-block;">
									<input class="form-control" type="text" name="searchValue" value="${searchValue}">
								</div>	
								<div style="display:inline-block;">
									<input type="submit" value="검색" class="btn btn-dark">
								</div>
							</div>
						</form>
					</td>
				</tr>
			</c:if>
			<c:if test="${empty nList }">
				<tr>
					<td colspan="6" align="center"><b>쪽지가 없습니다</b></td>
				</tr>
			</c:if>
			</table>
		</div>
	</div>
	<script>
		// 체크박스 선택
		$(document).ready(function() {
			$("#nb-chkbox-all").click(function() {
				if($("#nb-chkbox-all").is(":checked")) $(".nb-chk").prop("checked", true);
				else $(".nb-chk").prop("checked", false);
			});
	
			$(".nb-chk").click(function() {
				var total = $(".nb-chk").length;
				var checked = $(".nb-chk:checked").length;
	
				if(total != checked) $("#nb-chkbox-all").prop("checked", false);
				else $("#nb-chkbox-all").prop("checked", true); 
			});
		});
	
		// 쪽지 상세페이지 이동
		function noteDetail(nNo, rId, sId){
			var notePage = "/mypage/noteDetailView.strap?noteNo=" + nNo +"&recipientId=" + rId + "&senderId=" + sId;
			location.href = notePage;
		}
		
		//쪽지 삭제
		function removeNote(){
			var checkedList = new Array();
			$(".nb-chk:checked").each(function(index, item){
				checkedList.push(this.value);
			});
			
			if (checkedList == ''){
				alert("삭제할 쪽지를 선택해주시기 바랍니다.");
			} else {
				if(confirm("다시 복원 할 수 없습니다.\n정말 삭제하시겠습니까?")){
					$.ajax({
						type : "post",
						url : "/mypage/removeNote.strap",
						data:{
							"nbList":checkedList
						},
						success:function(){
							location.reload();
							console.log("삭제 성공!")
						},error:function(request, status, error){
							console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
						}
					});
						
				}
			}
			
		}
	</script>
	
</body>
</html>