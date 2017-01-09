package ignis.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ignis.bean.*;
import ignis.biz.*;

public class QnaDeleteAction  implements ActionInterface{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		QnaBiz qnaBiz = new QnaBiz();
		ActionForward forward = new ActionForward();
		
		int pagenum=1;//현재 페이지
		if(request.getParameter("pagenum")!=null){
			pagenum=Integer.parseInt(request.getParameter("pagenum"));
		}
		int nb_num=1;//상세정보 요청 number
		if(request.getParameter("qb_num")!=null){
			nb_num=Integer.parseInt(request.getParameter("qb_num"));
		}
		
		boolean result =qnaBiz.qnaDelete(request, response);
		
		request.setAttribute("pagenum", pagenum);
		if (result) {
			forward.setRedirect(true);
			forward.setPath("./qna");
			return forward;
		}
		
		return null;
	}
}
