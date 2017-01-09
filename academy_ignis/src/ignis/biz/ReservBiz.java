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
		String r_guide = request.getParameter("r_guide");
		System.out.println("ReservBiz내의 reservaDao.insert부분의 r_guide : " + r_guide);
		String r_day = request.getParameter("r_day");
		String r_time = request.getParameter("r_time");
		String r_findDoc = "TRUE";
		// r_findDoc가 TRUE라는 것은 의사가 진료 예약이 잡혀있음을 의미.
		String m_id = request.getParameter("m_id");
		System.out.println("m_id는 " +m_id);
		boolean result = reservDao.insert(r_guide, r_day, r_time, r_findDoc, m_id);
		
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
			String r_num = e.getR_num();
			String r_guide = e.getR_num();
			String r_time = e.getR_time();
			String r_day = e.getR_day();
			String r_findDoc = e.getR_findDoc();
			String m_id = e.getM_id();
		}
	}
	
	public int getListcount() {
		ReservDAO reservDao = new ReservDAO();
		int listCount = reservDao.getListcount();
		
		return listCount;
	}

}