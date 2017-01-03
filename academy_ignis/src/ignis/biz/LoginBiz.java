package ignis.biz;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginBiz {

	public void insert(HttpServletRequest request, HttpServletResponse response) {
	
		String id = request.getParameter("m_id");
		String pass = request.getParameter("m_pass");
		String name = request.getParameter("m_name");
		String birth = request.getParameter("m_birth");
		String addr = request.getParameter("m_addr");
		String phone = request.getParameter("m_phone");
		String email = request.getParameter("m_email");
		

	}
}
