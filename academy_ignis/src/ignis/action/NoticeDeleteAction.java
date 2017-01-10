package ignis.action;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import ignis.bean.*;
import ignis.biz.*;
import ignis.dao.MemberDAO;

public class NoticeDeleteAction  implements ActionInterface{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		NoticeBiz noticeBiz = new NoticeBiz();
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
			forward.setRedirect(true);
			forward.setPath("./notice?login=admin");
			return forward;
		}
		
		boolean result =noticeBiz.delete(request, response);
		if (result) {
			forward.setRedirect(false);
			forward.setPath("./notice?login=admin&pagenum="+pagenum);
			return forward;
		}
		
		return null;
	}
}
