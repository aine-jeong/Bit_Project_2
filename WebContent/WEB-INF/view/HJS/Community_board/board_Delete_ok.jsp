<%@page import="kr.or.bit.communityboard.service.CommunityBoardService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String idx = request.getParameter("c_number");
	
	CommunityBoardService service = CommunityBoardService.getInBoardService();
	int result =service.board_Delete(c_number);
	
	String msg="";
	String url="";
	if(result > 0){
		msg="delete success";
		url="board_list_next.ha";
	}else{
		msg="delete fail";
		url="c_content_edit.ha?c_number="+c_number;
	}
	
	request.setAttribute("board_msg",msg);
	request.setAttribute("board_url",url);
%>
<jsp:forward page="redirect.jsp"></jsp:forward>    