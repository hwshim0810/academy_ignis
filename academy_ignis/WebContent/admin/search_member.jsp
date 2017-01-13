<%@page import="java.io.PrintWriter"%>
<%@page import="ignis.dao.MemberDAO"%>
<%@page import="ignis.bean.User" %>
<%@page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	MemberDAO memDao = MemberDAO.getInstance();
	
	String type = request.getParameter("type");
	String content = request.getParameter("content");

	int pageLink = 1;
	if (request.getParameter("page") != null)
		pageLink = Integer.valueOf(request.getParameter("page"));
	
	final int ROW_PER_PAGE = 10;
	int begin = (pageLink - 1) * ROW_PER_PAGE + 1;
	int end = pageLink * ROW_PER_PAGE;
	
	List<User> userList = memDao.getSearchUser(type, content, begin, end);
	
	int totalRows = memDao.getSearchCount(type, content);
	
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
					<div class="table-responsive">
					<input id="hidden_type" type="hidden" value="<%=type%>">
					<input id="hidden_content" type="hidden" value="<%=content%>">
					<table class='table'>
						<caption class="sr-only">회원명단</caption>
						<thead>
							<tr><th>아이디</th><th>이름</th><th>생일</th><th>주소</th>
							<th>휴대폰번호</th><th>Email</th><th>가입일</th><th></th></tr>
						</thead>
						<tbody>
						<% 
							if (userList != null) {
								for (int i = 0; i < userList.size(); i++) {
									User user = userList.get(i);
						%>
						<tr>
							<td><%=user.getM_id() %></td><td><%=user.getM_name() %></td>
							<td><%=user.getM_birth() %></td><td><%=user.getM_addr() %></td>
							<td><%=user.getM_phone() %></td><td><%=user.getM_email() %></td>
							<td><%=user.getM_enterdate() %></td><td><a href="/academy_ignis/adMyPage?userId=<%=user.getM_id()%>">보기</a></td>
						</tr>
						<%
								}
							} 
						%>
						</tbody>
					</table>
					</div>
						<ul class="pager">
						  <li><a class="pageNum" id="first" href="#">첫 페이지</a></li>
						  <li>
						  	<% if (prevPage != 0) { %><a class="pageNum" id="<%=prevPage %>" href="#">◁</a><% } %>
						  </li>
						 	<% for (int i = beginPage; i <= endPage; i++) { %>
						  <li><a class="pageNum" id="<%=i %>" href="#"><%=i %></a></li>
						  	<% } %>
						  <li>
						 	 <% if (nextPage != 0) { %><a class="pageNum" id="<%=nextPage%>" href="#">▷</a><% } %>
						  </li>
						  <li><a class="pageNum" id="<%=totalPages %>" href="#">마지막 페이지</a></li>
						</ul>
						<script type="text/javascript" charset="utf-8" src="/academy_ignis/script/search_mem_page.js?v=1"></script>