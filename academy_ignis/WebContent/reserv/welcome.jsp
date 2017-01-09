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


</head>
<body>

	<% ReservDAO reservDAO = new ReservDAO(); %>
	<% String r_title = (String) request.getParameter("reservSearch");%>
	<% String r_content = (String) request.getParameter("reservSearch");%>
	<% List<ig_reserv> reservList = reservDAO.getSearchReserv(r_content, 1 , 5); %>
	
	<table class="table">
					<caption class="sr-only">회원명단</caption>
					<thead>
						<tr class="info"><th>예약번호</th><th>아이디</th><th>진료 항목</th><th>진료 일자</th>
						<th>진료 시간</th><th>상세 보기</th></tr>
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

	
</body>
</html>