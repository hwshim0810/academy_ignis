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
  int pagenum=1;//현재 페이지
  if(request.getAttribute("pagenum")!=null){
		pagenum=(Integer)request.getAttribute("pagenum");
	}
	if(request.getParameter("pagenum")!=null){
		pagenum=Integer.parseInt(request.getParameter("pagenum"));
	}
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>qnaUpdateView</title>
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
    <h4>qnaUpdateView</h4><hr>
     <table class="table">
    <tbody>
    <%List<ig_qna> list=null;
    if(request.getAttribute("qnaDetail")!=null){
    	list = (List)request.getAttribute("qnaDetail");
    	
    	if(list.get(0).getQb_private()==1){
    		if(!session.getAttribute("m_id").equals(request.getAttribute("replyOwenr").toString())){
    		if(!list.get(0).getM_id().equals(session.getAttribute("m_id")) 
    				&&!session.getAttribute("m_level").toString().equals("3")
    				){
    			out.println("<script>");
    			out.println("alert('비공개 문의는 본인만 보기 가능합니다..');");
    			out.println("location.href='/academy_ignis/qna';");
    			out.println("</script>");
    		}
    		}
    	}
    	%>
      <tr>
      <th>말머리</th>
        <td><%=list.get(0).getQb_mal() %></td>
        <th>작성자</th>
        <td><%=list.get(0).getM_id()%></td>
      </tr><tr>
        <th>등록일</th>
        <td><%=list.get(0).getQb_regdate() %></td>
        <th>조회수</th>
        <td><%=list.get(0).getQb_readcount() %></td>
      </tr>
    </tbody>
          </table>
<form alt="qnaUpdate" method="post" action="./qnaUpdate?pagenum=<%=pagenum %>&qb_num=<%=list.get(0).getQb_num()%>">
  <div class="form-group">
    <label for="qb_title">제목:</label>
    <input type="text" class="form-control" name="qb_title" value="<%=list.get(0).getQb_title() %>"/>
  </div>
  <div class="form-group">
    <label for="qb_content">내용:</label>
    <textarea class="form-control " name="qb_content"  rows="5"><%=list.get(0).getQb_content() %></textarea>
  </div>
  <div class="form-group">
    <label for="pwd">비밀번호:</label>
    <input type="password" class="form-control" name="password" />
  </div>
  <button type="submit" class="btn btn-primary">수정</button>
</form>

<h5></h5>
      <%
    } %>
      </div>
 </div>
</body>
</html>