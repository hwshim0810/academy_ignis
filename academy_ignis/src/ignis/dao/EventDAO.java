package ignis.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import ignis.bean.ig_event;
import ignis.bean.ig_evententry;
import ignis.bean.ig_review;
import ignis.mybatis.service.FactoryService;

public class EventDAO {
	private static EventDAO eventDao = new EventDAO();
	
	public static EventDAO getInstance() {
		return eventDao;
	}
	
	// 이벤트 추가
	public boolean insertEvent(String eb_title, String eb_content, int eb_winner, String eb_period, String eb_announceday){
		SqlSession ss = FactoryService.getFactory().openSession(true);
		HashMap<String, Object> map = new HashMap<>();
		
		map.put("eb_title", eb_title);
		map.put("eb_content", eb_content);
		map.put("eb_winner", eb_winner);
		map.put("eb_period", eb_period);
		map.put("eb_announceday", eb_announceday);
		
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
	public List<ig_event> eventList(int begin, int end){
		SqlSession ss = FactoryService.getFactory().openSession(true);
		
		HashMap<String, Integer> map = new HashMap<>();
		
		map.put("begin", begin);
		map.put("end", end);
		
		List<ig_event> list = ss.selectList("event.eventList", map);
		ss.close();
		return list;
	}

	// 이벤트 수정
	public boolean updateEvent(int eb_num, String eb_title, String eb_content, int eb_winner, String eb_period, String eb_announceday){
		SqlSession ss = FactoryService.getFactory().openSession(true);
		HashMap<String, Object> map = new HashMap<>();
		System.out.println(eb_num+" ////DAO//");
		map.put("eb_num", eb_num);
		map.put("eb_title", eb_title);
		map.put("eb_content", eb_content);
		map.put("eb_winner", eb_winner);
		map.put("eb_period", eb_period);
		map.put("eb_announceday", eb_announceday);
		
		int result = ss.update("event.updateEvent", map);
		
		ss.commit();
		ss.close();
		
		return(result > 0) ? true : false;
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
	
	public boolean deleteEvent(int eb_num, String eb_title, String eb_content){
		SqlSession ss = FactoryService.getFactory().openSession(true);
		HashMap<String, Object> map = new HashMap<>();
		System.out.println(eb_num+" ////deleteDAO//");
		map.put("eb_num", eb_num);
		map.put("eb_title", eb_title);
		map.put("eb_content", eb_content);
		
		int result = ss.delete("event.deleteEvent", map);
		
		ss.commit();
		ss.close();
		
		return(result > 0) ? true : false;
	} 
	
	public boolean upReadCount(int eb_num) throws Exception{
		SqlSession ss = FactoryService.getFactory().openSession(true);

		int result = ss.update("event.upReadCount", eb_num);
		
		ss.close();
		
		return(result > 0) ? true : false;
	}
	
	
	public boolean insertEventEntry(int eb_num, String m_name){
		SqlSession ss = FactoryService.getFactory().openSession(true);
		HashMap<String, Object> map = new HashMap<>();
		
		map.put("eb_num", eb_num);
		map.put("m_name", m_name);

		
		int cnt = ss.insert("event.insertEventEntry", map);
		
		if(cnt > 0 ){
			System.out.println("event 참여 성공!");
		} else{
			System.out.println("event 참여 실패");
		}
		
		ss.commit();
		ss.close();
		return(cnt > 0) ? true : false;
	}

	public boolean isCanEntry(int eb_num) {
		SqlSession ss = FactoryService.getFactory().openSession();
		System.out.println("isCanEntry eb_num : " + eb_num);
		
		ig_event view = ss.selectOne("event.selectCanEntry", eb_num);
		ss.close();
		
		return (view.getEb_winner() > 0) ? true : false;
	}

	public void updateWinner(int eb_num) {
		SqlSession ss = FactoryService.getFactory().openSession(true);
		
		ss.update("event.updateWinner", eb_num);
		ss.close();
	}
	
	public List<ig_evententry> selectEntryList(int eb_num){
		SqlSession ss = FactoryService.getFactory().openSession();
		
		List<ig_evententry> list = ss.selectList("event.selectEntryList", eb_num);
		
		ss.close();
		
		return list;
	}

	public boolean isCanEntryId(int eb_num, String m_name) {
		SqlSession ss = FactoryService.getFactory().openSession();
		System.out.println("isCanEntryId eb_num : " + eb_num);
		System.out.println("isCanEntryId m_name : " + m_name);
		List<ig_evententry> entryList = ss.selectList("event.selectEntry", eb_num);
		System.out.println("m_name1 : " + m_name);
		
		for (ig_evententry entryBean : entryList) {
			System.out.println("m_name : " + m_name);
			System.out.println("entryBean.getM_name() : " + entryBean.getM_name());
			
			if (m_name.equals(entryBean.getM_name())){
				return false;
			}
		}
		
		return false;
	}
	
//	public Map<String, Object> selectEntryList(int begin, int end) {
//		SqlSession ss = FactoryService.getFactory().openSession();
//		Map<String, Object> resultMap = new HashMap<>();
//		HashMap<String, Object> map = new HashMap<>();
//		
//		map.put("begin", begin);
//		map.put("end", end);
//		
//		resultMap = ss.selectMap("event.selectEntryList", map, "eb_num");
//		
//		return resultMap;
//	}
	
//	public HashMap<String, Object> entryList(int begin, int end){
//		SqlSession ss = FactoryService.getFactory().openSession(true);
//		
//		HashMap<String, Object> resultMap = new HashMap<>();
//		HashMap<String, Integer> map = new HashMap<>();
//		
//		map.put("begin", begin);
//		map.put("end", end);
//		
//		List<ig_evententry> entrylist = ss.selectList("event.eventEntryList", map);
//		List<ig_event> eventlist = ss.selectList("event.eventList", map);
//		
//		resultMap.put("entrylist", entrylist);
//		resultMap.put("eventlist", eventlist);
//		
//		ss.close();
//		
//		return resultMap;
//	} 
	
	public List<ig_evententry> eventEntryList(int begin, int end){
		SqlSession ss = FactoryService.getFactory().openSession(true);
		
		HashMap<String, Integer> map = new HashMap<>();
		
		map.put("begin", begin);
		map.put("end", end);
		
		List<ig_evententry> list = ss.selectList("event.selectEntryList", map);
		ss.close();
		return list;
	}
	
	public boolean deleteWinner(int eb_num) {
		SqlSession ss = FactoryService.getFactory().openSession(true);
		
		ss.update("event.deleteWinner", eb_num);
		ss.close();
		
		return true;
	}
	
	public boolean deleteMyEvent(int eb_num){
		SqlSession ss = FactoryService.getFactory().openSession(true);
		HashMap<String, Object> map = new HashMap<>();
		System.out.println(eb_num+" ////deleteDAO//");
		map.put("eb_num", eb_num);
		
		int result = ss.delete("event.deleteMyEvent", map);
		System.out.println(eb_num+" ////deleteDAO222222222//");
		ss.commit();
		ss.close();
		
		return(result > 0) ? true : false;
	} 
}
