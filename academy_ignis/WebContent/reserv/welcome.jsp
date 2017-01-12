<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ignis.dao.ReservDAO" %>
<%@ page import="ignis.bean.ig_reserv" %>
<%@ page import="java.util.List" %>
<%request.setCharacterEncoding("UTF-8"); %>
<% 
	String id = null;
	if (session.getAttribute("m_id") != null) {
		id = (String) session.getAttribute("m_id");
	}
	else
		response.sendRedirect("./member/login.jsp");
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
	 			url : "./reserv/welcome.jsp",
			  	data : {reservSearch : $('#reservSearchSecond').val().trim()},
				success : function(data) { $('#reservContent').html(data); },
				error : function error(){alert("error"); }
			});
			return false;
		});
	});
</script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="/academy_ignis/css/ad_Manage.css">
<link rel="stylesheet" href="/academy_ignis/css/jquery-confirm.min.css">
<link rel="stylesheet" href="/academy_ignis/css/common.css">
</head>
<body>

<div id="reservContent">
<% pageContext.include("../header/header.jsp"); %>

<% 
	ReservDAO reservDao = ReservDAO.getInstance();
	 String reservSearchSecond = request.getParameter("reservSearch");
	 int totalRows = reservDao.getReservedListcount(reservSearchSecond, id); %>
<% ReservDAO reservDAO = new ReservDAO(); %>
<%@include file="../paging/getPageNum.jsp" %>
<% List<ig_reserv> reservList = reservDAO.getSearchReserv(id, reservSearchSecond, begin, end); %>
	<div class="wrapper">
	 <div class="container">
		<% pageContext.include("../ignisCompany_info/leftList2.jsp"); %>
  		<div class="col-xs-12 col-sm-9 col-md-10">
  			  <div class="panel panel-default">
					<div class="panel-heading">
						<h3 id="memTitle">예약 관리 리스트</h3>
					</div>
					<table class="table table-responsive">
						<caption class="sr-only">회원명단</caption>
						<thead>
							<tr class="info"><th>예약번호</th><th>진료 항목</th><th>진료 일자</th>
							<th>진료 시간</th><th>예약 신청일</th><th>삭제</th></tr>
						</thead>
						<tbody>
						<% 
							if (reservList != null) {
								for (int i = 0; i < reservList.size(); i++) {
									ig_reserv reserv = reservList.get(i);
						%>
							<tr>
							<td><%=reserv.getR_num() %></td>
							<td><%=reserv.getR_guide() %></td>
							<td><%=reserv.getR_day() %></td>
							<td><%=reserv.getR_time() %></td>
							<td><%=reserv.getR_regdate() %></td>
							<td><a href="/academy_ignis/deleteReserv?getR_num=<%=reserv.getR_num()%>&pageNo=<%=pageNo%>" class="reservDel">삭제</a>
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
							    <option>전체</option>
							    <option value="t_guide">진료 항목</option>
							    <option>내용</option>
						  </select>
						  </div>
						  <div class="form-group">
						    <label class="sr-only" for="search">검색 내용:</label>
						    <input type="text"  class="form-control" id="reservSearchSecond" name =" reservSearchSecond" value="<%=reservSearchSecond %>">
						  </div>
						  <button type="submit" class="btn btn-default"  id="reservSubmit">검색</button>
						</form>
						<ul class="pager">
						  <li><a href="/academy_ignis/welcome?pageNo=1&reservSearch=<%=reservSearchSecond%>">첫 페이지</a></li>
						  <li>
						  	<% if (prevPage != 0) { %><a href="/academy_ignis/welcome?pageNo=<%=prevPage %>&reservSearch=<%=reservSearchSecond%>">◁</a><% } %>
						  </li>
						 	<% for (int i = beginPage; i <= endPage; i++) { %>
						  <li><a href="/academy_ignis/welcome?pageNo=<%=i %>&reservSearch=<%=reservSearchSecond%>"><%=i %></a></li>
						  	<% } %>
						  <li>
						 	 <% if (nextPage != 0) { %><a href="/academy_ignis/welcome?pageNo=<%=nextPage%>&reservSearch=<%=reservSearchSecond%>">▷</a><% } %>
						  </li>
						  <li><a href="/academy_ignis/welcome?pageNo=<%=totalPages %>&reservSearch=<%=reservSearchSecond%>">마지막 페이지</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<% pageContext.include("../footer/footer.jsp"); %>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="/academy_ignis/script/ad_Manage.js"></script>
<script type="text/javascript" charset="utf-8" src="/academy_ignis/script/index_login.js?v=2"></script>
<script type="text/javascript" charset="utf-8" src="/academy_ignis/script/myPage.js"></script>
 <script src="/academy_ignis/script/reserv_Delete.js?v=1"></script>

<%
	if (id != null) {
%>		<script type="text/javascript">userLogin();</script>
<% 	} else { %>
		<script type="text/javascript">userLogout();</script>
<%  } %>
</body>
</html>