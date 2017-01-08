package ignis.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MemberJoinPageAction implements ActionInterface {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		
		String page = request.getParameter("page");
		
		if (page.equals("admin")) {
			forward.setRedirect(true);
			forward.setPath("/academy_ignis/admin/ad_memJoin.jsp");
		} else if (page.equals("home")) {
			forward.setRedirect(true);
			forward.setPath("/academy_ignis/member/memberJoin.jsp");
		}
		
		return forward;
	}

}
