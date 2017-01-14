package ignis.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ignis.biz.EventBiz;
import ignis.dao.EventDAO;

public class EventDeleteAction implements ActionInterface {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception{
		EventBiz eventBiz = new EventBiz();
		EventDAO eventDao = new EventDAO();
		
		int pageNo = Integer.valueOf(request.getParameter("pageNo"));
		int num = Integer.valueOf(request.getParameter("num"));
		int entryCount = eventDao.eventEntryCount(num);
		
		if(entryCount > 0) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter outR = response.getWriter();
			outR.println("<script>");
			outR.println("alert('응모내역이 있는 경우 삭제할 수 없습니다');");
			outR.println("location.href='/academy_ignis/EventView?login=admin&pageNo=" + pageNo + "&num=" + num + "';");
			outR.println("</script>");
			outR.close();
			return null;
		} else {
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
}