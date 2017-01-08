package ignis.action;


import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import ignis.biz.NoticeBiz;

public class QnaInsertViewAction implements ActionInterface {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ActionForward forward = new ActionForward();
		
		
		HttpSession session = request.getSession();
		if(session.getAttribute("m_id")!=null){
		forward.setRedirect(false);
		forward.setPath("./community/qnaInsertView.jsp");
		return forward;
		}
		else{
			forward.setRedirect(false);
			forward.setPath("./member/login.jsp");
			System.out.println("return전");
			return forward;
		}
		
		

	}

}
