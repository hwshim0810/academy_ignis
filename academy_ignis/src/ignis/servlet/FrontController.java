package ignis.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ignis.action.ActionForward;
import ignis.action.ActionInterface;
import ignis.action.MemberJoinAction;
import ignis.action.MemberLoginAction;

public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public FrontController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws SecurityException, IOException, ServletException {
		String RequestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = RequestURI.substring(contextPath.length());
		
		ActionForward forward = null;
		ActionInterface action = null;
		
		switch (command) {
		
		case "/error" :
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./error/errorPage.jsp");
			break;
			
		case "/abouts_us":
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./ignisCompany_info/abouts_us.jsp");break;
			
		case "/Introduction_of_medical_staff":
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./ignisCompany_info/Introduction_of_medical_staff.jsp");break;
			
		case "/map_to_the_ignis":
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./ignisCompany_info/map_to_the_ignis.jsp");break;
			
		case "/medical_procedure":
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./ignisCompany_info/medical_procedure.jsp");break;	
			
		case "/notice":
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./community/notice.jsp");break;	
			
		case "/noticeinsert":
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./community/noticeinsert.jsp");break;		
			
		case "/qna":
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./community/qna.jsp");break;	
			
		case "/joinProcess":
			action = new MemberJoinAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			break;
			
		case "/login" :
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./member/login.jsp");
			break;
			
		case "/memberJoin" :
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./member/memberJoin.jsp");
			break;
		case "/loginProcess" :
			action = new MemberLoginAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			break;
//		case "/" :
//			action = new Action();
//			
//			try {
//				forward = action.execute(request, response);
//			} catch (Exception e) {
//				e.printStackTrace();
//			}
//			break;
//		default:
//			break;
		}
		
		
		if (forward != null) {
			if (forward.isRedirect()) {
				response.sendRedirect(forward.getPath());
			} else {
				RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);
			}
		}
		
	}
}
