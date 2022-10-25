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
<!-- <link rel="stylesheet" type="text/css" href="/resources/css/border.css"> -->
<link rel="stylesheet" type="text/css" href="/resources/css/common.css">
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
				${board.memberNick }
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
	         	<form action="/board/updateLike" method="post" style="display: inline">
					<input type="hidden" name="memberNick" value="${sessionScope.loginUser.memberNick }"/>
					<input type="hidden" name="boardNo" value="${board.boardNo }"/>
					<input type="hidden" name="page" value="${page }"/>
	            <button class="btn btn-primary" id="like_btn" type="submit"><i class="fa-solid fa-thumbs-up fa-lg"></i> 추천 <b>${board.boardLikeIt }</b></button>
	            </form>
	            <%-- <form action="/board/updateLike" method="post" style="display: inline">
					<input type="hidden" name="memberNick" value="${sessionScope.loginUser.memberNick }"/>
					<input type="hidden" name="boardNo" value="${board.boardNo }"/>
					<input type="hidden" name="page" value="${page }"/>
	            	<button class="btn btn-danger" id="hate_btn"><i class="fa-solid fa-thumbs-down fa-lg"></i>비추천</button>
	            </form> --%>
            </div>
            <!-- 수정/삭제 -->
            	<div>
						<button onclick="location.href='/board/modifyView.strap?boardNo=${board.boardNo }&page=${page}';" class="btn btn-info">수정</button>
						<button onclick="boardRemove(${page});" class="btn btn-danger">삭제</button>
				</div>
				<div>
						<button onclick="location.href='/board/list.strap?page=${page}'" class="btn btn-primary">목록으로</button>
				</div>
		</div>
	
		<!-- 	댓글 등록 -->
		<table align="center" width="500" border="1">
			<tr>
				<td><textarea rows="3" cols="55" name="replyContents"
						id="replyContents"></textarea></td>
				<td>
					<button id="rSubmit">등록하기</button>
				</td>
			</tr>
		</table>
		<!-- 	댓글 목록 -->
	<table align="center" width="500" border="1" id="rtb">
		<thead>
			<tr>
				<!-- 댓글 갯수 -->
				<td colspan="4"><b id="rCount"></b></td>
			</tr>
		</thead>
		<tbody>
		
		</tbody>
	</table>
	</div>
</div>
</div>
		<!-- 푸터 -->
		<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
<script>
/* $("#like_btn").on("click", function() {
	var boardNo = ${board.boardNo};
	var memberNick = ${member.memberNick}
	$.ajax({
        data : {'boardNo' : boardNo, 'memberNick' : memberNick},
        type : "POST",  
        url : "/board/updateLike",       
        success : function(likeCheck) {
                if(likeCheck == 0){
                	alert(likeCheck+"추천완료.");
                	location.href="/board/boardDetail.strap";
                }
                else if (likeCheck == 1){
                 alert("추천취소");
                	location.reload();
            	}
        }
    });
}); */

function boardRemove(value) {
	event.preventDefault(); // 하이퍼링크 이동 방지
	if(confirm("게시물을 삭제하시겠습니까?")) {
		location.href="/board/remove.strap?page="+value;
	}
}

getListReply();
function getListReply() {
	var boardNo = "${board.boardNo}";
	$.ajax({
		url : "/board/listReply.strap",
		data : {"boardNo" : boardNo},
		type : "get",
		success : function(brList) {
			var $tableBody = $("#rtb tbody");
			$tableBody.html(""); // 내용 초기화 후 append
			$("#rCount").text("댓글 (" + brList.length +")"); // 댓글 카운트
			if(brList != null) {
				for(var i in brList) {
					var $tr = $("<tr>");
					var $memberNick = $("<td width='100'>").text(brList[i].memberNick);
					var $rContent = $("<td>").text(brList[i].replyContents);
					var $rDate = $("<td width='100'>").text(brList[i].rDate);
																													// \" 이스케이프 문자
					var $btnArea = $("<td width='80'>").append("<a href='javascript:void(0);' onclick='modifyView(this,\""+brList[i].replyContents+"\","+brList[i].replyNo+")'>수정</a> ")
													   .append("<a href='javascript:void(0);' onclick='removeReply("+brList[i].replyNo+")'>삭제</a>")
													  // .append("<a href='javascript:void(0);' onclick='removeReply()' id="reCommentBtn">등록</a>");
					$tr.append($memberNick);
					$tr.append($rContent);
					$tr.append($rDate);
					$tr.append($btnArea);
					$tableBody.append($tr);
				}
			}
		},
		error : function() {
			alert("서버 요청 실패");
		}
	});
}	

function removeReply(replyNo) {
		if(confirm("정말 삭제?")) {
		$.ajax({
			url : "/board/deleteReply.strap",
			data : { "replyNo" : replyNo },
			type : "get",
			success : function(data) {
				if(data == "success"){
					getListReply();
				} else {
					alert("댓글 삭제 실패");
				}
			},
			error : function() {
				alert("ajax 통신 오류");
			}
		});	
	}
}

$("#rSubmit").on("click", function() {
	var boardNo = "${board.boardNo}";
	var replyContents = $("#replyContents").val();
	$.ajax({
		url : "/board/addReply.strap",
		type : "post",
		data : {
			"boardNo"	: boardNo,
			"replyContents" : replyContents
		},
		success : function(result) {
			if(result == "success") {
				alert("댓글 등록 성공");
				$("#replyContents").val(""); // 작성 후 내용 초기화
				getListReply(); // 댓글 리스트 출력
			} else {
				alert("댓글 등록 실패");
			}
		},
		error : function() {
			alert("서버 요청 실패");
		}
	});
});


function modifyView(obj, replyContents, replyNo) {
	event.preventDefault();
	var $tr = $("<tr>");
	$tr.append("<td colspan='3'><input type='text' size='50' value='"+replyContents+"'></td>");
	$tr.append("<td><button onclick='modifyReply(this, "+replyNo+");'>수정</button></td>");
	$(obj).parent().parent().after($tr);
}
function modifyReply(obj, rNo) {
	var inputTag = $(obj).parent().prev().children();
	var replyContents = inputTag.val();
	$.ajax({
		url : "/board/modifyReply.strap",
		data : {
			"replyNo" : rNo,
			"replyContents" : replyContents
		},
		type : "post",
		success : function(result) {
			if(result == "success") {
				getListReply();
			} else {
				alert("댓글 수정 실패");
			}
		},
		error : function() {
			alert("서버 요청 실패");
		}
	});
}
</script>
</body>
</html>