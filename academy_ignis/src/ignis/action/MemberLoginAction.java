package ignis.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		System.out.println(userLevel);
		if (userLevel == ADMINLEVEL) {
			forward.setRedirect(false);
			forward.setPath("./admin/ad_Manage.jsp");
			return forward;
		}
		
		return forward;
	}

}
