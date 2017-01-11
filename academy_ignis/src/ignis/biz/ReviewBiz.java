package ignis.biz;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import ignis.bean.ig_review;
import ignis.dao.ReviewDAO;
import ignis.mybatis.service.FactoryService;

public class ReviewBiz {
	static ReviewDAO reviewDao = new ReviewDAO();
	
	public static boolean insertReview(HttpServletRequest request, HttpServletResponse response) {
		HttpSession ss = request.getSession();
		String m_name = (String) ss.getAttribute("m_id");
//		String rb_title = request.getParameter("rb_title");
//		String rb_content = request.getParameter("rb_content");
//		String rb_file = request.getParameter("rb_file");
		String realFolder = "";
		String saveFolder = "/reviewUpload";
		int fileSize = 1024 * 1024 * 5;
		realFolder = request.getRealPath(saveFolder);
		
		ig_review reviewBean = new ig_review();
		
		boolean result = false;
		
		try{
			MultipartRequest multi = null;
			request.setCharacterEncoding("UTF-8");
			multi = new MultipartRequest(request, realFolder, fileSize, "UTF-8", new DefaultFileRenamePolicy());
			reviewBean.setRb_title(multi.getParameter("rb_title")); 
			reviewBean.setM_name(m_name);
			reviewBean.setRb_content(multi.getParameter("rb_content")); 
			if(multi.getFilesystemName((String) multi.getFileNames().nextElement()) == null){
				reviewBean.setRb_file("");
			} else {
				reviewBean.setRb_file(multi.getFilesystemName((String) multi.getFileNames().nextElement()));
			}
			result = reviewDao.insertReview(reviewBean);
			
		} catch (Exception e){
			e.printStackTrace();
		}
		return true;
	}
	
	public boolean upReadCount(HttpServletRequest request, HttpServletResponse response){
		int num = Integer.valueOf(request.getParameter("num"));
		boolean result = false;
		
		try {
			result = reviewDao.upReadCount(num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
		
	}
	
	public boolean updateReview(HttpServletRequest request, HttpServletResponse response){
//		System.out.println("ReviewBiz"+request.getParameter("num"));
//		int rb_num = Integer.parseInt(request.getParameter("num"));
//		String rb_title = request.getParameter("rb_title");
//		String rb_content = request.getParameter("rb_content");
//		String rb_file = request.getParameter("rb_file");
//		
//		
//		boolean result = reviewDao.updateReview(rb_num, rb_title, rb_content, rb_file);
//		
//		return result;
		HttpSession ss = request.getSession();
		String m_name = (String) ss.getAttribute("m_id");
		String realFolder = "";
		String saveFolder = "/reviewUpload";
		int fileSize = 1024 * 1024 * 5;
		realFolder = request.getRealPath(saveFolder);
		
		ig_review reviewBean = new ig_review();
		
		boolean result = false;
		
		try{
			MultipartRequest multi = null;
			request.setCharacterEncoding("UTF-8");
			multi = new MultipartRequest(request, realFolder, fileSize, "UTF-8", new DefaultFileRenamePolicy());
			reviewBean.setRb_num(Integer.parseInt(request.getParameter("num")));
			reviewBean.setRb_title(multi.getParameter("rb_title")); 
			reviewBean.setRb_content(multi.getParameter("rb_content")); 
			reviewBean.setRb_file(multi.getFilesystemName((String) multi.getFileNames().nextElement()));
			if(multi.getFilesystemName((String) multi.getFileNames().nextElement()) == null){
				reviewBean.setRb_file("");
			} else {
				reviewBean.setRb_file(multi.getFilesystemName((String) multi.getFileNames().nextElement()));
			}
			result = reviewDao.updateReview(reviewBean);
			System.out.println(multi.getParameter("rb_title"));
		} catch (Exception e){
			e.printStackTrace();
		}
		return true;
		
	}
	
	public boolean deleteReview(HttpServletRequest request, HttpServletResponse response){
		System.out.println("ReviewBizDelete"+request.getParameter("num"));
		int rb_num = Integer.parseInt(request.getParameter("num"));
		
		boolean result = reviewDao.deleteReview(rb_num);
		
		return result;
		
	}
	
	// 댓글
	public boolean insertComment(HttpServletRequest request, HttpServletResponse response) {
		int rb_num = Integer.parseInt(request.getParameter("num"));
		String m_name = request.getParameter("m_name");
		String co_content = request.getParameter("co_content");
		System.out.println(rb_num);
		System.out.println(m_name);
		System.out.println(co_content);
		System.out.println("ReviewBiz들어옴");
		boolean result = reviewDao.insertComment(m_name, co_content, rb_num);
		
		if (result) return result;
		else return result;
	}
	
	public boolean deleteComment(HttpServletRequest request, HttpServletResponse response){
		System.out.println("CommentBizDelete"+request.getParameter("coNum"));
		int co_num = Integer.parseInt(request.getParameter("coNum"));
		
		boolean result = reviewDao.deleteComment(co_num);
		
		return result;
		
	}
	
	
}
