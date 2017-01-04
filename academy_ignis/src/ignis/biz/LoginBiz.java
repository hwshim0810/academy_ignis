package ignis.biz;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ignis.action.MemberLoginAction;
import ignis.bean.User;
import ignis.dao.MemberDAO;

public class LoginBiz {
	
	public int isMember(HttpServletRequest request, HttpServletResponse response) {
		MemberDAO memDao = MemberDAO.getInstance();
		
		String id = request.getParameter("m_id");
		String passwd = request.getParameter("m_pass");
		System.out.println(id + " " + passwd);
		
		User user = memDao.isMember(id);
		
		if (user == null) return MemberLoginAction.GUESTLEVEL;
		else {
			if (passwd.equals(user.getM_pass()) && id.equals("admin"))
				return MemberLoginAction.ADMINLEVEL;
			else if (passwd.equals(user.getM_pass()))
				return MemberLoginAction.MEMBERLEVEL;
			else
				return MemberLoginAction.WRONGPASS;
		}
	}

}
