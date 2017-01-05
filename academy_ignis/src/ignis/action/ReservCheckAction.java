package ignis.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ignis.biz.ReservBiz;

public class ReservCheckAction implements ActionInterface {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		ReservBiz reservBiz = new ReservBiz();
		ActionForward forward = new ActionForward();
		
		boolean result = reservBiz.check(request, response);

		if (result) {
			System.out.println("true라서 들어왔어용!");
			forward.setRedirect(false);
			forward.setPath("./myInfo.jsp");
			return forward;
		}
		
		return null;
	}
}
