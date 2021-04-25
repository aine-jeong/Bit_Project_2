<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
 
<!-- <link rel="canonical" href="https://getbootstrap.com/docs/5.0/examples/sign-in/">
<link href="css/bootstrap.min.css" rel="stylesheet">
 -->
<link href="css/reqReg.css" rel="stylesheet">
</head>
<body>

	<div class="container">
		<div class="row">
			<div class="span12">
				<section id="typography">
				<div class="page-header">
					<h1>회원가입</h1>
				</div>
				
				<form class="form-horizontal" action="RegisterOk.do" method="post">
					<c:if test="${not empty errorMessage}">
					<div class="control-group">
						<label class="error">${errorMessage}</label>
					</div>
					</c:if>
					
					<div class="control-group">
						<label class="control-label" for="userEmail">이메일 계정</label>
						<div class="controls">
							<input type="text" id="userEmail" name="email" value="" placeholder="이메일 입력" />
							<div class="tdmail"></div>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="nickname">닉네임</label>
						<div class="controls">
							<input type="text" id="nickname" name="nickname" placeholder="닉네임 입력">
							<div class="tdnn"></div>
							
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="password">비밀번호</label>
						<div class="controls">
							<input type="password" id="password" name="password" placeholder="비밀번호 입력">
							<div class="tdpw"></div>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="password">비밀번호 확인</label>
						<div class="controls">
							<input type="password" id="password2" name="password" placeholder="비밀번호 입력">
							<div class="tdpwch"></div>
						</div>
					</div>
					<div class="control-group">
						<div class="controls">
							<button type="submit" class="btn btn-primary">회원가입</button>
							<button type="button" class="btn btn-primary" onclick="location.href='bopage.jsp';">취소</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
<script src="js/reqReg.js"></script>
</html>