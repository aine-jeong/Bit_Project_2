package kr.or.bit.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.ainboard.service.AinContentService;
import kr.or.bit.ainboard.service.AinEditOkService;
import kr.or.bit.ainboard.service.AinEditService;
import kr.or.bit.ainboard.service.AinRewriteService;
import kr.or.bit.ainboard.service.AinBoardListService;
import kr.or.bit.ainboard.service.AinWriteService;

@WebServlet("*.ain")
public class AinController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AinController() {
        super();
    }
    
    protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String requestURI = request.getRequestURI();
    	String contextPath = request.getContextPath();
    	String url_Command = requestURI.substring(contextPath.length());
    	
    	Action action = null;
    	ActionForward forward = null;
    	
    	//게시글 목록보기
    	if(url_Command.equals("/boardList.ain")) { 
    		action = new AinBoardListService();
    		forward = action.execute(request, response);
    	}
    	//게시글 상세보기
    	else if(url_Command.equals("/boardContent.ain")) { 
    		action = new AinContentService();
    		forward = action.execute(request, response);
    	}
    	//글쓰기
    	else if(url_Command.equals("/boardWrite.ain")) {
    		forward = new ActionForward();
    		forward.setRedirect(false);
    		forward.setPath("WEB-INF/view/AIN/ainBoardWrite.jsp");
    	}
    	//글쓰기 처리 (등록)
    	else if(url_Command.equals("/boardWriteOk.ain")) {
    		forward = new AinWriteService().execute(request, response);
    		forward.setPath("WEB-INF/view/redirect.jsp");
    	}
    	//글수정
    	else if(url_Command.equals("/boardEdit.ain")) {
    		action = new AinEditService();
    		forward = action.execute(request, response);
    	}
    	//글수정 처리
    	else if(url_Command.equals("/boardEditOk.ain")) {
    		action = new AinEditOkService();
    		forward = action.execute(request, response);
    	}
    	//답글쓰기
    	else if(url_Command.equals("/boardReWrite.ain")) {
    		action = new AinRewriteService();
    		forward = action.execute(request, response);
    	}
    	
    	
    	if(forward != null) {
    		if(forward.isRedirect()) { //true 
    			response.sendRedirect(forward.getPath());
    		}else { //false (모든 자원 ) 사용
    			//UI
    			//UI + 로직
    			//forward url 주소 변환 없어 View 내용을 받을 수 있다
    			RequestDispatcher dis  = request.getRequestDispatcher(forward.getPath());
    			dis.forward(request, response);
    		}
    	}
    	
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

}
