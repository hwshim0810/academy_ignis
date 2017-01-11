<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ignis.dao.ReservDAO" %>
<%@ page import="ignis.bean.ig_reserv" %>
<%@ page import="java.util.List" %>
<%request.setCharacterEncoding("UTF-8"); %>
<% 
	String id = null;
	
	if (session.getAttribute("m_id") != null) 
		id = (String) session.getAttribute("m_id");
	else
		response.sendRedirect("/academy_ignis/admin/ad_Login.jsp");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-1.10.2.min.js"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="/academy_ignis/script/ad_Manage.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="/academy_ignis/css/ad_Manage.css">
<script>
	$(function() {
		$(".pageNum").click(function() {
			var searchType = $("#hidden_searchType").val().trim();
			var searchContent = $("#hidden_searchContent").val().trim();
			var pageNum = event.target.getAttribute('id');
			
			if (pageNum == 'first')
				pageNum = '1';
			console.log(searchType);
			console.log(searchContent);
			console.log(pageNum);
			$.ajax({
				type : "post",
	 			url : "/academy_ignis/admin/search_Reserv.jsp",
			  	data : {searchType : searchType, searchContent : searchContent, pageNum : pageNum},
				success : function(data) { $('#reservContent').html(data); },
				error : function(request, status, error){alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error); }
			});
		});
		
	});
</script>
</head>
<body>

<% 
	String searchType = request.getParameter("searchType");
	String searchContent = request.getParameter("searchContent");
	System.out.println("searchType" + searchType);
	System.out.println("searchContent" + searchContent);
	System.out.println("pageNum" + request.getParameter("pageNum"));
	
	// manage_Reserv.jsp에서 보낸 파라미터 값들을 받아온다. 
	ReservDAO reservDao = ReservDAO.getInstance();
	int pageNo = 1;
	if (request.getParameter("pageNum") != null)
		pageNo = Integer.valueOf(request.getParameter("pageNum"));
	
	System.out.println("pageNo는 이것입니다. " + pageNo);
	 int totalRows = reservDao.getAdminListCount(searchType, searchContent); 
	//검색항목별로 해당 게시물의 수를 출력한다. %>
<%
	
	final int ROW_PER_PAGE = 5;
	int begin = (pageNo - 1) * ROW_PER_PAGE + 1;
	int end = pageNo * ROW_PER_PAGE;
	
	
	
	int totalPages = (int) Math.ceil((double) totalRows / ROW_PER_PAGE);
	// 전체 페이지 갯수

	final int PAGE_PER_PAGE = 10; // 화면당 페이지 출력 갯수
	int totalRanges = (int) Math.ceil((double) totalPages
			/ PAGE_PER_PAGE); // 전체 Range 갯수
	int currentRange = (int) Math.ceil((double) pageNo / PAGE_PER_PAGE);
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
	 
<% List<ig_reserv> reservList = reservDao.getAdminSearchReserv(searchType, searchContent, begin, end); %>
<%-- 검색한 항목의 List를 받아온다.  --%>
<input id="hidden_searchType" type="hidden" value="<%=searchType%>">
<input id="hidden_searchContent" type="hidden" value="<%=searchContent%>">
	<div id="reservContent">
		<div class= "table-responsive">
			<table class="table">
			<caption class="sr-only">회원명단</caption>
			<thead>
				<tr class="info"><th>예약번호</th><th>회원 아이디</th><th>진료 항목</th><th>진료 일자</th>
				<th>진료 시간</th><th>예약 신청일</th><th>상세보기</th></tr>
			</thead>
			<tbody>
			<% 
				if (reservList != null) {
					for (int i = 0; i < reservList.size(); i++) {
						ig_reserv reserv = reservList.get(i);
			%>
				<tr>
				<td><%=reserv.getR_num() %></td>
				<td><%=reserv.getM_id() %></td>
				<td><%=reserv.getR_guide() %></td>
				<td><%=reserv.getR_day() %></td>
				<td><%=reserv.getR_time() %></td>
				<td><%=reserv.getR_regdate() %></td>
				<td><a href="/academy_ignis/reservInfo?getR_num=<%=reserv.getR_num()%>">보기</a>
			<%
					}
				} else {
			%>
			<tr><td colspan="7">예약 정보가 없습니다.</td></tr>
			<%	} %>
			</tbody>
		</table>
		</div>
		
		<div class="panel-end">			
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
		</div>
	</div>
</body>
</html>
