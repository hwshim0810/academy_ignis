package ignis.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;

import ignis.mybatis.service.FactoryService;


public class noticeDAO {

	public boolean insert(String nb_num, String nb_title, String nb_content) {
		SqlSession ss = FactoryService.getFactory().openSession(true);
		HashMap<String, String> map = new HashMap<>();
		map.put("nb_num", nb_num);
		map.put("nb_title", nb_title);
		map.put("nb_content", nb_content);

		
		int result = ss.insert("notice.add", map);
		ss.close();
		return (result > 0) ? true : false;
	}

}
