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

		List<ig_notice> list=noticeBiz.selectAll(request,response);
		
		int pagenum=1;//현재 페이지
		if(request.getParameter("pagenum")!=null){
			pagenum=Integer.parseInt(request.getParameter("pagenum"));
		}
		
		if (list !=null) {
			request.setAttribute("noticelist", list);
			String login = request.getParameter("login");//admin 이면 관지자창 이동
			if(login!=null&&login.equals("admin")){
				forward.setRedirect(false);
				forward.setPath("/admin/ad_CommunityNoticeList.jsp?login=admin&pagenum=" + pagenum);
				return forward;
			}else{
			forward.setRedirect(false);
			forward.setPath("/community/notice.jsp");
			return forward;
			}
		}
		
		return null;
	}
}
