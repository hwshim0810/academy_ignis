package ignis.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import ignis.mybatis.service.FactoryService;
import ignis.bean.ig_reserv;

public class ReservDAO {
	private static ReservDAO reservDAO = new ReservDAO();

	public static ReservDAO getInstance(){
		return reservDAO;
	}
	
	public boolean insert(String r_guide, String r_time, String r_content, String m_id) {
		SqlSession ss = FactoryService.getFactory().openSession(true);
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("r_guide", r_guide);
		map.put("r_time", r_time);
		map.put("r_content", r_content);
		map.put("m_id", m_id);			
		int cnt = ss.insert("reserv.add", map);
		System.out.println(cnt);
		ss.close();					return (cnt > 0) ? true : false;
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
