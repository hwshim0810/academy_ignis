<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ignis.biz.FindBiz" %>
<% 		
	FindBiz findBiz = FindBiz.getInstance();
	boolean result = findBiz.isMember(request, response);
	
	if (result)
		out.print("ok");
	else
		out.print("no");
%>