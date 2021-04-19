package kr.or.bit.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sun.corba.se.spi.orbutil.fsm.Action;

import kr.or.bit.action.ActionForward;
import kr.or.bit.cartlist.service.MyTourListService;
import kr.or.bit.cartlist.service.TourListService;

@WebServlet("*.tourlist")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public FrontController() {
		super();
	}

	protected void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String url = request.getRequestURI().substring(request.getContextPath().length());

		System.out.println(url);

		ActionForward forward = null;

		if (url.equals("/tourList.tourlist")) {
			forward = new TourListService().execute(request, response);
			forward.setRedirect(false);
			forward.setPath("WEB-INF/view/tourList.jsp");
		}else if (url.equals("/mytourList.tourlist")) {
			forward = new MyTourListService().execute(request, response);
			forward.setRedirect(false);
			forward.setPath("WEB-INF/view/myTourList.jsp");
		}

		if (forward != null) {

			if (!forward.isRedirect()) {
				RequestDispatcher dis = request.getRequestDispatcher(forward.getPath());
				dis.forward(request, response);
			}

		}

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

}
