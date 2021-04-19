<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%=session.getAttribute("user") %>
	<a href="${pageContext.request.contextPath}/tourList.tourlist">tourList.jsp</a>
	<a href="${pageContext.request.contextPath}/mytourList.tourlist">mytourList.jsp</a>
	
</body>
</html>