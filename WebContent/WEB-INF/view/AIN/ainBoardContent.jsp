<%@page import="kr.or.bit.ainboard.dto.AinReply"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.bit.ainboard.dto.AinBoard"%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
	
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

<!-- 폰트 -->
   <link rel="preconnect" href="https://fonts.gstatic.com">
   <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">

<style type="text/css">
 * {
 	font-family: 'Nanum Gothic', sans-serif;
 }
</style>

<%-- <link rel="Stylesheet" href="${pageContext.request.contextPath}/style/default.css" /> --%>
	
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>

<body>
	<c:set var="board" value="${requestScope.board}" />
	<c:set var="cNumber" value="${requestScope.cNumber}" />
	<c:set var="cpage" value="${requestScope.cp}" />
	<c:set var="pagesize" value="${requestScope.ps}" />
	<c:set var="replyList" value="${requestScope.replyList}" />

	<c:import url="/include/header.jsp" />
	
	<div id="pageContainer">
		<div style="padding-top: 30px; text-align: center">
			<center>
				<b>게시판 글내용</b>
				<table width="80%" border="1">
					<tr>
						<td width="20%" align="center"><b>글번호</b></td>
						<td width="30%">${cNumber}</td>
						<td width="20%" align="center"><b>작성일</b></td>
						<td>${board.writedate}</td>
					</tr>
					<tr>
						<td width="20%" align="center"><b>글쓴이</b></td>
						<td width="30%">${board.nickname}</td>
						<td width="20%" align="center"><b>조회수</b></td>
						<td>${board.viewcount}</td>
					</tr>
					<tr>
						<td width="20%" align="center"><b>첨부파일</b></td>
						<td><a href="file.do?file_name=${board.filename}">${board.filename}</a></td>
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
						<td colspan="4" align="center">
							<a href="boardList.ain?cp=${cpage}&ps=${pagesize}">목록가기</a> |
							<a href="boardEdit.ain?cNumber=${cNumber}&cp=${cpage}&ps=${pagesize}">편집</a> |
							<a href="BoardDelete.do?cNumber=${cNumber}&cp=${cpage}&ps=${pagesize}">삭제</a> |
							<a href="boardReWrite.ain?cNumber=${cNumber}&cp=${cpage}&ps=${pagesize}&title=${board.title}">답글</a>
						</td>
					</tr>
				</table>
				<!--  댓글 달기 테이블 -->
				<form name="reply" action="ainReplyOk.do" method="POST">
						<!-- hidden 태그  값을 숨겨서 처리  -->
						<input type="hidden" name="cNumber" value="${cNumber}"> 
						
						<table width="80%" border="1">
							<tr>
								<th colspan="2">덧글 쓰기</th>
							</tr>
							<tr>
								<td align="left">작성자 : 
								 	 
								 	내&nbsp;&nbsp;용 : 
								 	<textarea name="reply_content" rows="2" cols="50"></textarea>
								</td>
								<td align="left">
									비밀번호:
									<input type="password" name="reply_pwd" size="4"> 
									<input type="button" value="등록" onclick="reply_check()">
								</td>
							</tr>
						</table>
				</form>
				<!-- 유효성 체크	 -->
				<%-- <script type="text/javascript" src="${pageContext.request.contextPath}/js/test.js"></script> --%>
				<br>
				
				<!-- 꼬리글 목록 테이블 -->
				<span id="span-reply">
				<c:if test="${not empty replyList}">
					<c:forEach var="reply" items="${replyList}">
						<table width="80%" border="1">
							<tr>
								<th colspan="2">REPLY LIST</th>
							</tr>
							<tr align="left">
								<td width="80%">
								[${reply.nickname}] : ${reply.content}
								<br> 작성일:${reply.writedate}
								</td>
								<td width="20%">
								<form action="ReplyDeleteOk.do" method="POST" name="replyDel">
									<input type="hidden" name="no" value="${reply.crNumber}"> 
									<input type="hidden" name="cNumber" value="${cNumber}"> 
									password :<input type="password" name="delPwd" size="4"> 
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
</body>
</html>