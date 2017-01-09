package ignis.biz;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import ignis.bean.ig_review;
import ignis.dao.ReviewDAO;

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
			multi = new MultipartRequest(request, realFolder, fileSize, "UTF-8", new DefaultFileRenamePolicy());
			reviewBean.setRb_title(multi.getParameter("rb_title")); 
			reviewBean.setM_name(m_name);
			reviewBean.setRb_content(multi.getParameter("rb_content")); 
			reviewBean.setRb_file(multi.getFilesystemName((String) multi.getFileNames().nextElement()));
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
}
