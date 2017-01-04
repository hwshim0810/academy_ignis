package ignis.biz;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ignis.bean.User;
import ignis.dao.MemberDAO;

public class FindBiz {

	public String getUserId(HttpServletRequest request, HttpServletResponse response) {
		MemberDAO memDao = new MemberDAO();
		
		String email = request.getParameter("m_email");
		
		User user = memDao.getUserId(email);
		String id = null;
		
		if (user == null) return id; 
		else id = user.getM_id();
		
		return id;
	}

	public boolean getUserPass(HttpServletRequest request, HttpServletResponse response) {
		MemberDAO memDao = new MemberDAO();
		
		String id = request.getParameter("m_id");
		String name = request.getParameter("m_name");
		String email = request.getParameter("m_email");
		
		boolean result = memDao.getUserPass(id, name, email);
		
		return result;
	}

}
