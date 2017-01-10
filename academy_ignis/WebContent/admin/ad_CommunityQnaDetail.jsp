<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ignis.bean.ig_qna" %>
<%@ page import="java.util.*" %>
        <%
    int pagenum=1;//현재 페이지
    int qb_groupCount=1;
    pagenum=(Integer)request.getAttribute("pagenum");
    qb_groupCount=(Integer)request.getAttribute("qb_groupCount");
    System.out.println(session.getAttribute("m_id"));
    if(session.getAttribute("m_id") ==null){
		out.println("<script>");
		out.println("alert('로그인후 이용해주시기 바랍니다.');");
		out.println("location.href='/academy_ignis/login?page=qnaDetail&pagenum="+pagenum+"';");
		out.println("</script>");
    }
    	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>