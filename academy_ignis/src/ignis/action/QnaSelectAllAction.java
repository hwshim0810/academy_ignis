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
		
		request.removeAttribute("qb_groupCount");
		request.removeAttribute("replyOwenr");
		request.removeAttribute("qnaDetail");
		request.removeAttribute("qnalist");
		
		int pagenum=1;//현재 페이지
		if(request.getParameter("pagenum")!=null){
			pagenum=Integer.parseInt(request.getParameter("pagenum"));
		}
		
		List<ig_qna> list = noticeBiz.selectAll(request,response);
		request.setAttribute("qnalist", list);
		
		if (list !=null) {
			String login = request.getParameter("login");//admin 이면 관지자창 이동
			if(login!=null&&login.equals("admin")){
				forward.setRedirect(false);
				forward.setPath("/admin/ad_CommunityQnaList.jsp?login=admin&pagenum="+pagenum);
				return forward;
			}else {
			forward.setRedirect(false);
			forward.setPath("/community/qna.jsp?pagenum="+pagenum);
			return forward;
			}
		}
		
		return null;
	}
}
