package ignis.dao;


import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import ignis.bean.ig_notice;
import ignis.mybatis.service.FactoryService;


public class noticeDAO {

	public boolean insert( String nb_title, String nb_content) {
		SqlSession ss = FactoryService.getFactory().openSession(true);
		HashMap<String, String> map = new HashMap<>();

		map.put("nb_title", nb_title);
		map.put("nb_content", nb_content);

		
		int result = ss.insert("notice.add", map);
		if(result> 0) {System.out.println("notice추가 성공");}
		else {System.out.println("notice추가 실패");}
		ss.commit(); ss.close();
		return (result > 0) ? true : false;
	}
	
	public List<ig_notice> selectAll(){
		SqlSession ss = FactoryService.getFactory().openSession(true);
		System.out.println("1");
		List<ig_notice> list = ss.selectList("notice.selectAll");
		System.out.println("2");
		ss.close();			
		return list;
	}

}
