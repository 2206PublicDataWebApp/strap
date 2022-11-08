<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
.note-i-bg{
	background-color:#FFE400;
	border-radius:10px;
	padding:7px;
}
.note-y-bg{
	background-color:#EAEAEA;
	border-radius:10px;
	padding:7px;
}
</style>
<div class="container" >
	<div class="row text-center border border-secondary border-opacity-50">
		<div class="col">
			${senderNick }님과 쪽지 대화
			<div class="note-chat row text-center border border-secondary border-opacity-50 overflow-scroll" style="height:300px" >
				<div class="col">
					대화를 시작해 보세요 ~ <br><br>
						<c:forEach items="${ncList }" var="noteChat" varStatus="i">
							<c:if test="${noteChat.senderId eq memberId }">
								<div align="right" style="padding:10px;">
									<span class="note-i-bg">${noteChat.chatContents } - <fmt:formatDate pattern="yyyy-MM-dd / hh:mm:ss" value="${noteChat.senderDate }"/></span> <br>
								</div>
							</c:if>
							<c:if test="${noteChat.senderId ne memberId }">
								<div align="left" style="padding:5px;"><b>${senderNick }</b></div>
								<div align="left" style="padding:10px;">
									<span class="note-y-bg">${noteChat.chatContents } - <fmt:formatDate pattern="yyyy-MM-dd / hh:mm:ss" value="${noteChat.senderDate }"/></span> <br>
								</div>
							</c:if>
						</c:forEach>
				</div>
			</div>
		</div>
	</div>
</div>

<script>
	$(".note-chat").scrollTop($(".note-chat")[0].scrollHeight); 
// 	setTimeout("location.href = location.href;", 3000);
// 	"/notebox/noteChatView.strap?senderNick="+senderNick+"&recipientId="+recipientId+"&recipientNick="+recipientNick+"&ncList="+ncList+"&memberId="+memberId;
</script>
