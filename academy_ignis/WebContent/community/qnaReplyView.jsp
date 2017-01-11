<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="ignis.bean.ig_qna"%>
<%@ page import="java.util.*"%>
<%
	String id = null;

	if (session.getAttribute("m_id") == null) {
		out.println("<script>");
		out.println("alert('로그인후 이용해주시기 바랍니다.');");
		out.println("location.href='/academy_ignis/login?page=qnaRelyView';");
		out.println("</script>");
	} else {
		id = (String) session.getAttribute("m_id");
	}

	int pagenum = 1;//현재 페이지
	if (request.getAttribute("pagenum") != null) {
		pagenum = (Integer) request.getAttribute("pagenum");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>qnaReplyView</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/academy_ignis/css/common.css">
<style type="text/css">
textarea {
	resize: none;
}
</style>
</head>
<body>
<%-- Header 시작 --%>
<%
	pageContext.include("../header/header.jsp");
%>
<%-- Header 종료 --%>
<%-- Body 시작 --%>
<div class="container">
<%
	pageContext.include("leftList.jsp");
%>
	<div class="col-xs-12 col-sm-9 col-md-10 ">
		<h4>qnaReplyView</h4><hr>
		<form class="form-horizontal" alt="qnaReply" method="post"
			action="./qnaReply?pagenum=<%=pagenum%>">
			<table class="table">
				<tbody>
					<%
						List<ig_qna> list = null;
						if (request.getAttribute("qnaDetail") != null) {
							list = (List) request.getAttribute("qnaDetail");
					%>
					<tr>
						<th>말머리</th>
						<td colspan="2"><%=list.get(0).getQb_mal()%></td>
						<th>작성자</th>
						<td colspan="2"><%=list.get(0).getM_id()%></td>
					</tr>
					<tr>
						<th>제목</th>
						<td><%=list.get(0).getQb_title()%></td>
						<th>등록일</th>
						<td><%=list.get(0).getQb_regdate()%></td>
						<th>조회수</th>
						<td><%=list.get(0).getQb_readcount()%></td>
					</tr>
					<tr>
					</tr>
					<tr>
						<th>문의 내용</th>
						<td colspan="5">
							<div class="form-group">
								<h5><%=list.get(0).getQb_content()%></h5>
								<%
									}
								%>
							</div>
						</td>
					</tr>
				</tbody>
			</table>

			<table class="table">
				<tbody>
					<tr>
						<th>글쓴이</th>
						<td>
							<div class="form-group">
								<input type="text" value="<%=session.getAttribute("m_id")%>"
									readonly />
							</div>
						</td>
					</tr>

					<tr>
						<th>답변 제목</th>
						<td>
							<div class="form-group">
								<input type="text" name="qb_title" class="form-control"
									value="Re:<%=list.get(0).getQb_title()%>" />
							</div>
						</td>
					</tr>

					<tr>
						<th>답변 내용</th>
						<td>
							<div class="form-group">
								<textarea class="form-control " name="qb_content" rows="5"></textarea>
							</div>
						</td>
					</tr>
					<tr>
						<td colspan="2" style="text-align: center;">
							<div class="form-group">
								<div class="col-md-offset-2 col-md-10">
									<button type="submit" class="btn btn-primary">등록</button>
									<a href="javascript:history.go(-1)"><button type="button"
											class="btn btn-danger">취소</button></a>
								</div>
							</div>
						</td>
					</tr>
				</tbody>
			</table>
			<input type="hidden" name="qb_private"
				value="<%=list.get(0).getQb_private()%>" /> <input type="hidden"
				name="qb_groupnum" value="<%=list.get(0).getQb_num()%>" /> <input
				type="hidden" name="qb_mal" value="<%=list.get(0).getQb_mal()%>" />
			<input type="hidden" name="qb_num"
				value="<%=list.get(0).getQb_num()%>" />
		</form>
	</div>
</div>
<%-- Body 종료 --%>
<%-- Footer 시작 --%>
<%@include file="../footer/footer.jsp"%>
<%-- Footer 종료 --%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" charset="utf-8"
	src="/academy_ignis/script/jquery-confirm.min.js"></script>
<script type="text/javascript" charset="utf-8"
	src="/academy_ignis/script/index_login.js?v=2"></script>
<%
if (id != null) {
%>
<script type="text/javascript">userLogin();</script>
<% 	} else { %>
<script type="text/javascript">userLogout();</script>
<%  } %>
</body>
</html>