<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    if(session.getAttribute("m_id") ==null){
		out.println("<script>");
		out.println("alert('회원만 문의할수 있습니다.');");
		out.println("location.href='/academy_ignis/login?page=qnaInsertView';");
		out.println("</script>");
    }else{
    	
    }
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>qnaInsertView</title>
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
 
 <form class="form-horizontal" name="insertEvent" method="post" action="/academy_ignis/EventWrite">
<table class="table">
						
<tbody>
<tr>
<th>글쓴이</th>
<td>
<div class="form-group">
<input type="text" name="eb_writer"  class="form-control" value="이그니스 치과" readonly />
</div>
</td>
</tr>
<tr>
<th>제목</th>
<td>
<div class="form-group">
<input type="text" name="eb_title"  class="form-control" />
</div>
</td>
</tr>
<tr>
<th>이벤트 내용</th>
<td>
<div class="form-group">
<textarea class="form-control" name="eb_content"></textarea>
</div>
</td>
</tr>
<tr>
<td colspan="2" style="text-align : center;">
<div class="form-group">
<div class="col-md-offset-2 col-md-10">
<button type="submit" class="btn btn-primary">등록</button>
<button type="button" class="btn btn-danger"  onclick="document.location.href='/academy_ignis/Event'">취소</button>
</div>
 </div>
</td>
</tr>
</tbody>
</table>
</form>
  </div>
 </div>
</body>
</html>