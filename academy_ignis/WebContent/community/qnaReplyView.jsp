<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ignis.bean.ig_qna" %>
<%@ page import="java.util.*" %>
  <%
    if(session.getAttribute("m_id") ==null){
		out.println("<script>");
		out.println("alert('로그인후 이용해주시기 바랍니다.');");
		out.println("location.href='/academy_ignis/login?page=qnaRelyView';");
		out.println("</script>");
    }
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>qnaReplyView</title>
<meta http-equiv="X-UA-Compatible"  content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <style type="text/css">
  textarea{resize: none;}
  </style>
</head>
<body>

<%pageContext.include("header_noTop.jsp"); %>
<%pageContext.include("../header/header.jsp"); %>
 <div class="container">
 <%pageContext.include("leftList.jsp"); %>
  <div class="col-xs-12 col-sm-9 col-md-10 ">
    <h4>qnaReplyView</h4><hr>
  <form class="form-horizontal" alt="insertEvent" method="post" action="./qnaReply">
  <table class="table">
    <tbody>
 <%  List<ig_qna> list=null;
    if(request.getAttribute("qnaDetail")!=null){
    	list = (List)request.getAttribute("qnaDetail");
    	%>
    	 <tr >
      <th>말머리</th>
        <td colspan="2" ><%=list.get(0).getQb_mal() %></td>
        <th>작성자</th>
        <td colspan="2" ><%=list.get(0).getM_id()%></td>
      </tr><tr>
      <th>제목</th>
        <td><%=list.get(0).getQb_title() %></td>
        <th>등록일</th>
        <td><%=list.get(0).getQb_regdate() %></td>
        <th>조회수</th>
        <td><%=list.get(0).getQb_readcount() %></td>
      </tr>
      <tr>
      </tr>
 
  
 
<tr>
<th>문의 내용</th>
<td colspan="5" >
<div class="form-group">
<h5><%=list.get(0).getQb_content() %></h5>
      <%}
    %>
</div>
</td>
</tr></tbody>
</table>

<table class="table">
<tbody>
<tr>
<th>글쓴이</th>
<td>
<div class="form-group">
<input type="text" value="<%=session.getAttribute("m_id") %>" readonly />
</div>
</td>
</tr>

<tr>
<th>답변 제목</th>
<td>
<div class="form-group">
<input type="text" name="qb_title"  class="form-control"  value="Re:<%=list.get(0).getQb_title()%>"/>
</div>
</td>
</tr>

<tr>
<th>답변 내용</th>
<td>
<div class="form-group">
<textarea class="form-control " name="qb_content"></textarea>
</div>
</td>
</tr>
<tr>
<td colspan="2" style="text-align : center;">
<div class="form-group">
<div class="col-md-offset-2 col-md-10">
<button type="submit" class="btn btn-primary">등록</button>
<a href="javascript:history.go(-1)"><button type="button" class="btn btn-danger"  >취소</button></a>
</div></div></td></tr></tbody></table>
<input  type="hidden" name="qb_private"  value="<%=list.get(0).getQb_private()%>"/>
<input  type="hidden" name="qb_groupnum"  value="<%=list.get(0).getQb_num()%>"/>
<input  type="hidden" name="qb_mal"  value="<%=list.get(0).getQb_mal()%>"/>

</form>
  </div>
  </div>
</body>
</html>