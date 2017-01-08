<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="ignis.bean.ig_qna" %>
    <%@ page import="java.util.*" %>
        <%
    int pagenum=1;//현재 페이지
    pagenum=(Integer)request.getAttribute("pagenum");
    if(session.getAttribute("m_id") ==null){
		out.println("<script>");
		out.println("alert('로그인후 이용해주시기 바랍니다.');");
		out.println("location.href='/academy_ignis/login?page=qnaDetail&pagenum="+pagenum+"';");
		out.println("</script>");
    }
    	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>qnaDetail</title>
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
    <%List<ig_qna> list=null;
    if(request.getAttribute("qnaDetail")!=null){
    	list = (List)request.getAttribute("qnaDetail");
    	if(list.get(0).getQb_private()==1){
    		if(!list.get(0).getM_id().equals(session.getAttribute("m_id"))){
    			System.out.println(list.get(0).getM_id()+session.getAttribute("m_id"));
    			out.println("<script>");
    			out.println("alert('비공개 문의는 본인만 보기 가능합니다..');");
    			out.println("location.href='/academy_ignis/qna';");
    			out.println("</script>");
    		}
    	}
    	%>
      <tr>
      <th>말머리</th>
        <td><%=list.get(0).getQb_mal() %></td>
        <th>작성자</th>
        <td><%=list.get(0).getM_id()%></td>
      </tr><tr>
      <th>제목</th>
        <td><%=list.get(0).getQb_title() %></td>
        <th>등록일</th>
        <td><%=list.get(0).getQb_regdate() %></td>
        <th>조회수</th>
        <td><%=list.get(0).getQb_readcount() %></td>
      </tr>
    </tbody>
  </table>
<h5><%=list.get(0).getQb_content() %></h5>
      <%
    } %>
  <a href="qna?pagenum=<%=pagenum%>"><button type="button" class="btn btn-info" >목록</button></a>

  </div>
 </div>
</body>
</html>