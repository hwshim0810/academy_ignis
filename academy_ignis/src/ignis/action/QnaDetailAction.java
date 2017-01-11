package ignis.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ignis.bean.*;
import ignis.biz.*;

public class QnaDetailAction  implements ActionInterface{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		QnaBiz qnaBiz = new QnaBiz();
		ActionForward forward = new ActionForward();
		int pagenum=1;//현재 페이지
		if(request.getParameter("pagenum")!=null){
			pagenum=Integer.parseInt(request.getParameter("pagenum"));
		}
		int qb_num=1;//상세정보 요청 number
		if(request.getParameter("qb_num")!=null){
			qb_num=Integer.parseInt(request.getParameter("qb_num"));
		}
		int readCount_change=qnaBiz.updateCount(qb_num);//조회수 +1
		List<ig_qna> list = qnaBiz.selectDetail(qb_num);//상세 정보 가져옴
		int qb_groupCount=qnaBiz.qb_groupCount(qb_num);//답변이 있는가 확인.2는 답변 있음
		String replyOwenr=qnaBiz.replyOwenr(qb_num);//답변의 문의자 ID
		if(readCount_change>0){System.out.println("readcount +1 성공");
		}else{System.out.println("readcount +1 실패");}
		
		request.setAttribute("pagenum", pagenum);
		request.setAttribute("qb_groupCount", qb_groupCount);
		request.setAttribute("replyOwenr", replyOwenr);
		request.setAttribute("qnaDetail", list);
		if (list !=null) {
			request.setAttribute("qnaDetail", list);
			String login = request.getParameter("login");//admin 이면 관지자창 이동
			if(login!=null&&login.equals("admin")){
				forward.setRedirect(false);
				forward.setPath("./admin/ad_CommunityQnaDetail.jsp?login=admin&pagenum="+pagenum);
				return forward;
			}
			forward.setRedirect(false);
			forward.setPath("./community/qnaDetail.jsp?pagenum="+pagenum);
			return forward;
		}
		
		return null;
	}
}
