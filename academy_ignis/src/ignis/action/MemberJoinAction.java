package ignis.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ignis.biz.JoinBiz;

public class MemberJoinAction implements ActionInterface {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		JoinBiz joinBiz = new JoinBiz();
		ActionForward forward = new ActionForward();
		
		boolean result = joinBiz.insert(request, response);
		
		if (result) {
			forward.setRedirect(true);
			forward.setPath("/login");
			return forward;
		}
		
		return null;
	}

}
