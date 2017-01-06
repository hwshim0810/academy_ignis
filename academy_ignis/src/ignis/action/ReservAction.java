package ignis.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ignis.biz.ReservBiz;

public class ReservAction implements ActionInterface {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		ReservBiz reservBiz = new ReservBiz();
		ActionForward forward = new ActionForward();
		boolean result = reservBiz.insert(request, response);
		if (result) {
			forward.setRedirect(false);
			forward.setPath("./member/myInfo.jsp");
			return forward;
		}
		
		return null;
	}
}
