package ignis.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import ignis.bean.ig_event;
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
	
	public static boolean insertReview(ig_review reviewBean){
		SqlSession ss = FactoryService.getFactory().openSession(true);
		HashMap<String, Object> map = new HashMap<>();
		
		map.put("rb_title", reviewBean.getRb_title());
		map.put("m_name", reviewBean.getM_name());
		map.put("rb_content", reviewBean.getRb_content());
		map.put("rb_file", reviewBean.getRb_file());
		
		int cnt = ss.insert("review.insertReview", map);
		
		if(cnt > 0 ){
			System.out.println("review 추가 성공!");
		} else{
			System.out.println("review 추가 실패");
		}
		
		ss.commit();
		ss.close();
		return(cnt > 0) ? true : false;
	}
	
	public boolean upReadCount(int rb_num) throws Exception{
		SqlSession ss = FactoryService.getFactory().openSession(true);

		int result = ss.update("review.upReadCount", rb_num);
		
		ss.close();
		
		return(result > 0) ? true : false;
	}
	
	public ig_review reviewSelectOne(int rb_num){
		SqlSession ss = FactoryService.getFactory().openSession();
		ig_review view = ss.selectOne("review.selectNum", rb_num);
		
		return view;
	}
	
	public boolean updateReview(ig_review reviewBean){
//		SqlSession ss = FactoryService.getFactory().openSession(true);
//		HashMap<String, Object> map = new HashMap<>();
//		System.out.println(rb_num+" ////DAO//");
//
//		map.put("rb_num", rb_num);
//		map.put("rb_title", rb_title);
//		map.put("rb_content", rb_content);
//		map.put("rb_file", rb_file);
//		
//		int result = ss.update("review.updateReview", map);
//		System.out.println(rb_num+" ////DAO2//");
//		ss.commit();
//		ss.close();
//		
//		return(result > 0) ? true : false;
		SqlSession ss = FactoryService.getFactory().openSession(true);
		HashMap<String, Object> map = new HashMap<>();
		map.put("rb_num", reviewBean.getRb_num());
		map.put("rb_title", reviewBean.getRb_title());
		map.put("rb_content", reviewBean.getRb_content());
		map.put("rb_file", reviewBean.getRb_file());
		
		
		int cnt = ss.update("review.updateReview", map);
		
		if(cnt > 0 ){
			System.out.println("review 수정 성공!");
		} else{
			System.out.println("review 수정 실패");
		}
		
		ss.commit();
		ss.close();
		return(cnt > 0) ? true : false;
	}
	
	public boolean deleteReview(int rb_num){
		SqlSession ss = FactoryService.getFactory().openSession(true);
		System.out.println(rb_num+" ////deleteDAO//");
		
		int result = ss.delete("review.deleteReview", rb_num);
		
		ss.commit();
		ss.close();
		
		return(result > 0) ? true : false;
	} 
}
