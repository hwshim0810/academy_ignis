package ignis.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ignis.biz.EventBiz;

public class EventWriteAction implements ActionInterface {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception{
		EventBiz eventBiz = new EventBiz();
		ActionForward forward = new ActionForward();
		
		boolean result = eventBiz.insertEvent(request, response);
		System.out.println("EventWriteAction");
		if(result){
			forward.setRedirect(true);
			forward.setPath("/academy_ignis/admin/ad_CommunityEventList.jsp");
			return forward;
		}
		
		return null;
	}
}
