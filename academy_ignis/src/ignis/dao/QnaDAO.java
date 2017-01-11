package ignis.dao;


import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import ignis.bean.ig_notice;
import ignis.bean.ig_qna;
import ignis.mybatis.service.FactoryService;


public class QnaDAO {

	public boolean insert( String qb_mal, String m_id,String qb_title, String qb_content,int qb_private ) {
		SqlSession ss = FactoryService.getFactory().openSession(true);
		HashMap<String,Object> map = new HashMap<>();
		map.put("qb_mal", qb_mal);
		map.put("m_id", m_id);
		map.put("qb_title", qb_title);
		map.put("qb_content", qb_content);
		map.put("qb_private", qb_private);
		System.out.println(qb_mal+m_id+qb_title+qb_content+qb_private);
		int result = ss.insert("qna.add", map);
		if(result> 0) {System.out.println("qna추가 성공");}
		else {System.out.println("qna추가 실패");}
		ss.commit(); ss.close();
		return (result > 0) ? true : false;
	}
	
	public boolean insertReply( String qb_mal, String m_id,String qb_title, String qb_content,int qb_private,int qb_groupnum ) {
		SqlSession ss = FactoryService.getFactory().openSession(true);
		HashMap<String,Object> map = new HashMap<>();
		map.put("qb_mal", qb_mal);
		map.put("m_id", m_id);
		map.put("qb_title", qb_title);
		map.put("qb_content", qb_content);
		map.put("qb_private", qb_private);
		map.put("qb_groupnum", qb_groupnum);
		int result = ss.insert("qna.insertReply", map);
		if(result> 0) {System.out.println("qna 답변 추가 성공");}
		else {System.out.println("qna 답변 추가 실패");}
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


	public List<ig_qna> selectDetail(int qb_num) {
		SqlSession ss = FactoryService.getFactory().openSession(true);
		HashMap<String, Integer> map= new HashMap<String, Integer>();
		map.put("qb_num", qb_num);
		List<ig_qna> list = ss.selectList("qna.selectDetail",map);
		ss.close();			
		return list;
	}
	
	public String replyOwenr(int qb_num) {
		SqlSession ss = FactoryService.getFactory().openSession(true);
		HashMap<String, Integer> map= new HashMap<String, Integer>();
		map.put("qb_num", qb_num);
		String replyOwenr = ss.selectOne("qna.replyOwenr",map);
		ss.close();			
		return replyOwenr;
	}


	public int updateCount(int qb_num) {
		SqlSession ss = FactoryService.getFactory().openSession(true);
		HashMap<String, Integer> map= new HashMap<String, Integer>();
		map.put("qb_num", qb_num);
		int readCount_change = ss.update("qna.updateCount",map);
		return readCount_change;
	}

	public int qb_groupCount(int qb_groupnum) {
		SqlSession ss = FactoryService.getFactory().openSession(true);
		HashMap<String, Integer> map= new HashMap<String, Integer>();
		map.put("qb_groupnum", qb_groupnum);
		int qb_groupCount = ss.selectOne("qna.qb_groupCount",map);
		return qb_groupCount;
	}

	public boolean qnaDeleteQb_num(int qb_num) {
		SqlSession ss = FactoryService.getFactory().openSession(true);
		HashMap<String, Integer> map= new HashMap<String, Integer>();
		map.put("qb_num", qb_num);
		int result = ss.delete("qna.DeleteQb_num",map);
		if(result>0){return true;}
		return false;
	}

	public boolean qnaDeleteQb_groupnum(int qb_groupnum) {
		SqlSession ss = FactoryService.getFactory().openSession(true);
		HashMap<String, Integer> map= new HashMap<String, Integer>();
		map.put("qb_groupnum", qb_groupnum);
		int result = ss.delete("qna.DeleteQb_groupnum",map);
		if(result>0){return true;}
		return false;
	}

	public boolean update(int qb_num, String qb_title, String qb_content) {
		SqlSession ss = FactoryService.getFactory().openSession(true);
		HashMap map= new HashMap();
		map.put("qb_num", qb_num);
		map.put("qb_title", qb_title);
		map.put("qb_content", qb_content);
		int result = ss.update("qna.Update",map);
		if(result>0){return true;}
		return false;
	}
	
	public int getQnaCount(String m_id) {
		SqlSession ss = FactoryService.getFactory().openSession();
		
		int count = ss.selectOne("qna.selectQnaCount", m_id);
		ss.close();
		
		return count;
	}

	public int getMaxQb_num() {
		SqlSession ss = FactoryService.getFactory().openSession();
		int MaxQb_num = ss.selectOne("qna.MaxQb_num");
		ss.close();
		return MaxQb_num;
	}
}
