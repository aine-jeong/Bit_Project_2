package kr.or.bit.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;

import kr.or.bit.action.ActionForward;
import kr.or.bit.member.dto.MemberDto;

/**
 * Servlet Filter implementation class CheckLogin
 */
@WebFilter(description = "등록된 url 패턴은 로그인 상태에서 이용이 가능한 서비스다.", urlPatterns = {"*.qna"})
public class CheckLogin implements Filter {

    
    public CheckLogin() {}

	
	public void destroy() {}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		// place your code here
		
		ActionForward forward = new ActionForward();
		
		HttpServletRequest httpreq = (HttpServletRequest) request;
		
		MemberDto user = (MemberDto) httpreq.getSession().getAttribute("user");

		if (user == null) {
			request.setAttribute("url", httpreq.getContextPath() + "/Login.do");
			request.setAttribute("msg", "로그인 후에 이용이 가능한 서비스입니다.");
			forward.setPath("WEB-INF/view/redirect.jsp");
			RequestDispatcher dis = httpreq.getRequestDispatcher(forward.getPath());
			dis.forward(request, response);
		}
		
		// pass the request along the filter chain
		chain.doFilter(request, response);
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		System.out.println("Filter init : login");
	}

}
