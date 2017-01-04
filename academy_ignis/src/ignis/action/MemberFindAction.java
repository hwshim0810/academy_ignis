package ignis.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ignis.biz.FindBiz;

public class MemberFindAction implements ActionInterface {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		FindBiz findBiz = new FindBiz();
		
		String findMethod = request.getParameter("find");
		if (findMethod.equals("id")) {
			String id = null;
			id = findBiz.getUserId(request, response);
			if (id == null) {
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('아이디가 존재하지 않습니다.');");
				out.println("location.href='/academy_ignis/searchUser';");
				out.println("</script>");
				out.close();
				return null;
			} else {
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('회원님의 아이디는 "+ id + " 입니다.');");
				out.println("location.href='/academy_ignis/searchUser';");
				out.println("</script>");
				out.close();
				return null;
			}
		}
		else {
			boolean result = findBiz.getUserPass(request, response);
			
			if (result) {
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('등록된 이메일로 임시비밀번호를 발송하였습니다.');");
				out.println("location.href='/academy_ignis';");
				out.println("</script>");
				out.close();
				return null;
			} else {
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('등록된 회원정보가 존재하지 않습니다.');");
				out.println("location.href='/academy_ignis/searchUser';");
				out.println("</script>");
				out.close();
				return null;
			}
		}
	}

}
