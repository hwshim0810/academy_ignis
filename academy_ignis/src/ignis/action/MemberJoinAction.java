package ignis.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ignis.biz.LoginBiz;

public class MemberJoinAction implements ActionInterface {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		LoginBiz loginBiz = new LoginBiz();
		loginBiz.insert(request, response);
		return null;
	}

}
