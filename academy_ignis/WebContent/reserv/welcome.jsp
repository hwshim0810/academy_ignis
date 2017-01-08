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

	<% ReservDAO reservDAO = new ReservDAO();
		String r_title = request.getParameter("reservSearch");
		String r_content = request.getParameter("reservType");
		List<ig_reserv> reservList = reservDAO.getSearchReserv(r_title, r_content, 1 , 5); %>
	
	<% 
						if (reservList != null) {
							for (int i = 0; i < reservList.size(); i++) {
								ig_reserv reserv = reservList.get(i);
							
					%>
	
						<td><%=reserv.getR_num() %></td>
						<td><%=reserv.getM_id() %></td>
						<td><%=reserv.getR_guide() %></td>
						<td><%=reserv.getR_day() %></td>
						<td><%=reserv.getR_time() %></td>
						<td><a href="#">보기</a>
					<%
					
							}
						}
					%>

	
</body>
</html>