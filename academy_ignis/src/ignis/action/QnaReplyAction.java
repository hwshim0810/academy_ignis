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
		int qb_num=0;
		qb_num=qnaBiz.getMaxQb_num();//마지막 글의 NUM가져옴
		System.out.println("qb_num:"+qb_num);
		request.setAttribute("pagenum", pagenum);
		if (result) {
			String login = request.getParameter("login");//admin 이면 관지자창 이동
			if(login!=null&&login.equals("admin")){
				forward.setRedirect(true);
				forward.setPath("qnaDetail?login=admin&pagenum="+pagenum+"&qb_num="+qb_num);
				return forward;
			}
			forward.setRedirect(true);
			forward.setPath("qnaDetail?pagenum="+pagenum+"&qb_num="+qb_num);
			return forward;
		}
		
		return null;
	}
}
