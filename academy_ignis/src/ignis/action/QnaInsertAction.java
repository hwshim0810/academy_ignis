package ignis.action;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import ignis.biz.NoticeBiz;
import ignis.biz.QnaBiz;

public class QnaInsertAction implements ActionInterface {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		QnaBiz qnaBiz = new QnaBiz();
		ActionForward forward = new ActionForward();
		
		boolean result = qnaBiz.insert(request, response);

		if (result) {
			forward.setRedirect(true);
			forward.setPath("/academy_ignis/qna");
			return forward;
		}
		
		return null;
	}

}
