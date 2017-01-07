package ignis.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ignis.action.*;


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
		System.out.println("command:"+command);
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
			forward.setPath("./ignisCompany_info/abouts_us.jsp");
			break;
			
		case "/Introduction_of_medical_staff":
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./ignisCompany_info/Introduction_of_medical_staff.jsp");
			break;
			
		case "/map_to_the_ignis":
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./ignisCompany_info/map_to_the_ignis.jsp");
			break;
			
		case "/medical_procedure":
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./ignisCompany_info/medical_procedure.jsp");
			break;	
			
		case "/notice":
			action = new NoticeSelectAllAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			break;	
			
		case "/noticeinsert":
			action = new NoticeInsertAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			break;		
			
		case "/noticeDetail":
			action = new NoticeDetailAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			break;	
			
		case "/searchList":
			action = new NoticeSearchAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			break;	
			
		case "/qna":
			action = new QnaSelectAllAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			break;	
			
		case "/qnaDetail":
			action = new QnaDetailAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			break;
			
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

		case "/reserv" :
			action = new ReservBeforeAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			break;
		case "/reservProcess" :
			action = new ReservAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			break;
			
		case "/reservCheckProcess" :
			action = new ReservCheckAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			break;
			
		
			
		/* 예약 수정 부분 잠시만 가릴게요
		case "/updateReserv" :
			System.out.println("여기찍혔다.");
			action = new ReservUpdateAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			break;	
		*/
			
		case "/logout" :
			action = new MemberLogoutAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			break;
			
		case "/findProcess" : 
			action = new MemberFindAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			break;
			
		case "/searchUser" :
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./member/findUser.jsp");
			break;
			
		case "/member" :
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./admin/manage_Member.jsp");
			break;
			
		case "/myPage" :
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./member/myPage.jsp");
			break;
			
		case "/adMyPage" :
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./admin/ad_mypage.jsp");
			break;
			
		case "/memUpProcess" :
			action = new MemberUpdateAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			break;
			
		case "/Event" :
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./admin/ad_CommunityEventList.jsp");
			break;
			
		case "/EventWrite":
			action = new EventWriteAction();
			System.out.println("EventWrite_FrontController");
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			break;
		case "/EventView":
			action = new EventViewAction();
			System.out.println("EventViewAction _FrontController");
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			break;

		case "/EventEditView":
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./admin/ad_CommunityEventEdit.jsp");
			break;
		case "/EventEdit":
			action = new EventEditAction();
			System.out.println("EventEdit_FrontController");
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			break;
		case "/EventDelete":
			action = new EventDeleteAction();
			System.out.println("EventDeleteAction_FrontController");
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
		default:
			System.out.println("Unexpected command: " + RequestURI);
			break;
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
