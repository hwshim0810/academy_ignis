package ignis.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ReviewAction implements ActionInterface {
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		
		String login = request.getParameter("login");
		String pageNo = "1";
		
		if (request.getParameter("pageNo") != null)
			pageNo = request.getParameter("pageNo");
		
		if(login.equals("admin")){
			forward.setRedirect(true);
			forward.setPath("/academy_ignis/admin/ad_CommunityReviewList.jsp?login=admin&pageNo=" + pageNo);
			return forward;
		} else if (login.equals("member")){
			forward.setRedirect(true);
			forward.setPath("/academy_ignis/community/review.jsp?login=member&pageNo=" + pageNo);
			return forward;
		}
		
		return null;

	}
}
