package ignis.biz;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ignis.bean.ig_notice;
import ignis.dao.MemberDAO;
import ignis.dao.noticeDAO;

public class NoticeBiz {
	
	public boolean insert(HttpServletRequest request, HttpServletResponse response) {
		noticeDAO noticeDao = new noticeDAO();
	

		String nb_title = request.getParameter("nb_title");
		String nb_content = request.getParameter("nb_content");

		boolean result = noticeDao.insert(nb_title, nb_content);
		
		if (result) return result;
		else return result;
	}

	public List<ig_notice> selectAll(int startRowNum,int endRowNum) {
		noticeDAO noticeDao = new noticeDAO();
		List<ig_notice> list = noticeDao.selectAll(startRowNum,endRowNum);

		return list;
	}
	public int getListcount() {
		noticeDAO noticeDao = new noticeDAO();
		int listCount = noticeDao.getListcount();
		
		return listCount;
	}
}
