package ignis.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ignis.bean.ig_event;
import ignis.biz.EventBiz;

public class EventViewAction implements ActionInterface {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception{
		EventBiz eventBiz = new EventBiz();
		ActionForward forward = new ActionForward();
		int num = Integer.valueOf(request.getParameter("num"));
		
		String login = request.getParameter("login");
		if(login.equals("admin")){
			forward.setRedirect(true);
			forward.setPath("/academy_ignis/admin/ad_CommunityEventView.jsp?num="+ num);
			return forward;

		} else if(login.equals("member")){
			boolean result = eventBiz.upReadCount(request, response);
			if(result){
				System.out.println("member로 들어옴");
				forward.setRedirect(true);
				forward.setPath("/academy_ignis/community/eventView.jsp?num="+ num);
				return forward;
			} else {
				System.out.println(num);
			}
		}
		

		
		
		return null;
		
	}
}