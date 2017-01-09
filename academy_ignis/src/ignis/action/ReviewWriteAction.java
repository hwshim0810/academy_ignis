package ignis.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ignis.biz.ReviewBiz;


public class ReviewWriteAction implements ActionInterface {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception{
		ReviewBiz reviewBiz = new ReviewBiz();
		ActionForward forward = new ActionForward();
		
		boolean result = ReviewBiz.insertReview(request, response);
		System.out.println("ReviewWriteAction");
		if(result){
			forward.setRedirect(true);
			forward.setPath("/academy_ignis/Review?login=member");
			return forward;
		}
		
		return null;
	}
}
