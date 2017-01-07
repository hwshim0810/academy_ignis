package ignis.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ignis.biz.MemberBiz;

public class MemberJoinAction implements ActionInterface {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		MemberBiz memBiz = MemberBiz.getInstance();
		ActionForward forward = new ActionForward();
		
		boolean result = memBiz.insert(request, response);
		
		if (result) {
			forward.setRedirect(true);
			forward.setPath("./login");
			return forward;
		}
		
		return null;
	}

}
