<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ignis.bean.ig_qna" %>
<%@ page import="java.util.*" %>
<%
	String id = null;

	if (session.getAttribute("m_id") != null) 
		id = (String) session.getAttribute("m_id");

int pagenum=1;//현재 페이지
int pagelimit=10;//한 페이지 리스트수
int pageCount=10;//마지막 페이지
int startpage=1;//페이지 범위
int endpage=10;//페이지 범위
pagelimit=(Integer)request.getAttribute("pagelimit");
pageCount=(Integer)request.getAttribute("pageCount");
startpage=(Integer)request.getAttribute("startpage");
endpage=(Integer)request.getAttribute("endpage");
if(request.getAttribute("pagenum")!=null){
	pagenum=(Integer)request.getAttribute("pagenum");
}
if(request.getParameter("pagenum")!=null){
	pagenum=Integer.parseInt(request.getParameter("pagenum"));
}
if(endpage>pageCount){endpage=pageCount;}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>qna</title>
<meta http-equiv="X-UA-Compatible"  content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="/academy_ignis/css/jquery-confirm.min.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link rel="stylesheet" href="/academy_ignis/css/common.css">
</head>
<body>
<%-- Header 시작 --%>
<%
	pageContext.include("../header/header.jsp");
%>
<%-- Header 종료 --%>
<%-- Body 시작 --%>
<div class="wrapper">
	<div class="container">
		 <%pageContext.include("leftList.jsp"); %>
		 <div class="col-xs-12 col-sm-9 col-md-10 ">
		<h3>Q&A</h3><hr>
		 <table class="table table-responsive">
		    <thead>
		      <tr>
		        <th>말머리</th>
		        <th>제목</th>
		        <th>작성자</th>
		        <th>등록일</th>
		       	<th>조회수</th>
		      </tr>
		    </thead>
		    <tbody>
		     <%List<ig_qna> list=null;
		    if(request.getAttribute("qnalist")!=null){
		    	list = (List)request.getAttribute("qnalist");
		    for(int i=0;i<list.size();i++){
		    	%>
		      <tr>
		        <td><%=list.get(i).getQb_mal() %></td>
				<td>
					<%
			        	if(list.get(i).getQb_num()!= list.get(i).getQb_groupnum()){
			        %>
			        &nbsp;&nbsp;&nbsp;▶
			        <%}%>
			        <a href="qnaDetail?qb_num=<%=list.get(i).getQb_num()%>&pagenum=<%=pagenum%>">
			        	<%=list.get(i).getQb_title() %>
			        </a>
			        <%if(list.get(i).getQb_private()==1) {%>&nbsp;
			        <span class="glyphicon glyphicon-lock"></span><%} %>
		        </td>
		        <td><%=list.get(i).getM_id()%></td>
		        <td><%=list.get(i).getQb_regdate()%></td>
		        <td><%=list.get(i).getQb_readcount()%></td>
		      </tr>
		      <%}
		    } %>
		    </tbody>
		  </table>
		  <ul class="pager">
		  <%if(pagenum==1){%>
		    <li><a>첫 페이지</a></li>
			  <li><a>◁</a></li>
		 <% }else{ %>
		   <li><a href="qna?pagenum=1">첫 페이지</a></li>
		  <li><a href="qna?pagenum=<%=pagenum-1%>">◁</a></li>
		  <%} %>
		 <%for(int pagelist=startpage ; pagelist<=endpage ; pagelist++){ %>
		 <% if(pagelist==pagenum){%>
		 <li class="active"><a><%=pagelist %></a></li>
		 <%}else{ %>
		  <li><a href="qna?pagenum=<%=pagelist%>"><%=pagelist %></a></li>
		  <%}} %>
		  <%if(pagenum==pageCount){ %>
		  <li><a>▷</a></li>
		  <li><a>마지막 페이지</a></li>
		  <%}else{ %>
		  <li><a href="qna?pagenum=<%=pagenum+1%>">▷</a></li>
		  <li><a href="qna?pagenum=<%=pageCount%>">마지막 페이지</a></li>
		  <%} %>
		</ul>
		    <%if(session.getAttribute("m_level")==null||!session.getAttribute("m_level").toString().equals("3")) {%>  
		 <a href="qnaInsertView"><button type="button" class="btn btn-success" >문의하기</button></a>
		 <%} %>
		 </div>
		 </div>
</div>
<%-- Body 종료 --%>
<%-- Footer 시작 --%>
<%@include file="../footer/footer.jsp" %>
<%-- Footer 종료 --%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" charset="utf-8" src="/academy_ignis/script/jquery-confirm.min.js"></script>
<script type="text/javascript" charset="utf-8" src="/academy_ignis/script/index_login.js?v=2"></script>
<%
	if (id != null) {
%>		<script type="text/javascript">userLogin();</script>
<% 	} else { %>
		<script type="text/javascript">userLogout();</script>
<%  } %>
</body>
</html>