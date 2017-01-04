package ignis.dao;

import java.io.IOException;
import java.io.Reader;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import ignis.bean.ig_event;
import ignis.mybatis.service.FactoryService;

public class EventDAO {
	// 이벤트 추가
	public static boolean insertEvent(String eb_title, String eb_content){
		SqlSession ss = FactoryService.getFactory().openSession(true);
		HashMap<String, String> map = new HashMap<String, String>();
		
		map.put("eb_title", eb_title);
		map.put("eb_content", eb_content);
		
		int cnt = ss.insert("event.insertEvent", map);
		
		if(cnt > 0 ){
			System.out.println("event 추가 성공!");
		} else{
			System.out.println("event 추가 실패");
		}
		
		ss.commit();
		ss.close();
		return(cnt > 0) ? true : false;
	}
	
	// 목록
	public static List<ig_event> eventList(){
		SqlSession ss = FactoryService.getFactory().openSession(true);
		List<ig_event> list = ss.selectList("event.eventList");
		ss.close();
		return list;
	}


}
