<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ignis.dao.ReservDAO" %>
<%@ page import="ignis.bean.ig_reserv" %>
<%@ page import="java.util.List" %>
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
			  	data : {reservSearch : $('#reservSearch').val()},
				success : function(data) { $('#reservContent').html(data); },
				error : function error(){alert("error"); }
			});
			return false;
		});
	});
</script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="/academy_ignis/css/ad_Manage.css">
</head>
<body>

	<%
	ReservDAO reservDao = ReservDAO.getInstance();
	String reservSearch = (String) request.getParameter("reservSearch");
	

	int totalRows = reservDao.getReservedListcount(reservSearch); 

		// 전체 게시물 갯수%>
	
	<% 	ReservDAO reservDAO = new ReservDAO();  %>
	
	<%@include file="../paging/getPageNum.jsp" %>
	
	<% System.out.println(reservSearch); %>
	<% List<ig_reserv> reservList = reservDAO.getSearchReserv(reservSearch, begin, end); %>
	pageContext.include("../ignisCompany_info/header_noTop.jsp");
			pageContext.include("../header/header.jsp");
			pageContext.include("../ignisCompany_info/leftList2.jsp");
		
  	<div class="container-fluid main-container">
	<% 
		String getServletPath = request.getServletPath();
		String contextPath = request.getContextPath();
		String command = getServletPath.substring(7,15);
		if(command == "/welcome"){
			pageContext.include("../ignisCompany_info/header_noTop.jsp");
			pageContext.include("../header/header.jsp");
			System.out.println("안녕");
			pageContext.include("../ignisCompany_info/leftList2.jsp");
		}
	%>	
	
  		<div class="col-md-10 content">
  			  <div class="panel panel-default">
				<div class="panel-heading">
					<h2 id="memTitle">예약 관리 리스트</h2>
				</div>
				<div id="reservContent">
				<table class="table">
					<caption class="sr-only">회원명단</caption>
					<thead>
						<tr class="info"><th>예약번호</th><th>아이디</th><th>진료 항목</th><th>진료 일자</th>
						<th>진료 시간</th><th>예약 신청일</th><th>상세 보기</th></tr>
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
						<td><a href="#">보기</a></td>
						</tr>
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
					<form class="form-inline" action="welcome">
					  <label for="sel1">검색 범위</label>
					  <select id="reservType" id="sel1" name="reservType">
					    <option>전체</option>
					    <option value="t_guide">진료 항목</option>
					    <option>내용</option>
					  </select>
					  <div class="form-group">
					    <label class="sr-only" for="search">검색 내용:</label>
					    <input type="text" id="reservSearch" name =" reservSearch"  value="치아교정">
					  </div>
					  <button type="submit" class="btn btn-default"  id="reservSubmit">검색</button>
					</form>
					<%out.println(prevPage); %><%out.println(endPage); %>
					<ul class="pager">
					  <li><a href="/academy_ignis/welcome?pageNo=1">첫 페이지</a></li>
					  <li>
					  	<% if (prevPage != 0) { %><a href="/academy_ignis/welcome?pageNo=<%=prevPage %>&reservSearch=<%=reservSearch%>">◁</a><% } %>
					  </li>
					 	<% for (int i = beginPage; i <= endPage; i++) { %>
					  <li><a href="/academy_ignis/welcome?pageNo=<%=i %>&reservSearch=<%=reservSearch%>"><%=i %></a></li>
					  	<% } %>
					  <li>
					 	 <% if (nextPage != 0) { %><a href="/academy_ignis/welcome?pageNo=<%=nextPage%>&reservSearch=<%=reservSearch%>">▷</a><% } %>
					  </li>
					  <li><a href="/academy_ignis/welcome?pageNo=<%=totalPages %>&reservSearch=<%=reservSearch%>">마지막 페이지</a></li>
					</ul>
				</div>
			</div>
			</div>
			
			
			<%
			if(command == "/welcome"){
				pageContext.include("../footer/footer.jsp");
				
			pageContext.include("../header/header.jsp");
			pageContext.include("../ignisCompany_info/leftList2.jsp");
		}
	%>	
			
  		</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="/academy_ignis/script/ad_Manage.js"></script>
</body>
</html>