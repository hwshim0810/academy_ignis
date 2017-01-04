package ignis.biz;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import ignis.action.MemberLoginAction;
import ignis.bean.User;
import ignis.dao.MemberDAO;

public class LoginBiz {
	
	public int getUserLogin(HttpServletRequest request, HttpServletResponse response) {
		MemberDAO memDao = new MemberDAO();
		
		String id = request.getParameter("m_id");
		String passwd = request.getParameter("m_pass");
		System.out.println(id + " " + passwd);
		
		User user = memDao.getUserLogin(id);
		
		if (user == null) return MemberLoginAction.GUESTLEVEL;
		else {
			if (passwd.equals(user.getM_pass()) && id.equals("admin")){
				HttpSession session = request.getSession();
				session.setAttribute("m_id", request.getAttribute("m_id"));
				return MemberLoginAction.ADMINLEVEL;
			}
			else if (passwd.equals(user.getM_pass()))
				return MemberLoginAction.MEMBERLEVEL;
			else
				return MemberLoginAction.GUESTLEVEL;
		}
	}

}
