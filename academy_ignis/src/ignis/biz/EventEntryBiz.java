package ignis.biz;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import ignis.action.MemberLoginAction;
import ignis.bean.User;
import ignis.dao.MemberDAO;

public class EventEntryBiz {
	
	public int isMember(HttpServletRequest request, HttpServletResponse response) {
		MemberDAO memDao = MemberDAO.getInstance();
		
		HttpSession session = request.getSession();
		String id = null;
		
		if (session.getAttribute("m_id") != null) {
			id = (String) session.getAttribute("m_id");
			
			User user = memDao.isMember(id);
			
			if(user.getM_level() == 3){
				return MemberLoginAction.ADMINLEVEL;
			}
			return MemberLoginAction.MEMBERLEVEL;
		}
		else
			return MemberLoginAction.GUESTLEVEL;
		
		
	
				
	}

}