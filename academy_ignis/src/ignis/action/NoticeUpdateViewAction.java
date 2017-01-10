package ignis.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ignis.bean.*;
import ignis.biz.*;

public class NoticeUpdateViewAction  implements ActionInterface{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		NoticeBiz noticeBiz = new NoticeBiz();
		ActionForward forward = new ActionForward();
		int pagenum=1;//현재 페이지
		if(request.getParameter("pagenum")!=null){
			pagenum=Integer.parseInt(request.getParameter("pagenum"));
		}

		
		List<ig_notice> list = noticeBiz.selectDetail(request,response);//상세 정보 가져옴

		request.setAttribute("pagenum", pagenum);
		request.setAttribute("noticeDetail", list);
		if (list !=null) {
			
			forward.setRedirect(false);
			forward.setPath("./admin/ad_CommunityNoticeUpdate.jsp?login=admin");
			return forward;
		}
		
		return null;
	}
}
