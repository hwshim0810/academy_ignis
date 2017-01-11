package ignis.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ignis.biz.ReviewBiz;

public class CommentPlusAction implements ActionInterface {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception{
		ReviewBiz reviewBiz = new ReviewBiz();
		ActionForward forward = new ActionForward();
		System.out.println("CommentPlusAction 들어옴");
		
		
		String login = request.getParameter("login");
		String pageNo = "1";
		int num = Integer.valueOf(request.getParameter("num"));
		String commPageNo = "1";
		
		if(request.getParameter("pageNo") != null){
			pageNo = request.getParameter("pageNo");
		}
		if(request.getParameter("commPageNo") != null){
			commPageNo = request.getParameter("commPageNo");
		}
		
		boolean result = reviewBiz.insertComment(request, response);
		System.out.println("CommentPlusAction");
		
		if(login.equals("admin")){
			if(result){
				forward.setRedirect(true);
				forward.setPath("/academy_ignis/ReviewView?login=admin&pageNo=" + pageNo + "&num="+ num + "&commPageNo=" + commPageNo);
				return forward;
			}
		} else if (login.equals("member")){
			if(result){
				forward.setRedirect(true);
				forward.setPath("/academy_ignis/ReviewView?&login=member&pageNo=" + pageNo + "&num="+ num + "&commPageNo=" + commPageNo);
				return forward;
			}
		}
		
		return null;

	}
	
}
