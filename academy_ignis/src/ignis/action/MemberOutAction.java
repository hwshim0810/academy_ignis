package ignis.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ignis.biz.MemberBiz;
import ignis.biz.ReservBiz;

public class MemberOutAction implements ActionInterface {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		MemberBiz memBiz = MemberBiz.getInstance();
		ReservBiz resBiz = new ReservBiz();
		
		resBiz.deleteMem(request, response);
		boolean memResult = memBiz.outMemUpdate(request, response);
		
		if (memResult) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('그 동안 이용해주셔서 감사합니다.');");
			out.println("location.href='/academy_ignis';");
			out.println("</script>");
			out.close();
			return null;
		} else {
			System.out.println("탈퇴과정 예외");
		}
		
		return null;
	}

}
