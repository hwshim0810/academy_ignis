package ignis.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ignis.bean.ig_notice;
import ignis.bean.ig_qna;
import ignis.biz.NoticeBiz;
import ignis.biz.QnaBiz;

public class QnaSelectAllAction  implements ActionInterface{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		QnaBiz noticeBiz = new QnaBiz();
		ActionForward forward = new ActionForward();
		
		int pagenum=1;//현재 페이지
		int pagelimit=10;//한 페이지 리스트수
		int pageCount=10;//마지막 페이지
		int startpage=1;//페이지 범위
		int endpage=10;//페이지 범위
		if(request.getParameter("pagenum")!=null){
			pagenum=Integer.parseInt(request.getParameter("pagenum"));
			System.out.println("pagenum을 request에서 가져옴:"+request.getParameter("pagenum"));
		}
		
		int startRowNum=(pagenum-1)*pagelimit+1;//가져오는 리스트
		int endRowNum=startRowNum+pagelimit-1;//가져오는 리스트
		int listCount=noticeBiz.getListcount();//총 리스트 수
		if(listCount%pagelimit==0){
			pageCount = listCount/pagelimit;//총 리스트수로 페이지수 계산
		}else{
			pageCount = listCount/pagelimit+1;
		}
		startpage= ((pagenum-1)/10)*10+1;
		endpage=startpage+10-1;
		
		List<ig_qna> list = noticeBiz.selectAll(startRowNum,endRowNum);
		request.setAttribute("pagenum", pagenum);
		request.setAttribute("pagelimit", pagelimit);
		request.setAttribute("pageCount", pageCount);
		request.setAttribute("startpage", startpage);
		request.setAttribute("endpage", endpage);
		if (list !=null) {
			request.setAttribute("qnalist", list);
			forward.setRedirect(false);
			forward.setPath("./community/qna.jsp");
			
			return forward;
		}
		
		return null;
	}
}
