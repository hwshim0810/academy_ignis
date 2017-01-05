package ignis.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ignis.bean.ig_notice;
import ignis.biz.NoticeBiz;

public class NoticeDetailAction  implements ActionInterface{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		NoticeBiz noticeBiz = new NoticeBiz();
		ActionForward forward = new ActionForward();
		
		int pagenum=1;//현재 페이지
		if(request.getParameter("pagenum")!=null){
			pagenum=Integer.parseInt(request.getParameter("pagenum"));
		}
		int nb_num=1;//상세정보 요청 number
		if(request.getParameter("nb_num")!=null){
			nb_num=Integer.parseInt(request.getParameter("nb_num"));
		}
		int readCount_change=noticeBiz.updateCount(nb_num);//조회수 +1
		List<ig_notice> list = noticeBiz.selectDetail(nb_num);//상세 정보 가져옴
		
		
		if(readCount_change>0){System.out.println("readcount +1 성공");
		}else{System.out.println("readcount +1 실패");}
		
		request.setAttribute("pagenum", pagenum);
		if (list !=null) {
			request.setAttribute("noticeDetail", list);
			forward.setRedirect(false);
			forward.setPath("./community/noticeDetail.jsp");
			return forward;
		}
		
		return null;
	}
}
