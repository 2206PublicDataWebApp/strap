<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="row text-center border border-secondary border-opacity-50">
	<div class="col">
		${senderNick }님과 채팅
		<div class="row text-center border border-secondary border-opacity-50" >
			<div class="col">
				내용
					<c:forEach items="${ncList }" var="noteChat" varStatus="i">
						<c:if test="${noteChat.senderId eq memberId }">
							<p align="right">${noteChat.chatContents } - ${noteChat.senderDate }</p> <br>
						</c:if>
						<c:if test="${noteChat.senderId ne memberId }">
							<p align="left">${noteChat.chatContents } - ${noteChat.senderDate }</p> <br>
						</c:if>
					</c:forEach>
			</div>
		</div>
	</div>
</div>

<script>
	setTimeout("location.href='/notebox/noteChatListView.strap?noteNo=${noteNo }'&senderNick=${senderNick }", 3000);
</script>
