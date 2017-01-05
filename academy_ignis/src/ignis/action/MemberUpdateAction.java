package ignis.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ignis.biz.MemChangeBiz;

public class MemberUpdateAction implements ActionInterface {
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		MemChangeBiz memBiz = new MemChangeBiz();
		ActionForward forward = new ActionForward();
		
		int result = memBiz.update(request, response);
		
		switch (result) {
		case MemChangeBiz.ADSUCCESS:
			forward.setRedirect(true);
			forward.setPath("./login");
			break;
		
		case MemChangeBiz.ADFAIL:
			forward.setRedirect(true);
			forward.setPath("./login");
			break;
		
		case MemChangeBiz.USERSUCCESS:
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out2 = response.getWriter();
			out2.println("<script>");
			out2.println("alert('수정되었습니다.');");
			out2.println("location.href='/academy_ignis/myPage';");
			out2.println("</script>");
			out2.close();
			return null;
		
		case MemChangeBiz.USERFAIL:
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out3 = response.getWriter();
			out3.println("<script>");
			out3.println("alert('수정실패하였습니다.');");
			out3.println("location.href='/academy_ignis/myPage';");
			out3.println("</script>");
			out3.close();
			return null;
			
		case MemChangeBiz.PASSSUCCESS:
			forward.setRedirect(true);
			forward.setPath("./login");
			break;
		
		case MemChangeBiz.PASSFAIL:
			forward.setRedirect(true);
			forward.setPath("./login");
			break;

		default:
			System.out.println("업데이트 예외");
			break;
		}
		
		return null;
	}

}
