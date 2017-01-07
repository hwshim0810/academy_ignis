package ignis.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import ignis.biz.EventBiz;
import ignis.biz.LoginBiz;

public class EventAction implements ActionInterface {
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		
		String login = request.getParameter("login");
		
		if(login.equals("admin")){
			forward.setRedirect(true);
			forward.setPath("/academy_ignis/admin/ad_CommunityEventList.jsp");
			return forward;
		} else if (login.equals("member")){
			forward.setRedirect(true);
			forward.setPath("/academy_ignis/community/event.jsp");
			return forward;
		}
		
		return null;

	}
}
