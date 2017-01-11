package ignis.action;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import ignis.bean.*;
import ignis.biz.*;
import ignis.dao.MemberDAO;

public class QnaDeleteAction  implements ActionInterface{
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
		if (user == null||!m_pass.equals(user.getM_pass())){
			System.out.println("비밀번호 일치하지 않음");
			forward.setRedirect(true);
			forward.setPath("./qna");
			return forward;
		}
		
		boolean result =qnaBiz.qnaDelete(request, response);
		
		request.setAttribute("pagenum", pagenum);
		if (result) {
			String login = request.getParameter("login");//admin 이면 관지자창 이동
			if(login!=null&&login.equals("admin")){
				forward.setRedirect(false);
				forward.setPath("./qna?login=admin&pagenum="+pagenum);
				return forward;
			}
			forward.setRedirect(false);
			forward.setPath("./qna");
			return forward;
		}
		
		return null;
	}
}
