<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판 글쓰기</title>
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

<!-- 폰트 -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap"
	rel="stylesheet">

<style type="text/css">
* {
	font-family: 'Nanum Gothic', sans-serif;
}
</style>
<%-- <link rel="Stylesheet" href="${pageContext.request.contextPath}/style/default.css" /> --%>

<!-- include libraries(jQuery, bootstrap) -->
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- include summernote css/js -->
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>

<script>
    $(document).ready(function() {
        $('#summernote').summernote();
    });
  	</script>

<SCRIPT type="text/javascript">
		function editCheck(){
		    if(!edit.title.value){
		        alert("제목을 입력하세요");
		        edit.subject.focus();
		        return false;
		    }
		    if(!edit.content.value){            
		        alert("글 내용을 입력하세요");
		        edit.content.focus();
		        return false;
		    }
		 
		    document.edit.submit();
 
}
</SCRIPT>
</head>
<body>
	<c:import url="/include/header.jsp" />

	<c:set var="cNumber" value="${requestScope.cNumber}" />
	<c:set var="board" value="${requestScope.board}" />

	<div id="pageContainer">
		<div style="padding-top: 25px; text-align: center">
			<!-- form 시작 ---------->
			<form name="edit" action="boardEditOk.ain" method="POST"
				enctype="multipart/form-data">
				<table width="95%" border="2" align="center">
					<tr>
						<td width="20%" align="center"><b> 글번호 </b></td>
						<td width="30%">${cNumber} 
						<input type="hidden" name="cNumber" value="${cNumber}"></td>
					</tr>
					<tr>
						<td width="20%" align="center"><b>글쓴이</b></td>
						<td width="30%">
							<input type="text" name="nickname" value="${board.nickname}" readonly>
						</td>
					<tr>
						<td width="20%" align="center">제목</td>
						<td width="80%" align="left">
							<input type="text" name="title" size="40" value="${board.title}">
						</td>
					</tr>
					<tr>
						<td width="20%" align="center">글내용</td>
						<td width="80%" align="left">
						<textarea rows="10" cols="60" name="content" id="summernote" > ${board.content} </textarea></td>
					</tr>
					<tr>
						<td width="20%" align="center">첨부파일</td>
						<td width="80%" align="left">
							<input type="text" name="filename" value="${board.filename}" readonly>
						</td>
					</tr>
					<tr>
						<td colspan="2" align="center">
							<input type="button" value="수정하기" onclick="editCheck();" /> 
							<input type="reset" value="다시쓰기" />
						</td>
					</tr>
				</table>
			</form>

		</div>
	</div>
</body>
</html>