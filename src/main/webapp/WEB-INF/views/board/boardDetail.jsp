<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 상세 정보</title>
<!-- 부트스트랩 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css"/>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
<script src="https://kit.fontawesome.com/422d96f707.js" crossorigin="anonymous"></script>
<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="/resources/js/jquery-3.6.1.min.js"></script>
<!-- css -->
<link rel="stylesheet" type="text/css" href="/resources/css/border.css">
</head>
<body>
<div class="wrap container">
		<!-- 헤더&메뉴바 -->
		<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
		<!-- 컨텐츠 -->
		<div class="contents">
			<div id="contents-wrap">
		<!-- 작성자/조회수 -->
		<div class="position-relative" style="margin-bottom: 25px;">			
				${board.memberId }
			<div class="position-absolute top-0 end-0">
				조회수 ${board.boardCount }		
			</div>
		</div>
		<!-- 카테고리/제목/신고 -->
		<div class="position-relative">
			<div class="border border-success p-2 border-opacity-10" 
	     		 style="padding: 1rem!important; width: 850px; margin-bottom: 15px;">
					[${board.boardCategory }]
					${board.boardTitle }
			</div>
			<div class="position-absolute top-0 end-0">
				<button type="button" class="btn btn-danger">신고</button>
			</div>
		</div>
		<!-- 내용 -->
		<div class="border border-success p-2 border-opacity-10" style="padding: 1rem!important;">
			${board.boardContents }
		</div>
		<!-- 추천/비추천 -->
		<div class="col-md-11 offset-md-5 py-5 text-center">
			<div style="float: left;">
	         	<form action="/board/boardGood.strap" method="post" style="display: inline">
					<input type="hidden" name="memberId" value="${sessionScope.loginUser.memberId }"/>
					<input type="hidden" name="boardNo" value="${board.boardNo }"/>
					<input type="hidden" name="page" value="${page }"/>
	            <button class="btn btn-primary"onclick="return check('${record}');"><i class="fa-solid fa-thumbs-up fa-lg"></i> 추천 <b>${boardGood }</b></button>
	            </form>
	            <form action="/finish/boardBad.strap" method="post" style="display: inline">
					<input type="hidden" name="memberId" value="${sessionScope.loginUser.memberId }"/>
					<input type="hidden" name="boardNo" value="${board.boardNo }"/>
					<input type="hidden" name="page" value="${page }"/>
	            <button class="btn btn-danger" onclick="return check('${record}');"><i class="fa-solid fa-thumbs-down fa-lg"></i> 비추천 <b>${boardBad } </b></button>
	            </form>
            </div>
            <!-- 수정/삭제 -->
            <div>
				<button type="button" class="btn btn-primary" onclick="location.href='/board/modifyView.strap?boardNo=${board.boardNo }&page=${page}'">수정</button>
				<button type="button" class="btn btn-success" onclick="boardRemove(${page});">삭제</button>	
			</div>
		</div>
	<!-- 댓글 등록 -->
	<div>
		<form action="/board/addReply.kh" method="post">
			<input type="hidden" name="page" value="${page }">
			<input type="hidden" name="refBoardNo" value="${board.boardNo }">
			<table align="center" width="500" border="1">
				<tr>
					<td>
						<textarea rows="3" cols="55" name="replyContents"></textarea>
					</td>
					<td>
						<input type="submit" value="등록하기">
					</td>
				</tr>
			</table>
		</form>
		<!-- 	댓글 목록 -->
		<table align="center" width="500" border="1">
			<c:forEach items="${rList }" var="reply">
				<tr>
					<td width="100">${reply.replyWriter }</td>
					<td>${reply.replyContents }</td>
					<td>${reply.rUpdateDate }</td>
					<td>
						<a href="#" onclick="modifyView(this,'${reply.replyContents }', ${reply.replyNo });">수정</a> 
						<a href="#" onclick="removeReply(${reply.replyNo });">삭제</a>
					</td>
				</tr>
	<!-- 			<tr> -->
	<%-- 				<td colspan="3"><input type="text" size="50" value="${reply.replyContents }"></td> --%>
	<!-- 				<td><button>수정</button></td> -->
	<!-- 			</tr> -->
			</c:forEach>
		</table>
	</div>
			</div>
		</div>
		<!-- 푸터 -->
		<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	<script>
		function check(record){
			const yes='Y'
			if(record==yes){
				alert("이미 추천 또는 비추천한 게시글입니다.");
				return false;
			}
			else{
				return true;
			}
		}'';;''
	
		function boardRemove(value) {
			event.preventDefault(); // 하이퍼링크 이동 방지
			if(confirm("게시물을 삭제하시겠습니까?")) {
				location.href="/board/remove.strap?page="+value;
			}
		}
		function removeReply(replyNo) {
			event.preventDefault();
			if(confirm("정말 삭제하시겠습니까?")) {
				var $delForm = $("<form>");
				$delForm.attr("action", "/board/removeReply.kh");
				$delForm.attr("method", "post");
				$delForm.append("<input type='hidden' name='replyNo' value='"+replyNo+"'>");
				$delForm.appendTo("body");
				$delForm.submit();
			}
		}
		function modifyView(obj, replyContents, replyNo) {
			event.preventDefault();
			var $tr = $("<tr>");
			$tr.append("<td colspan='3'><input type='text' size='50' value='"+replyContents+"'></td>");
			$tr.append("<td><button onclick='modifyReply(this, "+replyNo+");'>수정</button></td>");
			//console.log($tr[0]);
			//console.log(obj); // obj는 this를 통해 이벤트가 발생한 태그
			$(obj).parent().parent().after($tr);
		}
		function modifyReply(obj, rNo) {
			var inputTag = $(obj).parent().prev().children();
			console.log(inputTag.val());
			var replyContents = inputTag.val(); //= $("#modifyInput").val();
			//console.log(replyContents);
			//console.log(rNo);
			// <form action="" method=""></form>
			var $form = $("<form>");
			$form.attr("action", "/board/modifyReply.kh");
			$form.attr("method", "post");
			$form.append("<input type='hidden' value='"+replyContents+"' name='replyContents'>");
			$form.append("<input type='hidden' value='"+rNo+"' name='replyNo'>");
			console.log($form[0]);
			$form.appendTo("body");
			$form.submit();
		}
	</script>
</body>
</html>