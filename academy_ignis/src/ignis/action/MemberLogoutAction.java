package ignis.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ignis.biz.LogoutBiz;

public class MemberLogoutAction implements ActionInterface {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		LogoutBiz outBiz = new LogoutBiz();
		outBiz.logOut(request, response);
		response.setContentType("text/html;charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		out.println("<script>");
		
		if (request.getParameter("id") != null)
			out.println("location.href='/academy_ignis/admin/ad_Login.jsp';");
		else
			out.println("location.href='/academy_ignis';");
			
		out.println("</script>");
		out.close();
		
		return null;
	}

}
