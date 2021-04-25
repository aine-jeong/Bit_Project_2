<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>board_content</title>

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
   
   <style type="text/css">
	@font-face {
     font-family: 'S-CoreDream-3Light';
     src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_six@1.2/S-CoreDream-3Light.woff') format('woff');
     font-weight: normal;
     font-style: normal;
	}
	
	*{
	 font-family: 'S-CoreDream-3Light';
	}
	</style>
	
<link rel="Stylesheet" href="${pageContext.request.contextPath}/css/default.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>
	<c:set var="board" value="${requestScope.board}" />
	<c:set var="c_number" value="${requestScope.c_number}" />
	<c:set var="cpage" value="${requestScope.cp}" />
	<c:set var="pagesize" value="${requestScope.ps}" />
	<c:set var="replyList" value="${requestScope.replyList}" />
	

	<jsp:include page="/include/header.jsp"></jsp:include>
	<div id="pageContainer">
		<div style="padding-top: 30px; text-align: center">
			<center>
				<b>선희 커뮤니티</b>
				<table width="80%" border="1">
					<tr>
						<td width="20%" align="center"><b> 글번호 </b></td>
						<td width="30%">${c_number}</td>
						<td width="20%" align="center"><b>작성일</b></td>
						<td>${board.writedate}</td>
					</tr>
					<tr>
						<td width="20%" align="center"><b>글쓴이</b></td>
						<td width="30%">${board.nickname}</td>
						<td width="20%" align="center" name="viewcount"><b>조회수</b></td>
						<td>${board.viewcount}</td>
					</tr>
					<tr>
						<td width="20%" align="center"><b>첨부파일</b></td>
						<td><a href="file.sun?file_name=${board.filename}">${board.filename}</a></td>
					</tr>
					<tr>
						<td width="20%" align="center"><b>제목</b></td>
						<td colspan="3">${board.title}</td>
					</tr>
					<tr height="100">
						<td width="20%" align="center"><b>글내용</b></td>
						<td colspan="3">${fn:replace(board.content, newLineChar,"<br>")}</td>
					</tr>
					<tr>
						<td colspan="4" align="center"><a
							href="boardList.sun?cp=${cpage}&ps=${pagesize}">목록가기</a> |
							
							<a href="boardEdit.sun?c_number=${c_number}&cp=${cpage}&ps=${pagesize}">편집</a> |
							<a href="boardDelete.sun?c_number=${c_number}&cp=${cpage}&ps=${pagesize}">삭제</a>
							|<a href="boardRewrite.sun?c_number=${c_number}&cp=${cpage}&ps=${pagesize}&title=${board.title}">답글</a>
						</td>
					</tr>
				</table>
				<script type="text/javascript" src="${pageContext.request.contextPath}/js/test.js"></script>
				<br>
				<!--  꼬리글 달기 테이블 -->
				<form name="reply" action="ReplyOk.sun" method="POST">
						<!-- hidden 태그  값을 숨겨서 처리  -->
						<input type="hidden" name="c_number" value="${c_number}"> 
						<input type="hidden" name="nickname" value="${nickname}"><!-- 추후 필요에 따라  -->
						<!-- hidden data -->
						<table width="80%" border="1">
							<tr>
								<th colspan="3" >댓글</th>
							</tr>
							<tr>
								<td width="20%" align="left">작성자 :
								 	<input type="text" name="nickname" value="${nickname}" style="border:none" readonly><br /> 
								 	</td>
								 <td width="60%" align="left">
								 	<textarea id="replyContent" name="reply_content" rows="2" cols="90" style="border:none"></textarea></td>
								 <td width="20%" align="center">	
								 	<input type="button" value="등록" onclick="reply_check()">
								</td>
							</tr>
						</table>
				</form>
				<!-- 유효성 체크	
				<script type="text/javascript" src="${pageContext.request.contextPath}/js/test.js"></script> -->
				<br>
				<!-- 꼬리글 목록 테이블 -->
				<span id="span-reply">
				<c:if test="${not empty replyList}">
					<c:forEach var="reply" items="${replyList}">
						<table width="80%" border="1" class="replysun">
							<tr>
								<th colspan="2">REPLY LIST</th>
							</tr>
							<tr align="left">
								<td width="80%">
								[${reply.nickname}] : ${reply.content}
								<br> 작성일:${reply.writedate}
								</td>
								<td width="20%" align="center">
								<form action="ReplyDeleteOk.sun" method="POST" name="replyDel">
									<input type="hidden" name="cr_number" value="${reply.cr_number}"> 
									<input type="hidden" name="c_number" value="${c_number}"> 
									<input type="button" value="삭제" onclick="reply_del(this.form)">
								</form>
								</td>
							</tr>
						</table>
					</c:forEach>
				</c:if>
				</span>
			</center>
		</div>
	</div>
	<jsp:include page="/include/footer.jsp"></jsp:include>
</body>
</html>





