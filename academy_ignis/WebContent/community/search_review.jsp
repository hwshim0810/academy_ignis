<%@page import="java.io.PrintWriter"%>
<%@page import="ignis.dao.ReviewDAO"%>
<%@page import="ignis.bean.ig_review" %>
<%@ page import = "java.util.Iterator" %>
<%@page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ReviewDAO reviewDao = ReviewDAO.getInstance();
	
	String type = request.getParameter("type");
	String content = request.getParameter("content");

	int pageLink = 1;
	int commPageNo = 1;
	if (request.getParameter("page") != null)
		pageLink = Integer.valueOf(request.getParameter("page"));
	
	
	final int ROW_PER_PAGE = 10;
	int begin = (pageLink - 1) * ROW_PER_PAGE + 1;
	int end = pageLink * ROW_PER_PAGE;
	
	List<ig_review> reviewList = reviewDao.getSearchReview(type, content, begin, end);
	
	int totalRows = reviewDao.getSearchCount(type, content);
	
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
<table class="table">
	<input id="hidden_type" type="hidden" value="<%=type%>">
	<input id="hidden_content" type="hidden" value="<%=content%>">
	<caption class="sr-only">Review게시판</caption>
	<thead>
		<tr>
			<th class="hidden-xs hidden-sm">No</th>
			<th>제목</th>
			<th>작성자</th>
			<th>등록일</th>
			<th class="hidden-xs hidden-sm">조회수</th>
		</tr>
	</thead>
	<tbody>
	<%
	if (reviewList != null) {
		int cnt = 0;
		int no = reviewList.size();
		for (int i = 0; i < reviewList.size(); i++) {
			cnt ++;
			ig_review review = reviewList.get(i);
			int commentCount = reviewDao.getListCommentCount(review.getRb_num());
	%>
		<tr>
			<td class="hidden-xs hidden-sm"><%= review.getRb_num() %></td>
			<td>
				<a href="/academy_ignis/ReviewView?login=member&pageNo=<%= pageLink %>&num=<%= review.getRb_num()%>&commPageNo=<%= commPageNo%>"><%= review.getRb_title() %></a>
				<span class="badge"><%=commentCount %></span>
					<%
						if(review.getRb_file() != null && review.getRb_file().length() > 0 ){
					%>
						<span class="glyphicon glyphicon-picture" aria-hidden="true"></span>
					<% } %>
			</td>
			<td><%= review.getM_name() %></td>
			<td><%= review.getRb_regdate() %></td>
			<td class="hidden-xs hidden-sm"><%= review.getRb_readcount() %></td>
		</tr>
	<% 
		no--;
		} 
		
		if(cnt == 0) {
			prevPage = 0;
			endPage = 1;
			nextPage = 0;
	%>
	<tr>
		<td colspan="5" style="padding : 10% 0; text-align : center;">검색된 치료후기가 없습니다.</td>
	</tr>
		<% } %>
	<% } %>
	</tbody>
</table>
<ul class="pager">
  <li><a href="/academy_ignis/Review?login=member&pageNo=1">첫 페이지</a></li>
  <li>
  	<% if (prevPage != 0) { %><a href="/academy_ignis/Review?login=member&pageNo=<%=prevPage %>">◁</a><% } %>
 </li>
	<% for (int i = beginPage; i <= endPage; i++) { %>
 <li><a href="/academy_ignis/Review?login=member&pageNo=<%=i %>"><%=i %></a></li>
 	<% } %>
 <li>
	 <% if (nextPage != 0) { %><a href="/academy_ignis/Review?login=member&pageNo=<%=nextPage%>">▷</a><% } %>
 </li>
 <li><a href="/academy_ignis/Review?login=member&pageNo=<%= totalPages %>">마지막 페이지</a></li>
</ul>
<script type="text/javascript" charset="utf-8" src="/academy_ignis/script/search_review_page_client.js"></script>