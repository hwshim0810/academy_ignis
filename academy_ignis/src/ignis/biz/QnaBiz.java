package ignis.biz;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import ignis.bean.ig_notice;
import ignis.bean.ig_qna;
import ignis.dao.MemberDAO;
import ignis.dao.NoticeDAO;
import ignis.dao.QnaDAO;

public class QnaBiz {
	
	public boolean insert(HttpServletRequest request, HttpServletResponse response) {
		QnaDAO qnaDao = new QnaDAO();
		String qb_mal=request.getParameter("qb_mal");
		HttpSession session = request.getSession();
		String m_id = (String)session.getAttribute("m_id");
		String qb_title = request.getParameter("qb_title");
		String qb_content = request.getParameter("qb_content");
		int qb_private=Integer.parseInt(request.getParameter("qb_private"));
		boolean result = qnaDao.insert(qb_mal,m_id,qb_title,qb_content,qb_private);
		if (result) return result;
		else return result;
	}
	
	public boolean insertReply(HttpServletRequest request, HttpServletResponse response) {
		QnaDAO qnaDao = new QnaDAO();
		String qb_mal=request.getParameter("qb_mal");
		HttpSession session = request.getSession();
		String m_id = (String)session.getAttribute("m_id");
		String qb_title = request.getParameter("qb_title");
		String qb_content = request.getParameter("qb_content");
		int qb_private=Integer.parseInt(request.getParameter("qb_private"));
		int qb_groupnum=Integer.parseInt(request.getParameter("qb_groupnum"));
		boolean result = qnaDao.insertReply(qb_mal,m_id,qb_title,qb_content,qb_private,qb_groupnum);
		if (result) return result;
		else return result;
	}

	public List<ig_qna> selectAll(int startRowNum,int endRowNum) {
		QnaDAO qnaDao = new QnaDAO();
		List<ig_qna> list = qnaDao.selectAll(startRowNum,endRowNum);

		return list;
	}
	
	public List<ig_qna> searchAll(int startRowNum,int endRowNum,String searchOption,String searchContent) {
		QnaDAO qnaDao = new QnaDAO();
		List<ig_qna> list = qnaDao.searchAll(startRowNum,endRowNum,searchOption,searchContent);
		return list;
	}
	
	public int getListcount() {
		QnaDAO qnaDao = new QnaDAO();
		int listCount = qnaDao.getListcount();
		
		return listCount;
	}

	public List<ig_qna> selectDetail(int nb_num) {
		QnaDAO qnaDao = new QnaDAO();
		List<ig_qna> list = qnaDao.selectDetail(nb_num);
		return list;
	}

	public String replyOwenr(int nb_num) {
		QnaDAO qnaDao = new QnaDAO();
		String replyOwenr = qnaDao.replyOwenr(nb_num);
		return replyOwenr;
	}
	public int updateCount(int nb_num) {
		QnaDAO qnaDao = new QnaDAO();
		int readCount_change = qnaDao.updateCount(nb_num);
		return readCount_change;
	}
	
	public int qb_groupCount(int qb_groupnum) {
		QnaDAO qnaDao = new QnaDAO();
		int qb_groupCount = qnaDao.qb_groupCount(qb_groupnum);
		return qb_groupCount;
	}
}
