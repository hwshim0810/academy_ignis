<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ignis.biz.FindBiz" %>
<% 		
	FindBiz findBiz = FindBiz.getInstance();
	boolean result = findBiz.isPassOk(request, response);
	
	String res = "NO";
	if (result) res = "OK";
	
	response.getWriter().print(res);
%>