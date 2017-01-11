package ignis.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ignis.bean.ig_notice;
import ignis.biz.NoticeBiz;

public class NoticeSelectAllAction  implements ActionInterface{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		NoticeBiz noticeBiz = new NoticeBiz();
		ActionForward forward = new ActionForward();
		
		int pagenum=1;//현재 페이지
		int pagelimit=10;//한 페이지 리스트수
		int pageCount=10;//마지막 페이지
		int startpage=1;//페이지 범위
		int endpage=10;//페이지 범위
		
		if(request.getParameter("pagenum")!=null){
			pagenum=Integer.parseInt(request.getParameter("pagenum"));
			System.out.println("pagenum을 request에서 가져옴:"+request.getParameter("pagenum"));
		}
		
		int startRowNum=(pagenum-1)*pagelimit+1;//가져오는 리스트
		int endRowNum=startRowNum+pagelimit-1;//가져오는 리스트
		int listCount=noticeBiz.getListcount();//총 리스트 수
		List<ig_notice> list=null;
		String  searchOption= request.getParameter("searchOption");
		String  searchContent= request.getParameter("searchContent");
		if(request.getAttribute("searchOption")!=null&&request.getAttribute("searchContent")!=null){
			searchOption=request.getAttribute("searchOption").toString();
			searchContent=request.getAttribute("searchContent").toString();
		}
		if(searchContent!=null&&searchOption!=null){
			list= noticeBiz.searchAll(startRowNum, endRowNum, searchOption, searchContent);
			listCount=noticeBiz.getListcount(searchOption,searchContent);
			request.setAttribute("searchOption", searchOption);
			request.setAttribute("searchContent", searchContent);
		}else{
			list = noticeBiz.selectAll(startRowNum,endRowNum);
			}
		

		if(listCount%pagelimit==0){
			pageCount = listCount/pagelimit;//총 리스트수로 페이지수 계산
		}else{
			pageCount = listCount/pagelimit+1;
		}
		startpage= ((pagenum-1)/10)*10+1;
		endpage=startpage+10-1;
		request.setAttribute("pagenum", pagenum);
		request.setAttribute("pagelimit", pagelimit);
		request.setAttribute("pageCount", pageCount);
		request.setAttribute("startpage", startpage);
		request.setAttribute("endpage", endpage);
		request.setAttribute("noticelist", list);
		if (list !=null) {
			String login = request.getParameter("login");//admin 이면 관지자창 이동
			if(login!=null&&login.equals("admin")){
				forward.setRedirect(false);
				forward.setPath("/admin/ad_CommunityNoticeList.jsp?login=admin&pagenum=" + pagenum);
				return forward;
			}else{
			forward.setRedirect(false);
			forward.setPath("./community/notice.jsp");
			return forward;
			}
		}
		
		return null;
	}
}
