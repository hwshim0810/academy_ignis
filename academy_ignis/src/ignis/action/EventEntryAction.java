package ignis.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class EventEntryAction implements ActionInterface {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter outR = response.getWriter();
		outR.println("<script>");
		outR.println("alert('이벤트에 응모되었습니다!');");
		outR.println("location.href='/academy_ignis/Event?login=member';");
		outR.println("</script>");
		outR.close();
		
		return null;
	}
}
