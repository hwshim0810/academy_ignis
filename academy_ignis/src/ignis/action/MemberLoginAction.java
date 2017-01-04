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
		HttpSession session = request.getSession();
		
		int userLevel = loginBiz.isMember(request, response);

		switch (userLevel) {
		case ADMINLEVEL: 
			session.setAttribute("m_id", request.getParameter("m_id"));
			forward.setRedirect(true);
			forward.setPath("./admin/ad_Manage.jsp");
			return forward;
		
		case MEMBERLEVEL:
			session.setAttribute("m_id", request.getParameter("m_id"));
			forward.setRedirect(true);
			forward.setPath("/");
			return forward;
		
		case GUESTLEVEL:
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('아이디가 존재하지 않습니다.');");
			out.println("location.href='./login';");
			out.println("</script>");
			out.close();
			return null;
			
		case WRONGPASS:
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out2 = response.getWriter();
			out2.println("<script>");
			out2.println("alert('비밀번호가 일치하지 않습니다.');");
			out2.println("location.href='./login';");
			out2.println("</script>");
			out2.close();
			return null;
		}
		
		return forward;
	}

}
