package ignis.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MemberJoinPageAction implements ActionInterface {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		
		String page = request.getParameter("page");
		
		if (page.equals("admin")) {
			forward.setRedirect(false);
			forward.setPath("/academy_ignis/admin/ad_memJoin.jsp");
		} else {
			forward.setRedirect(false);
			forward.setPath("/academy_ignis/member/memberJoin.jsp");
		}
		
		return forward;
	}

}
