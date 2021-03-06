package ignis.biz;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ignis.bean.ig_reserv;
import ignis.dao.ReservDAO;

public class ReservBiz {
	
	
	
	public boolean delete(HttpServletRequest request, HttpServletResponse response) {
		ReservDAO reservDao = new ReservDAO();

		int getR_num=Integer.parseInt(request.getParameter("getR_num"));
		boolean result = reservDao.delete(getR_num);
		
		if (result) return result;
		else return result;
	}
	
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
	
	public boolean adminInsert(HttpServletRequest request, HttpServletResponse response) {
		
		ReservDAO reservDao = new ReservDAO();
		String r_id = request.getParameter("r_id");
		String r_guide = request.getParameter("r_guide");
		String r_day = request.getParameter("r_day");
		String r_time = request.getParameter("r_time");
		String r_findDoc = "TRUE";
		// r_findDoc가 TRUE라는 것은 의사가 진료 예약이 잡혀있음을 의미.
		boolean result = reservDao.insert(r_guide, r_day, r_time, r_findDoc, r_id);
		
		if (result) return result;
		else return result;
	}
	
	public boolean deleteAdmin(HttpServletRequest request, HttpServletResponse response) {

		ReservDAO reservDao = ReservDAO.getInstance();

		String num = request.getParameter("getR_num");
	
		boolean result = reservDao.deleteAdminMem(num);
		
		return result;
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

	public boolean deleteMem(HttpServletRequest request, HttpServletResponse response) {
		ReservDAO reservDao = new ReservDAO();
		
		String m_id = request.getParameter("m_id");
		boolean result = reservDao.deleteMem(m_id);
		
		return result;
	}

}