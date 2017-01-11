<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    if(session.getAttribute("m_id") ==null){
		out.println("<script>");
		out.println("alert('로그인후 이용해주시기 바랍니다.');");
		out.println("location.href='/academy_ignis/login?page=qnaInsertView';");
		out.println("</script>");
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
<style type="text/css">
  textarea{resize: none;}
  </style>
</head>
<body>
<%pageContext.include("../header/header.jsp"); %>
 <div class="container">
 <%pageContext.include("leftList.jsp"); %>
 <div class="col-xs-12 col-sm-9 col-md-10 ">
 
 <form class="form-horizontal" alt="insertEvent" method="post" action="./qnaInsert">
<table class="table">
						
<tbody>
<tr>
<th>말머리</th>
<td>
<div class="form-group">
  <select class="form-control"  name="qb_mal">
    <option value="치아교정">치아교정</option>
    <option value="임플란트">임플란트</option>
    <option value="치아미백">치아미백</option>
    <option value="일반진료">일반진료</option>
  </select>
</div>
</td>
</tr>
<tr>
<th>글쓴이</th>
<td>
<div class="form-group">
<input type="text" value="<%=session.getAttribute("m_id") %>" readonly />
</div>
</td>
</tr>
<tr>
<th>제목</th>
<td>
<div class="form-group">
<input type="text" name="qb_title"  class="form-control" />
</div>
</td>
</tr>
<tr>
<th>문의 내용</th>
<td>
<div class="form-group">
<textarea class="form-control" name="qb_content"></textarea>
</div>
</td>
</tr>
<tr>
<th>공개방식</th>
<td>
<div class="form-group">
  <select class="form-control"  name="qb_private">
    <option value="0">공개</option>
    <option value="1">비공개</option>
  </select>
</div>
</td>
</tr>
<tr>
<td colspan="2" style="text-align : center;">
<div class="form-group">
<div class="col-md-offset-2 col-md-10">
<button type="submit" class="btn btn-primary">등록</button>
<button type="button" class="btn btn-danger"  onclick="document.location.href='/academy_ignis/qna'">취소</button>
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