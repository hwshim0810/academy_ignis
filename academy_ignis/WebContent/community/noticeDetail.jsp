<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="ignis.bean.ig_notice" %>
    <%@ page import="java.util.*" %>
        <%
    int pagenum=1;//현재 페이지
    pagenum=(Integer)request.getAttribute("pagenum");
    	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>noticeDetail</title>
<meta http-equiv="X-UA-Compatible"  content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<%pageContext.include("header_noTop.jsp"); %>
<%pageContext.include("../header/header.jsp"); %>
 <div class="container">
 <%pageContext.include("leftList.jsp"); %>
  <div class="col-xs-12 col-sm-9 col-md-10 ">
  <h4>공지사항</h4><hr>
 <table class="table">
    <tbody>
    <%List<ig_notice> list=null;
    if(request.getAttribute("noticeDetail")!=null){
    	list = (List)request.getAttribute("noticeDetail");
    	%>
      <tr>
      <th>제목</th>
        <td><%=list.get(0).getNb_title() %></td></tr><tr>
        <th>등록일</th>
        <td><%=list.get(0).getNb_regdate() %></td>
        <th>조회수</th>
        <td><%=list.get(0).getNb_readcount() %></td>
      </tr>
    </tbody>
  </table>
<h5><%=list.get(0).getNb_content() %></h5>
      <%
    } %>
  <a href="notice?pagenum=<%=pagenum%>"><button type="button" class="btn btn-info" >목록</button></a>

  </div>
 </div>
</body>
</html>