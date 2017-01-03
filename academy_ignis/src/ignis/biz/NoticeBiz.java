package ignis.biz;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ignis.dao.MemberDAO;
import ignis.dao.noticeDAO;

public class NoticeBiz {
	
	public boolean insert(HttpServletRequest request, HttpServletResponse response) {
		noticeDAO noticeDao = new noticeDAO();
	
		String nb_num = request.getParameter("nb_num");
		String nb_title = request.getParameter("nb_title");
		String nb_content = request.getParameter("nb_content");

		boolean result = noticeDao.insert(nb_num, nb_title, nb_content);
		
		if (result) return result;
		else return result;
	}
}
