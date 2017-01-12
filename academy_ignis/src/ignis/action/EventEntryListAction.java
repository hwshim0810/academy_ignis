package ignis.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import ignis.biz.EventBiz;
import ignis.biz.LoginBiz;

public class EventEntryListAction implements ActionInterface {
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception{
		EventBiz eventBiz = new EventBiz();
		ActionForward forward = new ActionForward();
		
		boolean result = eventBiz.insertEvent(request, response);
		System.out.println("EventEntryListAction");
		if(result){
			forward.setRedirect(true);
			forward.setPath("/academy_ignis/admin/ad_CommunityEventEntryList.jsp");
			return forward;
		}
		
		return null;
	}
}
