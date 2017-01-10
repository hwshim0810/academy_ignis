package ignis.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import ignis.bean.*;
import ignis.biz.*;
import ignis.dao.MemberDAO;

public class QnaUpdateAction  implements ActionInterface{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		QnaBiz qnaBiz = new QnaBiz();
		MemberDAO memDao = MemberDAO.getInstance();
		ActionForward forward = new ActionForward();
		
		int pagenum=1;//현재 페이지
		if(request.getParameter("pagenum")!=null){
			pagenum=Integer.parseInt(request.getParameter("pagenum"));
		}
		String m_pass=request.getParameter("password");
		HttpSession session = request.getSession();
		String m_id = (String)session.getAttribute("m_id");
		User user = memDao.isMember(m_id);
		System.out.println(request.getParameter("password"));
		System.out.println(user.getM_pass());
		if (user == null||!m_pass.equals(user.getM_pass())){
			System.out.println("비밀번호 일치하지 않음");
			forward.setRedirect(true);
			forward.setPath("./qna");
			return forward;
		}
		int qb_num=0;
		if(request.getParameter("qb_num")!=null){
			qb_num=Integer.parseInt(request.getParameter("qb_num"));
		}
		boolean result =qnaBiz.update(request, response);
		System.out.println(result);
		if (result) {
			forward.setRedirect(false);
			forward.setPath("/qnaDetail?qb_num="+qb_num+"&pagenum="+pagenum);
			return forward;
		}
		
		return null;
	}
}
