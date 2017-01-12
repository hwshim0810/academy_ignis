<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="ignis.bean.ig_notice" %>
    <%@ page import="java.util.*" %>
    <%
    int pagenum=1;//현재 페이지
	int pagelimit=10;//한 페이지 리스트수
	int pageCount=10;//마지막 페이지
	int startpage=1;//페이지 범위
	int endpage=10;//페이지 범위
	pagelimit=(Integer)request.getAttribute("pagelimit");
	pageCount=(Integer)request.getAttribute("pageCount");
	startpage=(Integer)request.getAttribute("startpage");
	endpage=(Integer)request.getAttribute("endpage");
    if(request.getParameter("pagenum")!=null){
    	pagenum=Integer.parseInt(request.getParameter("pagenum"));
    }else{pagenum=1;}
	if(endpage>pageCount){endpage=pageCount;}
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

</head>
<body>

 <h3>공지사항</h3><hr>
 <table class="table table-responsive">
    <thead>
      <tr>
        <th>번호</th>
        <th>제목</th>
        <th>작성일</th>
       <th>조회</th>
      </tr>
    </thead>
    <tbody>
    <%List<ig_notice> list=null;
    if(request.getAttribute("noticelist")!=null){
    	list = (List)request.getAttribute("noticelist");
    	
    for(int i=0;i<list.size();i++){
    	list.get(i).getNb_num();
    	%>
      <tr>
        <td><%=list.get(i).getNb_num() %></td>
        <td><a href="noticeDetail?nb_num=<%=list.get(i).getNb_num()%>&pagenum=<%=pagenum%>"><%=list.get(i).getNb_title() %></a></td>
        <td><%=list.get(i).getNb_regdate() %></td>
        <td><%=list.get(i).getNb_readcount() %></td>
      </tr>
      <%}
    } %>
    </tbody>
  </table>
  <%String searchOption=null;
  String searchContent=null;
  if(request.getAttribute("searchOption")!=null&&request.getAttribute("searchContent")!=null){
  searchOption=request.getAttribute("searchOption").toString();
	searchContent=request.getAttribute("searchContent").toString();%>
	<ul class="pager">
  <%if(pagenum==1){%>
    <li><a>첫 페이지</a></li>
	  <li><a>◁</a></li>
 <% }else{ %>
   <li><a href="notice?searchOption=<%=searchOption %>&searchContent=<%=searchContent %>&pagenum=1">첫 페이지</a></li>
  <li><a href="notice?searchOption=<%=searchOption %>&searchContent=<%=searchContent %>&pagenum=<%=pagenum-1%>">◁</a></li>
  <%} %>
 <%for(int pagelist=startpage ; pagelist<=endpage ; pagelist++){ %>
 
 <% if(pagelist==pagenum){%>
 <li class="active"><a><%=pagelist %></a></li>
 <%}else{ %>
  <li><a href="notice?searchOption=<%=searchOption %>&searchContent=<%=searchContent %>&pagenum=<%=pagelist%>"><%=pagelist %></a></li>
  <%}} %>
  <%if(pagenum==pageCount){ %>
  <li><a>▷</a></li>
  <li><a>마지막 페이지</a></li>
  <%}else{ %>
  <li><a href="notice?searchOption=<%=searchOption %>&searchContent=<%=searchContent %>&pagenum=<%=pagenum+1%>">▷</a></li>
  <li><a href="notice?searchOption=<%=searchOption %>&searchContent=<%=searchContent %>&pagenum=<%=pageCount%>">마지막 페이지</a></li>
  <%} %>
</ul>
<%}else{ 

%>
  <ul class="pager">
  <%if(pagenum==1){%>
    <li><a>첫 페이지</a></li>
	  <li><a>◁</a></li>
 <% }else{ %>
   <li><a href="notice?pagenum=1">첫 페이지</a></li>
  <li><a href="notice?pagenum=<%=pagenum-1%>">◁</a></li>
  <%} %>
 <%for(int pagelist=startpage ; pagelist<=endpage ; pagelist++){ %>
 
 <% if(pagelist==pagenum){%>
 <li class="active"><a><%=pagelist %></a></li>
 <%}else{ %>
  <li><a href="notice?pagenum=<%=pagelist%>"><%=pagelist %></a></li>
  <%}} %>
  <%if(pagenum==pageCount){ %>
  <li><a>▷</a></li>
  <li><a>마지막 페이지</a></li>
  <%}else{ %>
  <li><a href="notice?pagenum=<%=pagenum+1%>">▷</a></li>
  <li><a href="notice?pagenum=<%=pageCount%>">마지막 페이지</a></li>
  <%} }%>
</ul>
</body>
</html>