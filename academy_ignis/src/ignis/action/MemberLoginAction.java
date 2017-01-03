package ignis.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ignis.bean.User;
import ignis.biz.LoginBiz;

public class MemberLoginAction implements ActionInterface {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id = request.getParameter("m_id");
		String passwd = request.getParameter("m_pass");
		LoginBiz loginBiz = new LoginBiz();
//		User user = loginBiz.getUserLogin(id, passwd);
		
//		if (user != null) {
//			HttpSession session = request.getSession();
//			session.setAttribute("user", user);
//			RequestDispatcher dispatcher = request.getRequestDispatcher("loginSuccess.jsp");
//			dispatcher.forward(request, response);
//		} else {
//			response.sendRedirect("login.jsp");
//		}
		
		return null;
	}

}
