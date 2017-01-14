package ignis.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ignis.biz.EventBiz;
import ignis.biz.ReviewBiz;


public class myEventCancleAction implements ActionInterface {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception{
		EventBiz eventBiz = new EventBiz();
		
		
		String login = request.getParameter("login");
		String pageNo = "1";
		int num = Integer.valueOf(request.getParameter("num"));
		boolean result = eventBiz.deleteMyEvent(request, response);
		if(result){
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter outR = response.getWriter();
			outR.println("<script>");
			outR.println("alert('삭제되었습니다.');");
			if(login.equals("admin")){
				outR.println("location.href='/academy_ignis/EventEntryList?pageNo=1';");
			} else if(login.equals("member")) {
				outR.println("location.href='/academy_ignis/myEvent';");
			}
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