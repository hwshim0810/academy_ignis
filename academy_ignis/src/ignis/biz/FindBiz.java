package ignis.biz;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ignis.bean.User;
import ignis.dao.MemberDAO;

public class FindBiz {
	private static FindBiz findBiz = new FindBiz();

	private FindBiz() {}

	public static FindBiz getInstance() {
		return findBiz;
	}
	
	public String getUserId(HttpServletRequest request, HttpServletResponse response) {
		MemberDAO memDao = MemberDAO.getInstance();
		
		String email = request.getParameter("m_email");
		
		User user = memDao.getUserId(email);
		String id = null;
		
		if (user == null) return id; 
		else id = user.getM_id();
		
		return id;
	}

	public boolean getUserPass(HttpServletRequest request, HttpServletResponse response) {
		MemberDAO memDao = MemberDAO.getInstance();
		
		String id = request.getParameter("m_id");
		String name = request.getParameter("m_name");
		String email = request.getParameter("m_email");
		
		boolean result = memDao.getUserPass(id, name, email);
		
		return result;
	}

	public boolean isMember(HttpServletRequest request, HttpServletResponse response) {
		MemberDAO memDao = MemberDAO.getInstance();
		
		String id = request.getParameter("m_id");
		User user = memDao.isMember(id);
		
		return (user != null)? true : false;
	}
	
	public boolean isPassOk(HttpServletRequest request, HttpServletResponse response) {
		MemberDAO memDao = MemberDAO.getInstance();
		
		String id = request.getParameter("m_id");
		String pass = request.getParameter("m_pass");
		User user = memDao.isPassOk(id, pass);
		
		return (user != null)? true : false;
	}

}
