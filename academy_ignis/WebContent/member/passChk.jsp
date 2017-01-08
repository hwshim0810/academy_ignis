<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ignis.biz.FindBiz" %>
<% 		
	FindBiz findBiz = FindBiz.getInstance();
	boolean result = findBiz.isMember(request, response);
	
	String res = "OK";
	if (result) res = "NO";
	
	response.getWriter().print(res);
%>