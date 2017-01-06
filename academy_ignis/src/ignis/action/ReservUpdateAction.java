package ignis.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ignis.biz.ReservBiz;

public class ReservUpdateAction implements ActionInterface {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		ReservBiz reservBiz = new ReservBiz();
		ActionForward forward = new ActionForward();
		boolean result = reservBiz.update(request, response);
		System.out.println(result + "는 result값입니다.");
		if (result) {
			forward.setRedirect(false);
			forward.setPath("./reserv/reservUpdate.jsp");
			return forward;
		}else {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter outR = response.getWriter();
			outR.println("<script>");
			outR.println("alert('수정실패하였습니다.');");
			outR.println("</script>");
		}
		
		
		return null;
	}
}