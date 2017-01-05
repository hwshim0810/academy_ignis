package ignis.biz;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ignis.bean.ig_reserv;
import ignis.dao.ReservDAO;

public class ReservBiz {

	public boolean insert(HttpServletRequest request, HttpServletResponse response) {
		ReservDAO reservDao = new ReservDAO();
		String r_guide = request.getParameter("tooth");
		String r_time = request.getParameter("clitime");
		String r_content = request.getParameter("clitext");
		String m_id = "아이디";

		boolean result = reservDao.insert(r_guide, r_time, r_content, m_id);
		
		if (result) return result;
		else return result;
	}
	public boolean check(HttpServletRequest request, HttpServletResponse response) {

		ReservDAO reservDao = new ReservDAO();


		String m_id =request.getParameter("m_id");
		List<ig_reserv> list = reservDao.check(m_id);
		for (int i = 0; i < list.size() ; i++) {
			ig_reserv e = (ig_reserv) list.get(i);
			
		}
		if (list != null) return true;
		else return false;
	}
	
	public boolean checkAll(HttpServletRequest request, HttpServletResponse response) {
		ReservDAO reservDao = new ReservDAO();
		
		List<ig_reserv> list = reservDao.checkAll();
		
		if (list != null) return false;
		else return true;
	}
	
}