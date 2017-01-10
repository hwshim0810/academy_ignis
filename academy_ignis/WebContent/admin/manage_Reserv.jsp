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
<script>
	$(function() {
		$('#reservSubmit').click(function () {
			
			$.ajax({
				type : "post",
	 			url : "./reserv/manage_Reserv.jsp",
			  	data : {reservSearch : $('#reservSearchSecond').val().trim()},
				success : function(data) { $('#reservContent').html(data); },
				error : function error(){alert("error"); }
			});
			return false;
		});
	});
</script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="/academy_ignis/script/ad_Manage.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="/academy_ignis/css/ad_Manage.css">
</head>
<body>

<% 
	ReservDAO reservDao = ReservDAO.getInstance();
	 int totalRows = reservDao.getListcount(); %>
<% ReservDAO reservDAO = new ReservDAO(); %>
<%@include file="../paging/getPageNum.jsp" %>
<% List<ig_reserv> reservList = reservDAO.getReservListAll(begin, end); %>

<% pageContext.include("./manage_Header.jsp"); %>
<% 
	 String getServletPath = request.getServletPath();
	 String contextPath = request.getContextPath();
	 String command = getServletPath.substring(7,15);
	 System.out.println("getServletPath " + getServletPath);
	 System.out.println("contextPath " + contextPath);
	 System.out.println("command는 " + command);
	 if(command == "/welcome"){
		 pageContext.include("./manage_Header.jsp");
		pageContext.include("./manage_sideNav.jsp");
	 } %>	
	 
	 <div class="container-fluid main-container">	
	<% pageContext.include("./manage_sideNav.jsp"); %>
	
  		<div class="col-md-10 content">
  			  <div class="panel panel-default">
				<div class="panel-heading">
					<h2 id="memTitle">예약 관리 리스트</h2>
					<h5>&nbsp;총 예약수 : <%=totalRows %></h5>
				</div>
				<div class="panel-body" id="reservContent">
				<table class="table">
					<caption class="sr-only">회원명단</caption>
					<thead>
						<tr class="info"><th>예약번호</th><th>회원 아이디</th><th>진료 항목</th><th>진료 일자</th>
						<th>진료 시간</th><th>예약 신청일</th></tr>
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
						
						<%-- 추후 수정 예정
						<% if(reserv.getR_findDoc() == "true")
						{
							%>
							<td>진료 가능</td>
						<% } else { %>
							<td>진료 불가</td>
								
						<%=reserv.getR_findDoc() %></td>
						 --%>
						</tr>
					<%
							}
						} else {
					%>
					<tr><td colspan="7">예약 정보가 없습니다.</td></tr>
					<%	} %>
					</tbody>
				</table>
				
				<div class="panel-end">
					<form class="form-inline" action="welcome">
					  <div class="form-group">
					  	<label for="sel1">검색 범위</label>
					  <select class="form-control" id="sel1" name="reservType">
					    <option value="">전체</option>
					    <option value="t_guide">예약번호</option>
					    <option value="t_guide">회원아이디</option>
					    <option value="t_guide">진료 항목</option>
					    <option value="t_guide">진료 일자</option>
					    <option value="t_guide">진료 시간</option>
					    <option value="t_guide">예약 신청일</option>
					  </select>
					  </div>
					  <div class="form-group">
					    <label class="sr-only" for="search">검색 내용:</label>
					    <input type="text" class="form-control" id="reservSearchSecond" name =" reservSearchSecond">
					  </div>
					  <button type="submit" class="btn btn-default"  id="reservSubmit">검색</button>
					</form>
					<ul class="pager">
					  <li><a href="/academy_ignis/manage_Reserv?pageNo=1">첫 페이지</a></li>
					  <li>
					  	<% if (prevPage != 0) { %><a href="/academy_ignis/manage_Reserv?pageNo=<%=prevPage %>">◁</a><% } %>
					  </li>
					 	<% for (int i = beginPage; i <= endPage; i++) { %>
					  <li><a href="/academy_ignis/manage_Reserv?pageNo=<%=i %>"><%=i %></a></li>
					  	<% } %>
					  <li>
					 	 <% if (nextPage != 0) { %><a href="/academy_ignis/manage_Reserv?pageNo=<%=nextPage%>">▷</a><% } %>
					  </li>
					  <li><a href="/academy_ignis/manage_Reserv?pageNo=<%=totalPages %>">마지막 페이지</a></li>
					</ul>
				</div>
			</div>
			</div>
		</div>
		<%pageContext.include("./manage_Footer.jsp"); %>
</div>
</body>
</html>
