package ignis.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ignis.bean.*;
import ignis.biz.*;

public class QnaReplyAction  implements ActionInterface{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		QnaBiz qnaBiz = new QnaBiz();
		ActionForward forward = new ActionForward();
		
		int pagenum=1;//현재 페이지
		if(request.getParameter("pagenum")!=null){
			pagenum=Integer.parseInt(request.getParameter("pagenum"));
		}
		boolean result =qnaBiz.insertReply(request, response);
		
		request.setAttribute("pagenum", pagenum);
		if (result) {
			forward.setRedirect(false);
			forward.setPath("./community/qnaDetail.jsp");
			return forward;
		}
		
		return null;
	}
}
