package ignis.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ignis.biz.ReservBiz;

public class ReservAdminDeleteAction implements ActionInterface {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		
		ReservBiz reservBiz = new ReservBiz();
		ActionForward forward = new ActionForward();
		boolean result = reservBiz.deleteAdmin(request, response);
		if (result) {
			forward.setRedirect(true);
			forward.setPath("./admin/manage_Reserv.jsp");
			return forward;
		}
		
		return null;
	}
}
