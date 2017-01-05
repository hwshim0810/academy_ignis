package ignis.biz;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ignis.bean.ig_event;
import ignis.dao.EventDAO;

public class EventBiz {
	EventDAO eventDao = new EventDAO();

	public boolean insertEvent(HttpServletRequest request, HttpServletResponse response) {
		//int eb_num = Integer.parseInt(request.getParameter("eb_num"));
		String eb_title = request.getParameter("eb_title");
		String eb_content = request.getParameter("eb_content");
		 
		boolean result = eventDao.insertEvent(eb_title, eb_content);
		
		if (result) return result;
		else return result;
	}
	
	public List<ig_event> eventList(){
		List<ig_event> list = eventDao.eventList();
		
		return list;
	}
	
	public boolean updateEvent(HttpServletRequest request, HttpServletResponse response){
		System.out.println("EventBiz"+request.getParameter("num"));
		int eb_num = Integer.parseInt(request.getParameter("num"));
		String eb_title = request.getParameter("eb_title");
		String eb_content = request.getParameter("eb_content");
		
		boolean result = eventDao.updateEvent(eb_num, eb_title, eb_content);
		
		return result;
		
	}
}
