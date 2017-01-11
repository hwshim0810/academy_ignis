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
<%
	ReservDAO reservDao = new ReservDAO();
	String mem_id = request.getParameter("reservContent");
	boolean result = reservDao.searchMemberId(mem_id);
	System.out.println("mem_id는" + mem_id);
%>
</head>
<body>
<% if(result==true){ %>
<%=request.getParameter("reservContent") %>
		<% } else %>
		<%=out.print("아이디를 다시입력하세요") %>
		
</body>
</html>