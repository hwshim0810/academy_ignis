package ignis.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ignis.biz.LogoutBiz;

public class MemberLogoutAction implements ActionInterface {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		LogoutBiz outBiz = new LogoutBiz();
		ActionForward forward = new ActionForward();
		
		
		outBiz.logOut(request, response);
		forward.setRedirect(true);
		
		if (request.getParameter("id") != null) forward.setPath("./ad_Login.jsp");
		else forward.setPath("/");
		
		return forward;
	}

}
