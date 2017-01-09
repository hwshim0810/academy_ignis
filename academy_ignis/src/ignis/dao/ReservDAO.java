package ignis.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import ignis.bean.ig_reserv;
import ignis.mybatis.service.FactoryService;

public class ReservDAO {
	private static ReservDAO reservDAO = new ReservDAO();

	public static ReservDAO getInstance(){
		return reservDAO;
	}
	
	public boolean update(String m_id) {
		SqlSession ss = FactoryService.getFactory().openSession();
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("m_id", m_id);			
		int cnt = ss.insert("reserv.updateReserv", map);
		System.out.println("update확인용 cnt" + cnt);
		ss.close();					return (cnt > 0) ? true : false;
	}

	public boolean insert(String r_guide, String r_day, String r_time, String r_findDoc, String m_id) {
		SqlSession ss = FactoryService.getFactory().openSession(true);
		HashMap<String, Object> map = new HashMap<>();
		map.put("r_guide", r_guide);
		map.put("r_day", r_day);
		map.put("r_time", r_time);
		map.put("r_findDoc", r_findDoc);
		map.put("m_id", m_id);			
		int cnt = ss.insert("reserv.add", map);
		System.out.println("insert확인용 cnt" + cnt);
		ss.close();					return (cnt > 0) ? true : false;
	}
	
	public int getListcount() {
		
		SqlSession ss = FactoryService.getFactory().openSession(true);
		int listCount = ss.selectOne("reserv.listCount");
		return listCount;
	}
	
	public List<ig_reserv> getReservAll(String m_id, int begin, int end) {
		SqlSession ss = FactoryService.getFactory().openSession();
		HashMap<String, Object> map = new HashMap<>();
		System.out.println("ReservDAO내의 m_id확인용 : " + m_id);
		map.put("m_id", m_id);
		map.put("begin", begin);	
		map.put("end", end);
		
		List<ig_reserv> list = ss.selectList("reserv.selectAll", map);
		ss.close();
		
		return list;
	}
	

	public List<ig_reserv> getSearchReserv(String r_content, int begin, int end) {
		SqlSession ss = FactoryService.getFactory().openSession();
		HashMap<String, Object> map = new HashMap<>();
		System.out.println("ReservDAO내의 r_title, r_content확인용 : " + r_content);
		map.put("r_content", r_content);
		map.put("begin", begin);	
		map.put("end", end);
		
		List<ig_reserv> list = ss.selectList("reserv.searchReserv", map);
		ss.close();
		
		return list;
		
	}
	
	public List<ig_reserv> check(String m_id) {
		SqlSession ss = FactoryService.getFactory().openSession();
		List<ig_reserv> list = null;
		list = ss.selectList("reserv.check",m_id);
		ss.close();					return list;
	}
	
	
	public List<ig_reserv> checkAll() {
		SqlSession ss = FactoryService.getFactory().openSession();
		List<ig_reserv> list = ss.selectList("reserv.checkAll");
		ss.close();					return list;
	}
}

