package ignis.biz;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ignis.bean.ig_reserv;
import ignis.dao.ReservDAO;

public class ReservBiz {

	public boolean update(HttpServletRequest request, HttpServletResponse response) {
		ReservDAO reservDao = new ReservDAO();
		String m_id = "아이디";

		boolean result = reservDao.update(m_id);
		
		if (result) return result;
		else return result;
	}
	
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
	
	public void checkAll(HttpServletRequest request, HttpServletResponse response) {

		ReservDAO reservDao = new ReservDAO();
		List<ig_reserv> list = reservDao.checkAll();
		for (int i = 0; i < list.size() ; i++) {
			ig_reserv e = list.get(i);
			String m_id = e.getM_id();
			String r_num = e.getR_num();
			String r_guide = e.getR_num();
			String r_time = e.getR_time();
			String r_content = e.getR_content();
		}
	}

}