package ignis.biz;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ignis.dao.MemberDAO;

public class JoinBiz {
	
	public void insert(HttpServletRequest request, HttpServletResponse response) {
		MemberDAO memDao = new MemberDAO();
	
		String id = request.getParameter("m_id");
		String pass = request.getParameter("m_pass");
		String name = request.getParameter("m_name");
		String birth = request.getParameter("m_birth");
		String addr = request.getParameter("m_addr");
		String phone = request.getParameter("m_phone");
		String email = request.getParameter("m_email");
		
		memDao.insert(id, pass, name, birth, addr, phone, email);
		
	}
}
