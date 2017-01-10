package ignis.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ignis.biz.ReservBiz;

public class ReservDeleteAction implements ActionInterface {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		
		ReservBiz reservBiz = new ReservBiz();
		ActionForward forward = new ActionForward();
		String pageNo = request.getParameter("pageNo");
		
		boolean result = reservBiz.delete(request, response);
		if (result) {
			forward.setRedirect(false);
			forward.setPath("./reserv/reservDetail.jsp?pageNo="+pageNo);
			return forward;
		}
		
		return null;
	}
}