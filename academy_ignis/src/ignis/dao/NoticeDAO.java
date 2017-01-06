package ignis.dao;


import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import ignis.bean.ig_notice;
import ignis.mybatis.service.FactoryService;


public class NoticeDAO {

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
	

	public List<ig_notice> searchAll(int startRowNum, int endRowNum, String searchOption, String searchContent){
		SqlSession ss = FactoryService.getFactory().openSession(true);
		HashMap map= new HashMap();
		map.put("startRowNum", startRowNum);
		map.put("endRowNum", endRowNum);
		map.put("searchContent", searchContent);
		List<ig_notice> list=null;

		if(searchOption.equals("nb_all")){
			map.put("searchContent1", searchContent);
			map.put("searchContent2", searchContent);
			System.out.println(searchOption);
			System.out.println(searchContent);
			list = ss.selectList("notice.searchAll",map);
			
		}else if(searchOption.equals("nb_title")){
			list = ss.selectList("notice.searchTitle",map);
		}
		else if(searchOption.equals("nb_content")){
			list = ss.selectList("notice.searchContent",map);
		}
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
		List<ig_notice> list = ss.selectList("notice.selectDetail",map);
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