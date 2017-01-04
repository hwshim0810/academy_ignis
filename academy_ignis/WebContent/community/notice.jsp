<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="ignis.bean.ig_notice" %>
    <%@ page import="java.util.*" %>
    <%int pagenum=0;
    if(request.getParameter("pagenum")!=null){
    	pagenum=Integer.parseInt(request.getParameter("pagenum"));
    }else{pagenum=1;}
    	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>notice</title>
<meta http-equiv="X-UA-Compatible"  content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <style type="text/css">
  .form-group{margin:auto; align:center;}
  </style>
</head>
<body>
<%pageContext.include("header_noTop.jsp"); %>
<%pageContext.include("../header/header.jsp"); %>
 <div class="container">
 <%pageContext.include("leftList.jsp"); %>
  <div class="col-xs-12 col-sm-9 col-md-10 ">
 <h4>공지사항</h4><hr>
 <table class="table">
    <thead>
      <tr class="info">
        <th>번호</th>
        <th>제목</th>
        <th>작성일</th>
       <th>조회</th>
      </tr>
    </thead>
    <tbody>
    <%List<ig_notice> list=null;
    if(request.getAttribute("noticlist")!=null){
    	list = (List)request.getAttribute("noticlist");
    	
    for(int i=0;i<list.size();i++){
    	list.get(i).getNb_num();
    	%>
      <tr>
        <td><%=list.get(i).getNb_num() %></td>
        <td><%=list.get(i).getNb_title() %></td>
        <td><%=list.get(i).getNb_regdate() %></td>
        <td><%=list.get(i).getNb_readcount() %></td>
      </tr>
      <%}
    } %>
      <tr>
        <td>99</td>
        <td>2017년 구정 휴무</td>
        <td>2016/01/15</td>
        <td>2</td>
      </tr>
      <tr>
        <td>99</td>
        <td>2017년 구정 휴무</td>
        <td>2016/01/15</td>
        <td>2</td>
      </tr>
    </tbody>
  </table>
  <ul class="pager">
   
  <li><a href="notice?pagenum=1">첫 페이지</a></li>
  <li><a href="notice?pagenum=<%=pagenum-1%>">◁</a></li>
 <%for(int pagelist=1;pagelist<=10;pagelist++){ %>
  <li><a href="notice?pagenum=<%=pagelist%>"><%=pagelist %></a></li>
  <%} %>
  <li><a href="notice?pagenum=<%=pagenum+1%>">▷</a></li>
  <li><a href="#">마지막 페이지</a></li>
  
</ul>
  <form class="form-inline" >
   <label for="sel1">검색 범위</label>
  <select class="form-control" id="sel1">
    <option>전체</option>
    <option>제목</option>
    <option>내용</option>
  </select>
  <div class="form-group">
    <label class="sr-only" for="search">검색 내용:</label>
    <input type="text" class=form-control id="search">
  </div>
  <button type="submit" class="btn btn-default">검색</button>
</form>


  </div>

  
 </div>
 
</body>
</html>