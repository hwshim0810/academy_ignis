package ignis.biz;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ignis.dao.ReservDAO;

public class ReservBiz {
	
	public boolean insert(HttpServletRequest request, HttpServletResponse response) {
		ReservDAO reservDao = new ReservDAO();
	
		String r_guide = request.getParameter("r_guide");
		String r_time = request.getParameter("r_time");
		String r_content = request.getParameter("r_content");
		String m_id = "아이디";
		
		boolean result = reservDao.insert(r_guide, r_time, r_content, m_id);
		
		if (result) return result;
		else return result;
	}
}