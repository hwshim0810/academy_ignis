<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="ignis.biz.ReservBiz"%>
    
    
<%
	ReservBiz reservBiz = new ReservBiz();
	int result = reservBiz.deleteAdmin(request, response);
	
	String res = "NO";
	if (result == 1) res = "OK";
	
	response.getWriter().print(res);
%>