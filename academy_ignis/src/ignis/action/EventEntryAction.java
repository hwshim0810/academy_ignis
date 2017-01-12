package ignis.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ignis.biz.EventEntryBiz;

public class EventEntryAction implements ActionInterface {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		EventEntryBiz entryBiz = new EventEntryBiz();
		ActionForward forward = new ActionForward();

		int memberChk = entryBiz.isMember(request, response);
		int num = Integer.valueOf(request.getParameter("num"));
		String id = request.getParameter("id");
		
		switch(memberChk){
			case MemberLoginAction.MEMBERLEVEL :	// 고객인 경우
				forward.setRedirect(true);
				forward.setPath("/academy_ignis/EventEntryPlus?num=" + num + "&id=" + id);
				return forward;
			
			case MemberLoginAction.ADMINLEVEL :	// 관리자인 경우
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out2 = response.getWriter();
				out2.println("<script>");
				out2.println("alert('관리자는 이벤트를 응모할 수 없습니다.');");
				out2.println("location.href='/academy_ignis/Event?login=member';");
				out2.println("</script>");
				out2.close();
				
				return null;
				
			case MemberLoginAction.GUESTLEVEL :	// 회원이 아닌 경우 경우
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out3 = response.getWriter();
				out3.println("<script>");
				out3.println("alert('로그인을 해주세요.');");
				out3.println("location.href='/academy_ignis/login';");
				out3.println("</script>");
				out3.close();
				
				return null;
		}
		return null;
	}
}
