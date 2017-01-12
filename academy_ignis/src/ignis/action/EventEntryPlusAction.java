package ignis.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ignis.biz.EventBiz;

public class EventEntryPlusAction implements ActionInterface {
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception{
		EventBiz eventBiz = new EventBiz();
		
		boolean result = eventBiz.isCanEntry(request, response);
		
		
		if (result) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out1 = response.getWriter();
			out1.println("<script>");
			out1.println("alert('이벤트에 응모되었습니다!');");
			out1.println("location.href='/academy_ignis/Event?login=member';");
			out1.println("</script>");
			out1.close();
		} else {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out1 = response.getWriter();
			out1.println("<script>");
			out1.println("alert('이벤트 응모인원이 가득 찼습니다.');");
			out1.println("location.href='/academy_ignis/Event?login=member';");
			out1.println("</script>");
			out1.close();
		}
		
		return null;
	}
}
