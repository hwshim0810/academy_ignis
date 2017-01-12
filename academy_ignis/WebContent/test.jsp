<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ignis.bean.ig_notice" %>
<%@ page import="ignis.dao.NoticeDAO" %>
<%@ page import="ignis.biz.*" %>
<%@ page import="java.util.*" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script type="text/javascript">
var pageNo=1;
function pagenum() {
	pageNo=document.getElementByname("pagenum").value;
	
}
</script>
<%String searchOption=request.getParameter("searchOption");
    String searchContent=request.getParameter("searchContent");
    request.setAttribute("searchOption", searchOption);
    request.setAttribute("searchContent", searchContent);
    
	NoticeBiz noticeBiz = new NoticeBiz();//검색된 데이타 가져옴
	List<ig_notice> list=noticeBiz.selectAll(request, response);
	
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
</head>
<body><h3>공지사항</h3><hr>
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
    <%
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
     %>
    </tbody>
  </table>
	<ul class="pager">
  <%if(pagenum==1){%>
    <li><a >첫 페이지</a></li>
	  <li><a>◁</a></li>
 <% }else{ %>
   <li><a href=""  name="pagenum">첫 페이지</a></li>
  <li><a  href=""  name="pagenum">◁</a></li>
  <%} %>
 <%for(int pagelist=startpage ; pagelist<=endpage ; pagelist++){ %>
 
 <% if(pagelist==pagenum){%>
 <li class="active"><a><%=pagelist %></a></li>
 <%}else{ %>
  <li><a href="" name="pagenum"><%=pagelist %></a></li>
  <%}} %>
  <%if(pagenum==pageCount){ %>
  <li><a>▷</a></li>
  <li><a>마지막 페이지</a></li>
  <%}else{ %>
  <li><a href="" name="pagenum">▷</a></li>
  <li><a href="" name="pagenum" >마지막 페이지</a></li>
  <%} %>
</ul>
</body>
</html>