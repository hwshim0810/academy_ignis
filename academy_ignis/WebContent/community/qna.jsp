<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>qna</title>
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
<h4>궁굼한 점</h4><hr>
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
      <tr>
        <td>1</td>
        <td>2017년 구정 휴무</td>
        <td>2016/01/15</td>
        <td>2</td>
      </tr>
      <tr>
        <td>1</td>
        <td>2017년 구정 휴무</td>
        <td>2016/01/15</td>
        <td>2</td>
      </tr>
      <tr>
        <td>1</td>
        <td>2017년 구정 휴무</td>
        <td>2016/01/15</td>
        <td>2</td>
      </tr>
    </tbody>
  </table>
 </div>
 
 </div>
</body>
</html>