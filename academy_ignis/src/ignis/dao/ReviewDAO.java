package ignis.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import ignis.bean.ig_review;
import ignis.mybatis.service.FactoryService;

public class ReviewDAO {
	private static ReviewDAO reviewDao = new ReviewDAO();
	
	public static ReviewDAO getInstance(){
		return reviewDao;
	}
	
	public List<ig_review> reviewList(int begin, int end){
		SqlSession ss = FactoryService.getFactory().openSession(true);
		
		HashMap<String, Integer> map = new HashMap<>();
		
		map.put("begin", begin);
		map.put("end", end);
		
		List<ig_review> list = ss.selectList("review.selectAll", map);
		ss.close();
		return list;
	}
	
	public int getListCount(){
		SqlSession ss = FactoryService.getFactory().openSession();
		int count = ss.selectOne("review.selectListCount");
		ss.close();
		
		return count;
		
	}
}
