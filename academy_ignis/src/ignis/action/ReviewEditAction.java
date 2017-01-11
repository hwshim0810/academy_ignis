package ignis.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ignis.biz.ReviewBiz;


public class ReviewEditAction implements ActionInterface {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception{
		ReviewBiz reviewBiz = new ReviewBiz();
		ActionForward forward = new ActionForward();
		System.out.println("ReveiwEditeAction");
		int num = Integer.valueOf(request.getParameter("num"));
		String login = request.getParameter("login");
		String pageNo = "1";
		
		if(request.getParameter("pageNo") != null){
			pageNo = request.getParameter("pageNo");
		}
		
		boolean result = reviewBiz.updateReview(request, response);
		
		if(login.equals("admin")){
			if(result){
				forward.setRedirect(false);
				forward.setPath("/ReviewView?login=admin&pageNo=" + pageNo + "&num="+num);
				return forward;
			} else {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter outR = response.getWriter();
				outR.println("<script>");
				outR.println("alert('수정실패하였습니다.');");
				outR.println("</script>");
			}
		} else if (login.equals("member")){
			if(result){
				forward.setRedirect(false);
				forward.setPath("/ReviewView?login=member&pageNo=" + pageNo + "&num="+num);
				return forward;
			} else {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter outR = response.getWriter();
				outR.println("<script>");
				outR.println("alert('수정실패하였습니다.');");
				outR.println("</script>");
			}
		}

		return null;
	}
}