package ignis.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ignis.biz.EventBiz;

public class EventEditAction implements ActionInterface {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception{
		EventBiz eventBiz = new EventBiz();
		ActionForward forward = new ActionForward();
		int num = Integer.valueOf(request.getParameter("num"));
		boolean result = eventBiz.updateEvent(request, response);
		if(result){
			forward.setRedirect(false);
			forward.setPath("/EventView?num="+num);
			return forward;
		} else {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter outR = response.getWriter();
			outR.println("<script>");
			outR.println("alert('수정실패하였습니다.');");
			outR.println("</script>");
		}
		
		return null;
	}
}