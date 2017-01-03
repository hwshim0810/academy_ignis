package ignis.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ignis.biz.JoinBiz;

public class MemberJoinAction implements ActionInterface {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		JoinBiz joinBiz = new JoinBiz();
		joinBiz.insert(request, response);
		return null;
	}

}
