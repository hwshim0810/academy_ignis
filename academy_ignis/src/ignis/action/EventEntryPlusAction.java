package ignis.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ignis.biz.EventBiz;

public class EventEntryPlusAction implements ActionInterface {
	public static final int ENTRYSUCCESS = 1;
	public static final int ENTRYFULL = 2;
	public static final int ENTRYFAIL = 3;

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception{
		EventBiz eventBiz = new EventBiz();
		System.out.println("Plus1");
		int result = eventBiz.isCanEntry(request, response);
		
		System.out.println("Plus2");
		if (result == ENTRYSUCCESS) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out1 = response.getWriter();
			System.out.println("Plus3");
			out1.println("<script>");
			out1.println("alert('이벤트에 응모되었습니다!');");
			out1.println("location.href='/academy_ignis/Event?login=member';");
			out1.println("</script>");
			out1.close();
		} else if(result == ENTRYFULL) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out1 = response.getWriter();
			System.out.println("Plus4");
			out1.println("<script>");
			out1.println("alert('이벤트 응모인원이 가득 찼습니다.');");
			out1.println("location.href='/academy_ignis/Event?login=member';");
			out1.println("</script>");
			out1.close();
		} else if (result == ENTRYFAIL){
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out1 = response.getWriter();
			System.out.println("Plus5");
			out1.println("<script>");
			out1.println("alert('이미 응모하셨습니다!');");
			out1.println("location.href='/academy_ignis/Event?login=member';");
			out1.println("</script>");
			out1.close();
		}
		
		return null;
	}
}
