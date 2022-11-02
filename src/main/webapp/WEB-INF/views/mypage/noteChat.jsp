<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="container" >
	<div class="row text-center border border-secondary border-opacity-50">
		<div class="col">
			${senderNick }님과 쪽지 대화
			<div class="note-chat row text-center border border-secondary border-opacity-50 overflow-scroll" style="height:300px" >
				<div class="col">
					내용
						<c:forEach items="${ncList }" var="noteChat" varStatus="i">
							<c:if test="${noteChat.senderId eq memberId }">
								<p align="right">${noteChat.chatContents } - ${noteChat.senderDate }</p> <br>
							</c:if>
							<c:if test="${noteChat.senderId ne memberId }">
								<div align="left"><b>${senderNick }</b></div>
								<p align="left"><b>${noteChat.chatContents } - ${noteChat.senderDate }</b></p> <br>
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
