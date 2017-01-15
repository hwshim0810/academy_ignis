<%@page import="java.io.PrintWriter"%>
<%@page import="ignis.dao.EventDAO"%>
<%@ page import="java.util.*, java.text.*"  %>
<%@page import="ignis.bean.ig_event" %>
<%@ page import = "java.util.Iterator" %>
<%@page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	EventDAO eventDao = EventDAO.getInstance();
	
	String type = request.getParameter("type");
	String content = request.getParameter("content");

	int pageLink = 1;
	if (request.getParameter("page") != null)
		pageLink = Integer.valueOf(request.getParameter("page"));
	
	
	final int ROW_PER_PAGE = 10;
	int begin = (pageLink - 1) * ROW_PER_PAGE + 1;
	int end = pageLink * ROW_PER_PAGE;
	
	List<ig_event> eventList = eventDao.getSearchEvent(type, content, begin, end);
	
	int totalRows = eventDao.getSearchEventCount(type, content);
	
	int totalPages = (int) Math.ceil((double) totalRows / ROW_PER_PAGE);
	// 전체 페이지 갯수

	final int PAGE_PER_PAGE = 10; // 화면당 페이지 출력 갯수
	int totalRanges = (int) Math.ceil((double) totalPages
			/ PAGE_PER_PAGE); // 전체 Range 갯수
	int currentRange = (int) Math.ceil((double) pageLink / PAGE_PER_PAGE);
	//요청된 pageNo의 현재 range
	int beginPage = (currentRange - 1) * PAGE_PER_PAGE + 1; // 시작 페이지 번호
	int endPage = currentRange * PAGE_PER_PAGE; // 마지막 페이지 번호
	if (currentRange == totalRanges)
		endPage = totalPages; // currentRange가 맨 마지막 range인 경우

	int prevPage = 0;
	if (currentRange != 1)
		prevPage = (currentRange - 2) * PAGE_PER_PAGE + 1;
	int nextPage = 0;
	if (currentRange != totalRanges)
		nextPage = currentRange * PAGE_PER_PAGE + 1;

%>
<table class="table table-responsive" style="text-align : center;">
	<input id="hidden_type" type="hidden" value="<%=type%>">
	<input id="hidden_content" type="hidden" value="<%=content%>">
	<caption class="sr-only">이벤트 게시판</caption>
	<thead>
		<tr>
			<th class="hidden-xs hidden-sm" style="text-align : center;">No</th>
			<th style="text-align : center;">제목</th>
			<th style="text-align : center;">기간</th>
			<th style="text-align : center;">응모가능수</th>
			<th class="hidden-xs hidden-sm" style="text-align : center;">등록일</th>
			<th class="hidden-xs hidden-sm" style="text-align : center;">조회수</th>
		</tr>
	</thead>
	<tbody>
	<%
	if (eventList != null) {
		int cnt = 0;
		int no = eventList.size();
		for (int i = 0; i < eventList.size(); i++) {
			cnt ++;
			ig_event event = eventList.get(i);			
	%>
	<%
		java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd");
		Date today = new Date();
		String endDate = event.getEb_period().substring(13);
		Date endDay = formatter.parse(endDate);
		int result = today.compareTo(endDay);
	%>
	<tr>
		<td class="hidden-xs hidden-sm"><%= no %></td>
		<td style="text-align : left;">
			<a href="/academy_ignis/EventView?login=member&pageNo=<%= pageLink %>&num=<%= event.getEb_num()%> ">
				<%= event.getEb_title() %>
			</a>
		</td>
		<td><%= event.getEb_period() %></td>
		<td style="color : #f00;">
			<% if(result > 0){ %>
				이벤트 마감
			<% } else { 
				 if( event.getEb_winner() > 0) { %>
					<%= event.getEb_winner() %>
				<% } else { %>
					이벤트 마감
				<% } %>
			<% } %>
		</td>
		<td class="hidden-xs hidden-sm"><%= event.getEb_regdate() %></td>
		<td class="hidden-xs hidden-sm"><%= event.getEb_readcount() %></td>
	</tr>
	<%
			no--;
		}
		System.out.println(cnt);
		if (cnt == 0) {
			prevPage = 0;
			endPage = 1;
			nextPage = 0;
	%>
	<tr>
		<td colspan="6" style="padding : 10% 0; text-align : center;">현재 등록된 이벤트가 없습니다.</td>
	</tr>
	<% } 
	}
	%>
		</tbody>
	</table>
	<ul class="pager">
	  <li><a href="/academy_ignis/Event?login=member&pageNo=1">첫 페이지</a></li>
	  <li>
	  	<% if (prevPage != 0) { %><a href="/academy_ignis/Event?login=member&pageNo=<%=prevPage %>">◁</a><% } %>
	 </li>
		<% for (int i = beginPage; i <= endPage; i++) { %>
	 <li><a href="/academy_ignis/Event?login=member&pageNo=<%=i %>"><%=i %></a></li>
	 	<% } %>
	 <li>
		 <% if (nextPage != 0) { %><a href="/academy_ignis/Event?login=member&pageNo=<%=nextPage%>">▷</a><% } %>
	 </li>
	 <li><a href="/academy_ignis/Event?login=member&pageNo=<%= totalPages %>">마지막 페이지</a></li>
	</ul>
<script type="text/javascript" charset="utf-8" src="/academy_ignis/script/search_event_page_client.js"></script>