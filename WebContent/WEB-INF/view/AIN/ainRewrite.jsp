<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

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
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">

<style type="text/css">
* {
	font-family: 'Nanum Gothic', sans-serif;
}
</style>

<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>

<script>
    $(document).ready(function() {
        $('#summernote').summernote();
    });
</script>

<title>답글쓰기페이지(아인)</title>
<link rel="shortcut icon" type="image/x-icon" href="/assets/img/favicon.ico">

<%-- <link rel="Stylesheet" href="${pageContext.request.contextPath}/style/default.css" /> --%>

<SCRIPT type="text/javascript">
		function check(){
		    if(!bbs.title.value){
		        alert("제목을 입력하세요");
		        bbs.subject.focus();
		        return false;
		    }
		    if(!bbs.content.value){            
		        alert("글 내용을 입력하세요");
		        bbs.content.focus();
		        return false;
		    }
		    document.bbs.submit();
}
</SCRIPT>
</head>
<body>
	<c:import url="/include/header.jsp" />

	<c:set var="cNumber" value="${requestScope.cNumber}" />
	<c:set var="cpage" value="${requestScope.cp}" />
	<c:set var="pagesize" value="${requestScope.ps}" />
	<c:set var="title" value="${requestScope.title}" />

	<div id="pageContainer">
		<div style="padding-top: 25px; text-align: center">
			<form name="bbs" action="AinRewriteOk.do" method="POST">

				<input type="hidden" name="cp" value="${cpage}" /> 
				<input type="hidden" name="ps" value="${pagesize}" /> 
				<input type="hidden" name="cNumber" value="${cNumber}" />

				<table width="95%" border="2" align="center">
					<tr>
						<td width="20%" align="center">제목</td>
						<td width="80%" align="left">
						<input type="text" name="subject" size="40" value="RE_${title}"></td>
					</tr>
					<tr>
                        <td width="20%" align="center">글내용</td>
                        <td width="80%" align="left">
                        	<textarea rows="10" cols="60" name="content" id="summernote"></textarea>
                        </td>
                    </tr>
                    <tr>
                        <td width="20%" align="center">첨부파일</td>
                        <td width="80%" align="left"><input type="file" name="filename"></td>
                    </tr>
					<tr>
						<td colspan="2" align="center">
							<input type="button" value="글쓰기" onclick="check();" /> 
							<input type="reset" value="다시쓰기" /> 
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
</html>

