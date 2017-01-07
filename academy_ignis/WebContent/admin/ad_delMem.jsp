<%@page import="ignis.biz.MemberBiz"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	MemberBiz memBiz = MemberBiz.getInstance();
	int result = memBiz.delete(request, response);
	
	String res = "NO";
	if (result == 1) res = "OK";
	
	response.getWriter().print(res);
%>