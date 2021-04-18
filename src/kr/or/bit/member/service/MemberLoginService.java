package kr.or.bit.member.service;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.bit.member.dto.Member;

/**
 * Servlet implementation class MemberLoginService
 */
@WebServlet(description = "로그인 처리", urlPatterns = { "*.login" })
public class MemberLoginService extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberLoginService() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String url = request.getRequestURI().substring(request.getContextPath().length());
    	
    	System.out.println(url);
    	
    	HttpSession session = request.getSession();
    	
    	/***********테스트 코드***************/
    	// admin login
//    	Member admin = new Member();
//    	admin.setEmail("admin");
//    	admin.setPassword("1004");
//    	admin.setDivision("0");
//    	admin.setNickname("관리자");
//    	session.setAttribute("user", admin);
    	
    	// testUser
    	Member user = new Member();
    	user.setEmail("testUser");
    	user.setPassword("1004");
    	user.setDivision("1");
    	user.setNickname("테스트유저");
    	session.setAttribute("user", user);
    	/***********테스트 코드***************/
    	
    	RequestDispatcher dis = request.getRequestDispatcher("/WEB-INF/view/main.jsp");
    	dis.forward(request, response);
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

}
