package ignis.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ignis.biz.EventBiz;

public class EventDeleteAction implements ActionInterface {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception{
		EventBiz eventBiz = new EventBiz();
		ActionForward forward = new ActionForward();
		int num = Integer.valueOf(request.getParameter("num"));
		boolean result = eventBiz.deleteEvent(request, response);
		if(result){
			
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter outR = response.getWriter();
			outR.println("<script>");
			outR.println("alert('삭제되었습니다.');");
			outR.println("location.href='/academy_ignis/Event?login=admin';");
			outR.println("</script>");
			outR.close();
			return null;
		} else {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter outR = response.getWriter();
			outR.println("<script>");
			outR.println("alert('삭제실패하였습니다.');");
			outR.println("</script>");
			outR.close();
			return null;
		}
		
	}
}