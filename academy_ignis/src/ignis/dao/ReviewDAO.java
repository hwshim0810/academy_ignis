package ignis.dao;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import ignis.bean.User;
import ignis.bean.ig_comment;
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
	
	// 댓글 기능
	public List<ig_comment> commentList(int begin, int end, int rb_num){
		SqlSession ss = FactoryService.getFactory().openSession(true);
		
		HashMap<String, Integer> map = new HashMap<>();
		
		map.put("begin", begin);
		map.put("end", end);
		map.put("rb_num", rb_num);
		
		List<ig_comment> list = ss.selectList("review.selectAllComment", map);
		
		ss.close();
		
		return list;
	}
	
	public int getListCommentCount(int rb_num){
		SqlSession ss = FactoryService.getFactory().openSession();
		int count = ss.selectOne("review.selectListCommentCount", rb_num);
		
		ss.close();
		
		return count;
	}
	
	public static boolean insertComment(String m_name, String co_content, int rb_num){
		SqlSession ss = FactoryService.getFactory().openSession(true);
		HashMap<String, Object> map = new HashMap<>();
		
		System.out.println("insertComment DAO들어옴");
		map.put("rb_num", rb_num);
		map.put("m_name", m_name);
		map.put("co_content", co_content);
		System.out.println(rb_num + " " +m_name + " " + co_content);
		
		int cnt = ss.insert("review.insertComment", map);
		
		if(cnt > 0 ){
			System.out.println("comment 추가 성공!");
		} else{
			System.out.println("comment 추가 실패");
		}
		
		ss.commit();
		ss.close();
		return(cnt > 0) ? true : false;
	}
	
	public boolean deleteComment(int co_num){
		SqlSession ss = FactoryService.getFactory().openSession(true);
		System.out.println(co_num+" ////deleteCommentDAO//");
		
		int result = ss.delete("review.deleteComment", co_num);
		
		ss.commit();
		ss.close();
		
		return(result > 0) ? true : false;
	} 
	
	public int getReviewCount(String m_id) {
		SqlSession ss = FactoryService.getFactory().openSession();
		
		int count = ss.selectOne("review.selectReviewCount", m_id);
		ss.close();
		
		return count;
	}
	
	public int getReplyCount(String m_id) {
		SqlSession ss = FactoryService.getFactory().openSession();
		
		int count = ss.selectOne("comment.selectReplyCount", m_id);
		ss.close();
		
		return count;
	}
	
	// 검색기능
	public List<ig_review> getSearchReview(String type, String content, int begin, int end) {
		SqlSession ss = FactoryService.getFactory().openSession();
		HashMap<String, Object> map = new HashMap<>();
		List<ig_review> list = null;
		
		if (!type.equals("review_all")) map.put("content", content);
		
		map.put("begin", begin);	
		map.put("end", end);
		
		switch (type) {
		case "review_title":
			list = ss.selectList("review.searchByTitle", map);
			break;
		case "review_writer":
			list = ss.selectList("review.searchByWriter", map);
			break;
		case "review_regdate":
			list = ss.selectList("review.searchByDate", map);
			break;
		case "review_all":
			list = ss.selectList("review.selectAll", map);
			break;

		default:
			break;
		}
		
		ss.close();
		
		return list;
	}
	
	public int getSearchCount(String type, String content) {
		SqlSession ss = FactoryService.getFactory().openSession();
		
		int count = 0;
		
		switch (type) {
		case "review_title":
			count = ss.selectOne("review.countByTitle", content);
			break;
		case "review_writer":
			count = ss.selectOne("review.countByWriter", content);
			break;
		case "review_regdate":
			count = ss.selectOne("review.countByDate", content);
			break;
		case "review_all":
			count = ss.selectOne("review.selectReviewListCount");
			break;
		
		default:
			break;
		}
		
		ss.close();
		return count;
	}
	
}
