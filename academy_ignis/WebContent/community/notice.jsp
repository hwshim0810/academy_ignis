<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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