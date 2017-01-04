package ignis.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import ignis.mybatis.service.FactoryService;

public class ReservDAO {
	public boolean insert(String r_guide, String r_time, String r_content, String m_id) {
		SqlSession ss = FactoryService.getFactory().openSession(true);
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("r_guide", r_guide);
		map.put("r_time", r_time);
		map.put("r_content", r_content);
		map.put("m_id", m_id);			
		int cnt = ss.insert("reserv.add", map);
		System.out.println("이것은 ReservDAO의 cnt입니다. " + cnt);
		ss.close();					return (cnt > 0) ? true : false;
	}
}
