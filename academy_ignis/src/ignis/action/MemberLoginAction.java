package ignis.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import ignis.biz.LoginBiz;

public class MemberLoginAction implements ActionInterface {
	public static final int GUESTLEVEL = 1;
	public static final int MEMBERLEVEL = 2;
	public static final int ADMINLEVEL = 3;
	public static final int WRONGPASS = 4;
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		LoginBiz loginBiz = new LoginBiz();
		ActionForward forward = new ActionForward();
		
		int userLevel = loginBiz.isMember(request, response);
		
		HttpSession session = request.getSession();
		String page = request.getParameter("page");

		int pagenum = 1;
		if (request.getParameter("pagenum") != null)
			Integer.parseInt(request.getParameter("pagenum"));
		
		switch (userLevel) {
		case ADMINLEVEL: 
			session.setAttribute("m_id", request.getParameter("m_id"));
			session.setAttribute("m_level",ADMINLEVEL);
			forward.setRedirect(true);
			forward.setPath("./admin/ad_Manage.jsp");
			return forward;
		
		case MEMBERLEVEL:
			session.setAttribute("m_id", request.getParameter("m_id"));
			session.setAttribute("m_level",MEMBERLEVEL);
			if (!page.equals("home")) {
				forward.setRedirect(true);
				forward.setPath("/academy_ignis/" + page + "?pagenum=" + pagenum);
				return forward;
			}
			forward.setRedirect(true);
			forward.setPath("/academy_ignis");
			return forward;
		
		case GUESTLEVEL:
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('아이디가 존재하지 않습니다.');");
			
			if (page.equals("home"))
				out.println("location.href='./login';");
			else
				out.println("location.href='./admin/ad_Login.jsp';");
			
			out.println("</script>");
			out.close();
			return null;
			
		case WRONGPASS:
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out2 = response.getWriter();
			out2.println("<script>");
			out2.println("alert('비밀번호가 일치하지 않습니다.');");
			
			if (page.equals("home"))
				out2.println("location.href='./login';");
			else
				out2.println("location.href='./admin/ad_Login.jsp';");
			
			out2.println("</script>");
			out2.close();
			return null;
		}
		
		return forward;
	}

}
