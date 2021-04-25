<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<!--  
<link rel="canonical" href="https://getbootstrap.com/docs/5.0/examples/sign-in/">
<link href="../assets/dist/css/bootstrap.min.css" rel="stylesheet">
-->
<!-- CSS here -->
	<link rel="stylesheet" href="assets/css/bootstrap.min.css">
	<link rel="stylesheet" href="assets/css/owl.carousel.min.css">
	<link rel="stylesheet" href="assets/css/gijgo.css">
	<link rel="stylesheet" href="assets/css/slicknav.css">
	<link rel="stylesheet" href="assets/css/animate.min.css">
	<link rel="stylesheet" href="assets/css/magnific-popup.css">
	<link rel="stylesheet" href="assets/css/fontawesome-all.min.css">
	<link rel="stylesheet" href="assets/css/themify-icons.css">
	<link rel="stylesheet" href="assets/css/slick.css">
	<link rel="stylesheet" href="assets/css/nice-select.css">
	<link rel="stylesheet" href="assets/css/style.css">
	<link rel="stylesheet" href="assets/css/responsive.css">
	<!-- include libraries(jQuery, bootstrap) -->
	<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<!--  -->
<link rel="stylesheet" href="css/bopage.css">
<!-- <link href="shp/bootstrap.css" rel="stylesheet"> -->
<!-- <link href="shp/bootstrap-responsive.css" rel="stylesheet"> -->
<!-- <link href="shp/docs.css" rel="stylesheet"> -->
<!-- <link href="shp/main.css" rel="stylesheet"> -->

<link href="css/reqReg.css" rel="stylesheet">
</head>
<body>
<header>
<jsp:include page="/include/header.jsp"></jsp:include>
</header>	
<div class="dining-area dining-padding-top">
		</div>
	<div class="container">
		<div class="row">
			<div class="span12">
				<section id="typography">
				<div class="page-header">
					<h1>로그인</h1>
				</div>
				<form class="form-horizontal" action="LoginOk.do" method="post">
					<c:if test="${not empty errorMessage}">
					<div class="control-group">
						<label class="error">${errorMessage}</label>
					</div>
					</c:if>
					<div class="control-group">
						<label class="control-label" for="userEmail">이메일 계정</label>
						<div class="controls">
							<input type="text" id="email" name="email" value="" placeholder="이메일 입력" />
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="password">비밀번호</label>
						<div class="controls">
							<input type="password" id="password" name="password" placeholder="비밀번호 입력">
							<div class="loginch"></div>
						</div>
					</div>
					<div class="tdlogin"></div>
					<div class="control-group">
						<div class="controls">
							<button type="submit" class="btn btn-primary">로그인</button>
							<a type="button" href="access_terms.do" class="btn btn-primary">회원가입</a>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
		<div class="dining-area dining-padding-top">
		</div>
		
	<footer>
	<jsp:include page="/include/footer.jsp"></jsp:include>
	</footer>
</body>
<script src="js/reqReg.js"></script>
</html>