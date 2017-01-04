package ignis.dao;


import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;

import ignis.mybatis.service.FactoryService;


public class noticeDAO {

	public boolean insert(String nb_num, String nb_title, String nb_content) {
		System.out.println("2");
		SqlSession ss = FactoryService.getFactory().openSession(true);
		System.out.println("3");
		HashMap<String, String> map = new HashMap<>();
		map.put("nb_num", nb_num);
		map.put("nb_title", nb_title);
		map.put("nb_content", nb_content);

		
		int result = ss.insert("notice.add", map);
		if(result> 0) {System.out.println("notice추가 성공");}
		else {System.out.println("notice추가 실패");}
		ss.close();
		return (result > 0) ? true : false;
	}

}
