package ignis.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ignis.biz.ReviewBiz;


public class ReviewDeleteAction implements ActionInterface {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception{
		ReviewBiz reviewBiz = new ReviewBiz();
		ActionForward forward = new ActionForward();
		int num = Integer.valueOf(request.getParameter("num"));
		String login = request.getParameter("login");
		boolean result = reviewBiz.deleteReview(request, response);
		
		if(login.equals("admin")){
			if(result){
				
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter outR = response.getWriter();
				outR.println("<script>");
				outR.println("alert('삭제되었습니다.');");
				outR.println("location.href='/academy_ignis/Review?login=admin';");
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
		} else if (login.equals("member")){
			if(result){
				
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter outR = response.getWriter();
				outR.println("<script>");
				outR.println("alert('삭제되었습니다.');");
				outR.println("location.href='/academy_ignis/Review?login=member';");
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
		return null;
	}
}