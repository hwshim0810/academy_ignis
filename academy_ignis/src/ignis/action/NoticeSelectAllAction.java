package ignis.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ignis.bean.ig_notice;
import ignis.biz.NoticeBiz;

public class NoticeSelectAllAction  implements ActionInterface{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		NoticeBiz noticeBiz = new NoticeBiz();
		ActionForward forward = new ActionForward();
		
		List<ig_notice> list = noticeBiz.selectAll();
		
		if (list !=null) {
			request.setAttribute("noticlist", list);
			forward.setRedirect(false);
			forward.setPath("./community/notice.jsp");
			return forward;
		}
		
		return null;
	}
}
