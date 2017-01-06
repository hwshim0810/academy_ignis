package ignis.dao;


import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import ignis.bean.ig_notice;
import ignis.bean.ig_qna;
import ignis.mybatis.service.FactoryService;


public class QnaDAO {

	public boolean insert( String nb_title, String nb_content) {
		SqlSession ss = FactoryService.getFactory().openSession(true);
		HashMap<String, String> map = new HashMap<>();
		map.put("nb_title", nb_title);
		map.put("nb_content", nb_content);
		int result = ss.insert("qna.add", map);
		if(result> 0) {System.out.println("qna추가 성공");}
		else {System.out.println("qna추가 실패");}
		ss.commit(); ss.close();
		return (result > 0) ? true : false;
	}
	

	public List<ig_qna> selectAll(int startRowNum,int endRowNum){
		SqlSession ss = FactoryService.getFactory().openSession(true);
		HashMap<String, Integer> map= new HashMap<String, Integer>();
		map.put("startRowNum", startRowNum);
		map.put("endRowNum", endRowNum);
		List<ig_qna> list = ss.selectList("qna.selectAll",map);
		ss.close();			
		return list;

	}
	

	public List<ig_qna> searchAll(int startRowNum, int endRowNum, String searchOption, String searchContent){
		SqlSession ss = FactoryService.getFactory().openSession(true);
		HashMap map= new HashMap();
		map.put("startRowNum", startRowNum);
		map.put("endRowNum", endRowNum);
		map.put("searchContent", searchContent);
		List<ig_qna> list=null;

		if(searchOption.equals("nb_all")){
			map.put("searchContent1", searchContent);
			map.put("searchContent2", searchContent);
			System.out.println(searchOption);
			System.out.println(searchContent);
			list = ss.selectList("qna.searchAll",map);
			
		}else if(searchOption.equals("nb_title")){
			list = ss.selectList("qna.searchTitle",map);
		}
		else if(searchOption.equals("nb_content")){
			list = ss.selectList("qna.searchContent",map);
		}
		ss.close();			
		return list;

	}
	public int getListcount() {
		
		SqlSession ss = FactoryService.getFactory().openSession(true);
		int listCount = ss.selectOne("qna.listCount");
		return listCount;
	}


	public List<ig_qna> selectDetail(int nb_num) {
		SqlSession ss = FactoryService.getFactory().openSession(true);
		HashMap<String, Integer> map= new HashMap<String, Integer>();
		map.put("nb_num", nb_num);
		List<ig_qna> list = ss.selectList("qna.selectDeatil",map);
		ss.close();			
		return list;
	}


	public int updateCount(int nb_num) {
		SqlSession ss = FactoryService.getFactory().openSession(true);
		HashMap<String, Integer> map= new HashMap<String, Integer>();
		map.put("nb_num", nb_num);
		int readCount_change = ss.update("qna.updateCount",map);
		return readCount_change;
	}

}
