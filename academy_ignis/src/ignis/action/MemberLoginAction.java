package ignis.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import ignis.biz.LoginBiz;

public class MemberLoginAction implements ActionInterface {
	public static final int GUESTLEVEL = 1;
	public static final int MEMBERLEVEL = 2;
	public static final int ADMINLEVEL = 3;
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		LoginBiz loginBiz = new LoginBiz();
		ActionForward forward = new ActionForward();
		int userLevel = loginBiz.getUserLogin(request, response);

		if (userLevel == ADMINLEVEL) {
			HttpSession session = request.getSession();
			session.setAttribute("m_id", request.getParameter("m_id"));
			forward.setRedirect(true);
			forward.setPath("./admin/ad_Manage.jsp");
			return forward;
		}
		
		return forward;
	}

}
