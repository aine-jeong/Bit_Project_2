package kr.or.bit.member.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.member.dao.MemberDao;
import kr.or.bit.member.dto.MemberDto;

public class LoginOkService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		
		ActionForward forward = new ActionForward();
		
		
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		MemberDto result = null;
		
		MemberDto memberdto = new MemberDto();
		
		memberdto.setEmail(email);
		memberdto.setPassword(password);
		
		System.out.println("로그인 여기까지오나?(LoginOkService 30번째줄)");
		
		try {
			MemberDao memberdao = new MemberDao();
			
			result = memberdao.loginMember(memberdto);
			request.getSession().setAttribute("user", result);
			String msg = "";
			String url = "";
			
			if(result != null){
				
				msg = "로그인!";
				url = "/JYP_PROJECT/bopage.jsp";
				
				HttpSession session =  request.getSession();
				session.setAttribute("email", email);
				
			}else {
				msg = "로그인 실패, 다시 시도해주세요.";
				url = "/JYP_PROJECT/Login.do";
			}
			
			request.setAttribute("msg", msg);
			request.setAttribute("url", url);
			
			/*
			 * HttpSession session = request.getSession(); String id = (String)
			 * session.getAttribute("email"); System.out.println(id);
			 */
					
			forward.setRedirect(false);
			forward.setPath("/WEB-INF/view/redirect.jsp");
			
		} catch (Exception e) {
			System.out.println("로그인 에러 : "+ e.getMessage());
		}
		
		return forward;
	}

}
