package ignis.biz;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ignis.bean.ig_notice;
import ignis.dao.NoticeDAO;

public class NoticeBiz {
	
	public boolean insert(HttpServletRequest request, HttpServletResponse response) {
		NoticeDAO noticeDao = new NoticeDAO();
	

		String nb_title = request.getParameter("nb_title");
		String nb_content = request.getParameter("nb_content");

		boolean result = noticeDao.insert(nb_title, nb_content);
		
		if (result) return result;
		else return result;
	}

	public List<ig_notice> selectAll(HttpServletRequest request, HttpServletResponse response) {
		NoticeDAO noticeDao = new NoticeDAO();
		int pagenum=1;//현재 페이지
		int pagelimit=10;//한 페이지 리스트수
		int pageCount=10;//마지막 페이지
		int startpage=1;//페이지 범위
		int endpage=10;//페이지 범위
		if(request.getParameter("pagenum")!=null){
			pagenum=Integer.parseInt(request.getParameter("pagenum"));
		}
		int startRowNum=(pagenum-1)*pagelimit+1;//가져오는 리스트
		int endRowNum=startRowNum+pagelimit-1;//가져오는 리스트
		int listCount=noticeDao.getListcount();//총 리스트 수
		List<ig_notice> list=null;
		
		String  searchOption= request.getParameter("searchOption");
		String  searchContent= request.getParameter("searchContent");
		if(request.getAttribute("searchOption")!=null&&request.getAttribute("searchContent")!=null){
			searchOption=request.getAttribute("searchOption").toString();
			searchContent=request.getAttribute("searchContent").toString();
		}
		if(searchContent!=null&&searchOption!=null){
			list= noticeDao.searchAll(startRowNum, endRowNum, searchOption, searchContent);
			listCount=noticeDao.getListcount(searchOption,searchContent);
			request.setAttribute("searchOption", searchOption);
			request.setAttribute("searchContent", searchContent);
		}else{
			list = noticeDao.selectAll(startRowNum,endRowNum);
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
		
		return list;
	}
	
	public List<ig_notice> searchAll(int startRowNum,int endRowNum,String searchOption,String searchContent) {
		NoticeDAO noticeDao = new NoticeDAO();
		List<ig_notice> list = noticeDao.searchAll(startRowNum,endRowNum,searchOption,searchContent);
		return list;
	}
	public int getListcount() {
		NoticeDAO noticeDao = new NoticeDAO();
		int listCount = noticeDao.getListcount();
		
		return listCount;
	}

	public List<ig_notice> selectDetail(HttpServletRequest request, HttpServletResponse response) {
		NoticeDAO noticeDao = new NoticeDAO();
		int nb_num=1;//상세정보 요청 number
		if(request.getParameter("nb_num")!=null){
			nb_num=Integer.parseInt(request.getParameter("nb_num"));
		}
		List<ig_notice> list = noticeDao.selectDetail(nb_num);

		return list;
	}

	public int updateCount(int nb_num) {
		NoticeDAO noticeDao = new NoticeDAO();
		int readCount_change = noticeDao.updateCount(nb_num);
		return readCount_change;
	}

	public boolean delete(HttpServletRequest request, HttpServletResponse response) {
		NoticeDAO noticeDao = new NoticeDAO();
		int nb_num=Integer.parseInt(request.getParameter("nb_num"));
		boolean result=false;
		result = noticeDao.delete(nb_num);
		
		return result;
	}

	public boolean update(HttpServletRequest request, HttpServletResponse response) {
		NoticeDAO noticeDao = new NoticeDAO();
		int nb_num=Integer.parseInt(request.getParameter("nb_num"));
		String nb_title = request.getParameter("nb_title");//수정 내용
		String nb_content = request.getParameter("nb_content");
		boolean result=false;
		result = noticeDao.update(nb_num,nb_title,nb_content);
		
		return result;
	}

	public int getListcount(String searchOption, String searchContent) {
		NoticeDAO noticeDao = new NoticeDAO();
		int listCount = noticeDao.getListcount(searchOption,searchContent);
		return listCount;
	}
}
