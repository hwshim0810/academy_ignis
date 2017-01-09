package ignis.biz;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ignis.dao.MemberDAO;

public class MemberBiz {
	public static final int ADSUCCESS = 1;
	public static final int ADFAIL = 2;
	public static final int USERSUCCESS = 3;
	public static final int USERFAIL = 4;
	public static final int PASSSUCCESS = 5;
	public static final int PASSFAIL = 6;
	
	private static MemberBiz memBiz = new MemberBiz();
	
	private MemberBiz() {}
	
	public static MemberBiz getInstance() {
		return memBiz;
	}
	
	public int update(HttpServletRequest request, HttpServletResponse response) {
		MemberDAO memDao = MemberDAO.getInstance();
	
		String page = request.getParameter("page");
		String id = null, addr = null, email = null, birth = null;
		int phone = 0;
		
		
		if (!page.equals("pass")) {
			id = request.getParameter("m_id");
			addr = request.getParameter("m_addr");
			email = request.getParameter("m_email");
			birth = request.getParameter("m_birth");
			phone = Integer.valueOf(request.getParameter("m_phone"));
		}
		
		if (page.equals("admin")) {
			String name = request.getParameter("m_name");
			int level = Integer.valueOf(request.getParameter("m_level"));
			boolean result = memDao.adupdateMem(id, name, birth, addr, phone, email, level);
			
			if (result) return ADSUCCESS;
			else return ADFAIL;
				
			
		} else if (page.equals("mypage")) {
			boolean result = memDao.updateMem(id, birth, addr, phone, email);
			
			if (result) return USERSUCCESS;
			else return USERFAIL;
			
		} else {
			id = request.getParameter("hidden_id");
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
		String birth = request.getParameter("m_birth");
		String addr = request.getParameter("m_addr");
		int phone = Integer.valueOf(request.getParameter("m_phone"));
		String email = request.getParameter("m_email");
		
		int level = 2;
		
		if (page.equals("admin")) 
			level = Integer.valueOf(request.getParameter("m_level"));
			
		boolean result = memDao.insert(id, pass, name, birth, addr, phone, email, level);

		return result;
	}
	
	public int delete(HttpServletRequest request, HttpServletResponse response) {
		MemberDAO memDao = MemberDAO.getInstance();
	
		String page = request.getParameter("page");
		String id = request.getParameter("m_id");
		
		if (page.equals("admin")) {
			boolean result = memDao.deleteMem(id);
			
			if (result) return ADSUCCESS;
			else return ADFAIL;
			
		} else {
			boolean result = memDao.deleteMem(id);
			
			if (result) return USERSUCCESS;
			else return USERFAIL;
		}
	}

}