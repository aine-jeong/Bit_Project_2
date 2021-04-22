package kr.or.bit.member.service;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.member.dao.MemberDao;
import kr.or.bit.member.dto.MemberDto;
public class InfoEditOkService implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		/*
		 * HttpSession session = request.getSession();
			session.setAttribute("ID", "abcd");
		 * - 세션 생성
			HttpSession session = request.getSession();
			session.setAttribute("ID", "abcd");
		   - 세션 정보
			HttpSession session = request.getSession();
			String str = (String) session.getAttribute("ID");
		   - 세션 종료
			session.invalidate();
 */
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String nickname = request.getParameter("nickname");
		MemberDto memberdto = new MemberDto(email, password, nickname);
		System.out.println("회원수정 여기까지 오나?(InfoEditOkService 43번째줄)");
		try {
			MemberDao memberdao = new MemberDao();
			boolean result = memberdao.editInfo(memberdto);
			String msg = "";
			String url = "";
			if(result == true){
				url = "/InfoEditOk.do";
				HttpSession session =  request.getSession();
				session.setAttribute("nickname", nickname);
				session.setAttribute("password", password);
				session.setAttribute("email", email);
			}else {
				msg = "회원이 아닙니다. 로그인 해주세요.";
				url = "/Login.do";
			}
			request.setAttribute("msg", msg);
			request.setAttribute("url", url);
			forward.setRedirect(false);
			forward.setPath("/WEB-INF/view/myInfoOk.jsp");
		} catch (Exception e) {
			System.out.println("정보수정 에러 : "+ e.getMessage());
		}
		return forward;
	}
}