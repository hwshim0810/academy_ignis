package ignis.biz;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ignis.dao.MemberDAO;

public class JoinBiz {
	
	public boolean insert(HttpServletRequest request, HttpServletResponse response) {
		MemberDAO memDao = new MemberDAO();
	
		String id = request.getParameter("m_id");
		String pass = request.getParameter("m_pass");
		String name = request.getParameter("m_name");
		int birth = Integer.valueOf(request.getParameter("m_birth"));
		String addr = request.getParameter("m_addr");
		int phone = Integer.valueOf(request.getParameter("m_phone"));
		String email = request.getParameter("m_email");
		
		boolean result = memDao.insert(id, pass, name, birth, addr, phone, email);
		
		if (result) return result;
		else return result;
	}
}
