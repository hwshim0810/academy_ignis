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

	public List<ig_qna> selectAll(HttpServletRequest request, HttpServletResponse response) {
		QnaDAO qnaDao = new QnaDAO();
		
		int pagenum=1;//현재 페이지
		if(request.getParameter("pagenum")!=null){
			pagenum=Integer.parseInt(request.getParameter("pagenum"));
		}
		int pagelimit=10;//한 페이지 리스트수
		int pageCount=10;//마지막 페이지
		int startpage=1;//페이지 범위
		int endpage=10;//페이지 범위
		int startRowNum=(pagenum-1)*pagelimit+1;//가져오는 리스트
		int endRowNum=startRowNum+pagelimit-1;//가져오는 리스트
		int listCount=qnaDao.getListcount();//총 리스트 수
		if(listCount%pagelimit==0){
			pageCount = listCount/pagelimit;//총 리스트수로 페이지수 계산
		}else{
			pageCount = listCount/pagelimit+1;
		}
		startpage= ((pagenum-1)/10)*10+1;
		endpage=startpage+10-1;
		request.setAttribute("pagenum", pagenum);
		request.setAttribute("pagelimit", pagelimit);
		request.setAttribute("pageCount", pageCount);
		request.setAttribute("startpage", startpage);
		request.setAttribute("endpage", endpage);
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

	public List<ig_qna> selectDetail(HttpServletRequest request, HttpServletResponse response) {
		QnaDAO qnaDao = new QnaDAO();
		
		int qb_num=1;//상세정보 요청 number
		if(request.getParameter("qb_num")!=null){
			qb_num=Integer.parseInt(request.getParameter("qb_num"));
		}
		List<ig_qna> list = qnaDao.selectDetail(qb_num);
		int readCount_change=qnaDao.updateCount(qb_num);//조회수 +1
		int qb_groupCount=qnaDao.qb_groupCount(qb_num);//답변이 있는가 확인.2는 답변 있음
		String replyOwenr=qnaDao.replyOwenr(qb_num);//답변의 문의자 ID
		
		if(readCount_change>0){System.out.println("readcount +1 성공");
		}else{System.out.println("readcount +1 실패");}

		request.setAttribute("qb_groupCount", qb_groupCount);
		request.setAttribute("replyOwenr", replyOwenr);
		request.setAttribute("qnaDetail", list);
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

	public boolean qnaDelete(HttpServletRequest request, HttpServletResponse response) {
		QnaDAO qnaDao = new QnaDAO();
		
		int qb_num=0;//삭제할 번호. 답변이 없거나 답변글 일 경우
		if(request.getParameter("qb_num")!=null){
			qb_num=Integer.parseInt(request.getParameter("qb_num"));
		}
		int qb_groupnum=0;//삭제할 그룹. 답변이 있을 경우
		if(request.getParameter("qb_groupnum")!=null){
			qb_groupnum=Integer.parseInt(request.getParameter("qb_groupnum"));
		}
		boolean result=false;
		if(qb_num>0){
			result = qnaDao.qnaDeleteQb_num(qb_num);
		}
		if(qb_groupnum>0){
			result = qnaDao.qnaDeleteQb_groupnum(qb_groupnum);
		}
		
		
		return result;
	}

	public boolean update(HttpServletRequest request, HttpServletResponse response) {
		QnaDAO qnaDao = new QnaDAO();
		int qb_num=0;//삭제할 번호. 답변이 없거나 답변글 일 경우
		if(request.getParameter("qb_num")!=null){
			qb_num=Integer.parseInt(request.getParameter("qb_num"));
		}
		String qb_title = request.getParameter("qb_title");//수정 내용
		String qb_content = request.getParameter("qb_content");
		boolean result = qnaDao.update(qb_num,qb_title,qb_content);
		return result;
	}

	public int getMaxQb_num() {
		QnaDAO qnaDao = new QnaDAO();
		int MaxQb_num=qnaDao.getMaxQb_num();
		return MaxQb_num;
	}
}
