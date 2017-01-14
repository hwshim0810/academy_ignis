package ignis.biz;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ignis.action.EventEntryPlusAction;
import ignis.bean.ig_event;
import ignis.bean.ig_evententry;
import ignis.dao.EventDAO;

public class EventBiz {
	EventDAO eventDao = new EventDAO();

	public boolean insertEvent(HttpServletRequest request, HttpServletResponse response) {
		//int eb_num = Integer.parseInt(request.getParameter("eb_num"));
		String eb_title = request.getParameter("eb_title");
		String eb_content = request.getParameter("eb_content");
		int eb_winner = Integer.parseInt(request.getParameter("eb_winner"));
		String eb_period = request.getParameter("eb_period");
		String eb_announceday = request.getParameter("eb_announceday");
		 
		boolean result = eventDao.insertEvent(eb_title, eb_content, eb_winner, eb_period, eb_announceday);
		
		if (result) return result;
		else return result;
	}
	
	public boolean updateEvent(HttpServletRequest request, HttpServletResponse response){
		System.out.println("EventBiz"+request.getParameter("num"));
		int eb_num = Integer.parseInt(request.getParameter("num"));
		String eb_title = request.getParameter("eb_title");
		String eb_content = request.getParameter("eb_content");
		int eb_winner = Integer.parseInt(request.getParameter("eb_winner"));
		String eb_period = request.getParameter("eb_period");
		String eb_announceday = request.getParameter("eb_announceday");
		
		boolean result = eventDao.updateEvent(eb_num, eb_title, eb_content, eb_winner, eb_period, eb_announceday );
		
		return result;
		
	}
	
	public boolean deleteEvent(HttpServletRequest request, HttpServletResponse response){
		System.out.println("EventBizDelete"+request.getParameter("num"));
		int eb_num = Integer.parseInt(request.getParameter("num"));
		String eb_title = request.getParameter("eb_title");
		String eb_content = request.getParameter("eb_content");
		
		boolean result = eventDao.deleteEvent(eb_num, eb_title, eb_content);
		
		return result;
		
	}
	
	public boolean upReadCount(HttpServletRequest request, HttpServletResponse response){
		int num = Integer.valueOf(request.getParameter("num"));
		boolean result = false;
		
		try {
			result = eventDao.upReadCount(num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
		
	}

	public ig_event eventSelectOne(HttpServletRequest request, HttpServletResponse response) {
		EventDAO eventDao = new EventDAO();
		int eb_num = Integer.parseInt(request.getParameter("num"));
		ig_event eventBean = eventDao.eventSelectOne(eb_num);
		
		return eventBean;
	}
	
	
	public boolean insertEventEntry(HttpServletRequest request, HttpServletResponse response) {
		int eb_num = Integer.valueOf(request.getParameter("num"));
		String m_name = request.getParameter("id");
		
		boolean result = eventDao.insertEventEntry(eb_num, m_name);
		
		if (result) return result;
		else return result;
	}

	public int isCanEntry(HttpServletRequest request, HttpServletResponse response) {
		
		EventDAO eventDao = new EventDAO();
		int eb_num = Integer.valueOf(request.getParameter("num"));
		String m_name = request.getParameter("id");
		
		boolean result = eventDao.isCanEntry(eb_num);
		boolean result2 = eventDao.isCanEntryId(eb_num, m_name);
		int result3 = 0;
	
		
		if (result && result2) {
			eventDao.updateWinner(eb_num);
			eventDao.insertEventEntry(eb_num, m_name);
			result3 = EventEntryPlusAction.ENTRYSUCCESS;
		} else if (!result) {
			result3 = EventEntryPlusAction.ENTRYFULL;
		} else if (!result2) {
			result3 = EventEntryPlusAction.ENTRYFAIL;
		}
		
		return result3;
	}
	
	
	
	public boolean deleteMyEvent(HttpServletRequest request, HttpServletResponse response){
		System.out.println("EventBizDelete"+request.getParameter("num"));
		int eb_num = Integer.parseInt(request.getParameter("num"));
		
		boolean result = eventDao.deleteMyEvent(eb_num);
		boolean result1 = eventDao.deleteWinner(eb_num);
		boolean result2 = false;
		
		if(result && result1){
			result2 = true;
		}
		
		return result2;
		
	}
	
	
	
}
