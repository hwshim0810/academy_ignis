<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ignis.dao.MemberDAO" %>
<%@ page import="ignis.bean.User" %>
<%@ page import="java.util.List" %>
<% 
	String id = null;
	
	if (session.getAttribute("m_id") != null) 
		id = (String) session.getAttribute("m_id");
	else
		response.sendRedirect("./ad_Login.jsp");
	
	MemberDAO memDao = MemberDAO.getInstance();
	List<User> userList = memDao.getUserAll();

	// list.jsp?pageNo=1과 같은 형식으로 호출
	String tempNo = request.getParameter("pageNo");

	int pageNo = 1;
	try {
		pageNo = Integer.parseInt(tempNo);
	} catch (Exception e) {
		// null 이거나, 문자를 숫자로 바꾸려 해서 에러가 나거나 무조건 pageNo=1
	}

	final int ROW_PER_PAGE = 5; // 페이지당 레코드 출력 갯수
	int begin = (pageNo - 1) * ROW_PER_PAGE + 1;
	int end = pageNo * ROW_PER_PAGE;
	// 시작 페이지와 끝 페이지를 조건으로 리스트 가져오기
	int totalRows = dao.count(); // 전체 게시물 갯수
	int totalPages = (int) Math.ceil((double) totalRows / ROW_PER_PAGE);
	// 전체 페이지 갯수

	final int PAGE_PER_PAGE = 5; // 화면당 페이지 출력 갯수
	int totalRanges = (int) Math.ceil((double) totalPages
			/ PAGE_PER_PAGE); // 전체 Range 갯수
	int currentRange = (int) Math.ceil((double) pageNo / PAGE_PER_PAGE);
	//요청된 pageNo의 현재 range
	int beginPage = (currentRange - 1) * PAGE_PER_PAGE + 1; // 시작 페이지 번호
	int endPage = currentRange * PAGE_PER_PAGE; // 마지막 페이지 번호
	if (currentRange == totalRanges)
		endPage = totalPages; // currentRange가 맨 마지막 range인 경우

	int prevPage = 0;
	if (currentRange != 1)
		prevPage = (currentRange - 2) * PAGE_PER_PAGE + 1;
	int nextPage = 0;
	if (currentRange != totalRanges)
		nextPage = currentRange * PAGE_PER_PAGE + 1;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ignis치과 관리자페이지</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="/academy_ignis/css/ad_Manage.css">
</head>
<body>
<%
	pageContext.include("./manage_Header.jsp");
%>
  	<div class="container-fluid main-container">
<%
	pageContext.include("./manage_sideNav.jsp");
%>
  		<div class="col-md-10 content">
  			  <div class="panel panel-default">
				<div class="panel-heading">
					<h2 id="memTitle">전체 회원명단</h2>
				</div>
				<div class="panel-body">
				<table class="table">
					<thead>
					<tr><th>아이디</th><th>이름</th><th>생일</th><th>주소</th><th>휴대폰번호</th><th>Email</th><th>가입일</th></tr>
					</thead>
					<tbody>
					<% 
						if (userList != null) {
							for (int i = 0; i < userList.size(); i++) {
								User user = userList.get(i);
							}
						}
					%>
					</tbody>
					</table>
				</div>
			</div>
  		</div>
<%
	pageContext.include("./manage_Footer.jsp");
%>
  	</div>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
 <script src="/academy_ignis/script/ad_Manage.js"></script>
</body>
</html>