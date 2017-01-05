package ignis.dao;

import java.io.IOException;
import java.io.Reader;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import ignis.bean.User;
import ignis.bean.ig_event;
import ignis.mybatis.service.FactoryService;

public class EventDAO {
	private static EventDAO eventDao = new EventDAO();
	
	public static EventDAO getInstance() {
		return eventDao;
	}
	
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

	// 이벤트 수정
	public boolean updateEvent(int eb_num, String eb_title, String eb_content){
		SqlSession ss = FactoryService.getFactory().openSession(true);
		HashMap<String, Object> map = new HashMap<>();
		System.out.println(eb_num+" ////DAO//");
		map.put("eb_num", eb_num);
		map.put("eb_title", eb_title);
		map.put("eb_content", eb_content);
		
		int result = ss.update("event.updateEvent", map);
		
		ss.commit();
		ss.close();
		
		return(result > 0) ? true : false;
	} 
	
	public List<ig_event> getListAll() {
		SqlSession ss = FactoryService.getFactory().openSession();
		List<ig_event> list = ss.selectList("event.eventList");
		ss.close();
		
		return list;
	}
	
	public int getListCount() {
		SqlSession ss = FactoryService.getFactory().openSession();
		int count = ss.selectOne("event.selectListCount");
		ss.close();
		
		return count;
	}
	
	public ig_event eventSelectOne(int eb_num){
		SqlSession ss = FactoryService.getFactory().openSession();
		ig_event view = ss.selectOne("event.selectNum", eb_num);
		
		return view;
	}

}
