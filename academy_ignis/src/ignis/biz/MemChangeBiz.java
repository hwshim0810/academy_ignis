package ignis.biz;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ignis.dao.MemberDAO;

public class MemChangeBiz {
	public static final int ADSUCCESS = 1;
	public static final int ADFAIL = 2;
	public static final int USERSUCCESS = 3;
	public static final int USERFAIL = 4;
	public static final int PASSSUCCESS = 5;
	public static final int PASSFAIL = 6;
	
	public int update(HttpServletRequest request, HttpServletResponse response) {
		MemberDAO memDao = MemberDAO.getInstance();
	
		String page = request.getParameter("page");
		
		String id = request.getParameter("m_id");
		int birth = Integer.valueOf(request.getParameter("m_birth"));
		String addr = request.getParameter("m_addr");
		int phone = Integer.valueOf(request.getParameter("m_phone"));
		String email = request.getParameter("m_email");
		
		if (page.equals("admin")) {
			String name = request.getParameter("m_name");
			String pass = request.getParameter("m_pass");
			boolean result = memDao.adupdateMem(id, pass, name, birth, addr, phone, email);
			
			if (result) return ADSUCCESS;
			else return ADFAIL;
				
			
		} else if (page.equals("mypage")) {
			boolean result = memDao.updateMem(id, birth, addr, phone, email);
			
			if (result) return USERSUCCESS;
			else return USERFAIL;
			
		} else {
			String pass = request.getParameter("m_pass");
			boolean result = memDao.updatePass(id, pass);
			
			if (result) return PASSSUCCESS;
			else return PASSFAIL;
		}
		
	}
	
	public boolean insert(HttpServletRequest request, HttpServletResponse response) {
		MemberDAO memDao = MemberDAO.getInstance();
		String page = request.getParameter("page");
	
		String id = request.getParameter("m_id");
		String pass = request.getParameter("m_pass");
		String name = request.getParameter("m_name");
		int birth = Integer.valueOf(request.getParameter("m_birth"));
		String addr = request.getParameter("m_addr");
		int phone = Integer.valueOf(request.getParameter("m_phone"));
		String email = request.getParameter("m_email");
		
		int level = 1;
		if (page.equals("home")) level = 2;
		else level = 3; 
			
		
		boolean result = memDao.insert(id, pass, name, birth, addr, phone, email, level);
		
		if (result) return result;
		else return result;
	}
}
