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
	

	public List<ig_notice> selectAll(int startRowNum,int endRowNum){
		SqlSession ss = FactoryService.getFactory().openSession(true);
		HashMap<String, Integer> map= new HashMap<String, Integer>();
		map.put("startRowNum", startRowNum);
		map.put("endRowNum", endRowNum);
		List<ig_notice> list = ss.selectList("notice.selectAll",map);
		ss.close();			
		return list;

	}
	
	public List<ig_notice> selectone(int startRowNum,int endRowNum){
		SqlSession ss = FactoryService.getFactory().openSession(true);
		HashMap<String, Integer> map= new HashMap<String, Integer>();
		map.put("startRowNum", startRowNum);
		map.put("endRowNum", endRowNum);
		List<ig_notice> list = ss.selectList("notice.selectAll",map);
		ss.close();			
		return list;

	}
	
	
	public int getListcount() {
		
		SqlSession ss = FactoryService.getFactory().openSession(true);
		int listCount = ss.selectOne("notice.listCount");
		return listCount;
	}


	public List<ig_notice> selectDetail(int nb_num) {
		SqlSession ss = FactoryService.getFactory().openSession(true);
		HashMap<String, Integer> map= new HashMap<String, Integer>();
		map.put("nb_num", nb_num);
		List<ig_notice> list = ss.selectList("notice.selectDeatil",map);
		ss.close();			
		return list;
	}


	public int updateCount(int nb_num) {
		SqlSession ss = FactoryService.getFactory().openSession(true);
		HashMap<String, Integer> map= new HashMap<String, Integer>();
		map.put("nb_num", nb_num);
		int readCount_change = ss.update("notice.updateCount",map);
		return readCount_change;
	}

}
