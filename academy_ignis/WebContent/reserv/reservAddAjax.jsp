<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ignis.dao.ReservDAO" %>
<%@ page import="ignis.bean.ig_reserv" %>
<%@ page import="java.util.List" %>


<%
	ReservDAO reservDao = new ReservDAO();
	String mem_id = request.getParameter("reservContent");
	boolean result = reservDao.searchMemberId(mem_id);
	System.out.println("mem_id는" + mem_id);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
	<div class="addreserv godo">
	<% if(result==true){ %>
	<%=mem_id%><% out.println("회원님이 확인되었습니다."); %>
	<% } else {%><% out.println("아이디가 없습니다."); %>
	<% } %>
	</div>
</body>
</html>