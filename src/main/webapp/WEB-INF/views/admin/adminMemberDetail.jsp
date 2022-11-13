<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- CDN -->
<!-- 부트스트랩 -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" />
<!-- jQuery -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- css -->
<link rel="stylesheet" type="text/css" href="/resources/css/common.css">
<style>
	.member th{text-align: center; width: 250px;}
	#memberIntroduce{height: 100px; }
</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/adminHeader.jsp"></jsp:include>
	<div class="container">
		<div class="row" style="margin-top: 20px;">
			<div class="col" style="font-size: 20px;">
				회원 정보 수정/삭제
			</div>
			<div class="col">
				<button onclick="history.go(-1)" class="btn btn-dark" style="float: right;">이전 페이지</button>
			</div>
		</div>
		<hr>
		<div class="row-two">
			<div class="col">
				<form method="post">
					<table class="table member">
						<tr>
							<th>아이디</th>
							<td><input class="form-control" type="text" name="memberId" value="${member.memberId }" readonly></td>
						</tr>
						<tr>
							<th>이름</th>
							<td><input class="form-control" type="text" name="memberName" value="${member.memberName }"></td>
						</tr>
						<tr>
							<th>닉네임</th>
							<td><input class="form-control" type="text" name="memberNick" value="${member.memberNick }"></td>
						</tr>
						<tr>
							<th>이메일</th>
							<td><input class="form-control"  type="text" name="memberEmail" value="${member.memberEmail }"></td>
						</tr>
						<tr>
							<th>성별</th>
							<td>
								<select class="form-control" name="memberGender">
									<option value="M" <c:if test="${member.memberGender eq 'M'}">selected</c:if>>남성</option>
									<option value="F" <c:if test="${member.memberGender eq 'F'}">selected</c:if>>여성</option>
								</select>
							</td>
						</tr>
						<tr>
							<th>매너점수</th>
							<td><input class="form-control" type="text" name="memberManner" value="${member.memberManner }"></td>
						</tr>
						<tr>
							<th>3대</th>
							<td>
								<select class="form-control" name="memberSBD">
									<option value="200"     <c:if test="${member.memberSBD eq '200'}">selected</c:if>>200 이하</option>
									<option value="200~300" <c:if test="${member.memberSBD eq '200~300'}">selected</c:if>>200~300</option>
									<option value="300~350" <c:if test="${member.memberSBD eq '300~350'}">selected</c:if>>300~350</option>
									<option value="350~400" <c:if test="${member.memberSBD eq '350~400'}">selected</c:if>>350~400</option>
									<option value="400~450" <c:if test="${member.memberSBD eq '400~450'}">selected</c:if>>400~450</option>
									<option value="450~500" <c:if test="${member.memberSBD eq '450~500'}">selected</c:if>>450~500</option>
									<option value="500~600" <c:if test="${member.memberSBD eq '500~600'}">selected</c:if>>500~600</option>
									<option value="600"     <c:if test="${member.memberSBD eq '600'}">selected</c:if>>600 이상</option>
								</select>
							</td>
						</tr>
						<tr>
							<th>구력</th>
							<td>
								<select class="form-control" name="memberCareer">
										<option value="1"    <c:if test="${member.memberCareer eq '1'}">selected</c:if>>1년 이하</option>
										<option value="1-2"  <c:if test="${member.memberCareer eq '1-2'}">selected</c:if>>1년~2년</option>
										<option value="2-3"  <c:if test="${member.memberCareer eq '2-3'}">selected</c:if>>2년~3년</option>
										<option value="3-5"  <c:if test="${member.memberCareer eq '3-5'}">selected</c:if>>3년~5년</option>
										<option value="5-10" <c:if test="${member.memberCareer eq '5-10'}">selected</c:if>>5년~10년</option>
										<option value="10"   <c:if test="${member.memberCareer eq '10'}">selected</c:if>>10년 이상</option>
								</select>
							</td>
						</tr>
						<tr>
							<th>마이짐</th>
							<td><input class="form-control" type="text" name="memberJym" value="${member.memberJym }"></td>
						</tr>
						<tr>
							<th>주소</th>
							<td><input class="form-control" type="text" name="memberAddress" value="${member.memberAddress }"></td>
						</tr>
						<tr>
							<th>자기소개</th>
							<td><textarea class="form-control" id="memberIntroduce" name="memberIntroduce">${member.memberIntroduce }</textarea></td>
						</tr>
						<tr>
							<th>회원 유형</th>
							<td><input class="form-control"  type="text" name="memberType" value="${member.memberType }" readonly></td>
						</tr>
						<tr>
							<th>회원가입일</th>
							<td><input class="form-control" type="text" name="mRegisterDate" value="${member.mRegisterDate }" readonly></td>
						</tr>
					</table>
					<div class="btnDiv" style="width: 200px; margin: 0 auto; margin-top: 15px;">
						<button type="submit" class="btn btn-dark" onclick="return memberModify()">수정</button>
						<button type="submit" class="btn btn-dark" onclick="return memberDelete()">삭제</button>
					</div>
				</form>
			</div>
		</div>
	</div>
<script type="text/javascript">
	var memberIntroduce = $("#memberIntroduce").val();
	memberIntroduce = memberIntroduce.replace(/<br>/g,'\n');
	$("#memberIntroduce").val(memberIntroduce);
	
	function memberModify(){
		if(confirm('수정하시겠습니까?')){
			var memberIntroduce = $("#memberIntroduce").val();
			memberIntroduce = memberIntroduce.replace(/(\n|\r\n)/g,'<br>');
			$("#memberIntroduce").val(memberIntroduce);
			$("form").attr("action","/admin/memberModify.strap");
			return true;		
		}else{
			return false;
		}
		
	}
	function memberDelete(){
		if(confirm('정말 삭제하시겠습니까?')){
			$("form").attr("action","/admin/memberDelete.strap");
			return true;
		}else {
			return false;
		}
		
	}
</script>
</body>
</html>