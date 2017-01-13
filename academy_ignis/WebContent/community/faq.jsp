<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.List" %>
<%@ page import = "java.util.Iterator" %>
<%@ page import = "ignis.biz.EventBiz" %>
<%@ page import = "ignis.bean.ig_event" %>
<%@ page import = "ignis.dao.EventDAO" %>
<%
	String id = null;

	if (session.getAttribute("m_id") != null) 
		id = (String) session.getAttribute("m_id");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAQ</title>
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
		<%-- Body 영역 --%>
		<div class="col-xs-12 col-sm-9 col-md-10">
			<h3>FAQ</h3>
			<hr>
			<div class="panel-group" id="accordion">
				<%-- FAQ1 시작 --%>
			    <div class="panel panel-default">
			      <div class="panel-heading">
			        <h4 class="panel-title">
			          <a data-toggle="collapse" data-parent="#accordion" href="#collapse1">FAQ1:임신 중 치과치료를 받아도 되나요?</a>
			        </h4>
			      </div>
			      <div id="collapse1" class="panel-collapse collapse in">
			        <div class="panel-body">평균 임신 기간은 40~42주로<br>
1기(1~13주), 2기(14~27주), 3기(28~출산)로 나누어지게 됩니다.<br>
<br>
우선 급하지 않은 치과치료는 임신 1기 동안에는<br>
태아에게 피해가 있을 가능성이 있기 때문에 피하는것이 좋습니다.<br>
<br>
임신 2기는 가장 안정된 시기이므로 일시적인 치과치료를 할 수 있습니다.<br>
하지만 광범위한 보철물 제작이나 심한 외과적 시술은 분만 후로 연기하는것이 바람직합니다.<br>
<br>
임신3기의 초반부에는 일시적인 치료가 가능하지만<br>
중반이 지나면 긴급하지 않은 한 최대한 연기하여야 합니다.</div>
			      </div>
			    </div>
			    <%-- FAQ1 종료 --%>
			    <%-- FAQ2 시작 --%>
			    <div class="panel panel-default">
			      <div class="panel-heading">
			        <h4 class="panel-title">
			          <a data-toggle="collapse" data-parent="#accordion" href="#collapse2">FAQ2:금속 알러지가 있는데 금으로 떼워도 될까요?</a>
			        </h4>
			      </div>
			      <div id="collapse2" class="panel-collapse collapse">
			        <div class="panel-body">치과에서 사용되는 금은 의료용 합금이기 때문에<br>
<br>
일반 금과는 달리 인체 내에서 변색되거나 알러지가 생기지 않습니다.<br>
<br>
하지만 개개인의 신체적 특징에 따라 결과가 달라질 수 있으므로<br>
<br>
금 대신 레진으로 치료를 진행할 수도 있습니다</div>
			      </div>
			    </div>
			    <%-- FAQ2 종료 --%>
			    <%-- FAQ3 시작 --%>
			    <div class="panel panel-default">
			      <div class="panel-heading">
			        <h4 class="panel-title">
			          <a data-toggle="collapse" data-parent="#accordion" href="#collapse3">FAQ3:보철치료시 어떤 재료로 씌우는 것이 가장 좋나요?</a>
			        </h4>
			      </div>
			      <div id="collapse3" class="panel-collapse collapse">
			        <div class="panel-body">금은 인체에 무해하고 인체 친화성이 뛰어난 금속입니다<br>
<br>
따라서 구강 내에서 깨지거나 녹슬지 않고<br>
<br>
그 강도와 특성을 오랫동안 유지하기 때문에 <br>
<br>
가장 적합한 재료라고 할 수 있습니다<br>
<br>
<br>
이렇게 우수한 재로인 금은 사실 심미적인 부분은 떨어지기 위해<br>
<br>
치아와 가장 유사한 색상으로 만들어진 도자기 재료로도<br>
<br>
많이 사용하고 있습니다.</div>
			      </div>
			    </div>
			    <%-- FAQ3 종료 --%>
			    <%-- FAQ4 시작 --%>
			    <div class="panel panel-default">
			      <div class="panel-heading">
			        <h4 class="panel-title">
			          <a data-toggle="collapse" data-parent="#accordion" href="#collapse4">FAQ4:임플란트를 못하게 되는 경우도 있나요?</a>
			        </h4>
			      </div>
			      <div id="collapse4" class="panel-collapse collapse">
			        <div class="panel-body">임플란트 식립하기 위해서는 잇몸뼈의 역할이 매우 중요합니다.<br>
<br>
임플란트 시술을 하기 위해서는 잇몸뼈가 픽스쳐를 식립할 공간이 있어야 합니다.<br>
<br>
그러나 치아를 상실 한 후 오랫동안 방치하거나 틀니사용으로 인해 뼈가 많이 흡수된 경우<br>
<br>
잇몸뼈가 부족하여 임플란트를 못심는 경우가 발생할 수도 있습니다.<br>
<br>
잇몸뼈가 충분하지 않을 경우 뼈이식을 통해<br>
<br>
충분히 잇몸뼈를 생성한 후 임플란트 시술이 가능합니다.</div>
			      </div>
			    </div>
			    <%-- FAQ4 종료 --%>
			    <%-- FAQ5 시작 --%>
			    <div class="panel panel-default">
			      <div class="panel-heading">
			        <h4 class="panel-title">
			          <a data-toggle="collapse" data-parent="#accordion" href="#collapse5">FAQ5:사랑니가 나면 꼭 뽑아야 하나요??</a>
			        </h4>
			      </div>
			      <div id="collapse5" class="panel-collapse collapse">
			        <div class="panel-body">사랑니가 정상적으로 나고 또한 사랑니 구석구석을 깨끗이 관리해 줄 수 있다면<br>
<br>
굳이 뽑지 않아도 문제는 발생하지 않습니다.<br>
<br>
하지만 사랑니는 칫솔이 닿기가 어려운 곳에 나며 관리가 잘되지 않아<br>
<br>
충치가 생기고 잇몸에 염증이 발생되기 쉽습니다.<br>
<br>
이로 인해 통증 및 구취가 발생하게 되는데 이럴 경우에는 뽑아야 합니다.<br>
<br>
<br>
또한 사랑니가 누워서 날 경우 붙어있는 어금니를 자극하여 흡수가 일어나거나<br>
<br>
어금니 닿는 부분에 음식물이 껴서 염증이 발생될 수 있으며<br>
<br>
지속적인 염증은 치조골을 파괴시킬수 있어 방치할 경우 턱까지 염증이 전이 되는 등<br>
<br>
큰 문제가 발생할 수도 있습니다.<br>
<br>
따라서 일단 사랑니의 경우 치과의사화의 상담이 꼭 필요하며<br>
<br>
치과의사 지시에 따라 뽑거나 지속적인 관리가 필요합니다.</div>
			      </div>
			    </div>
			    <%-- FAQ5 종료 --%>
			    <%-- FAQ6 시작 --%>
			    <div class="panel panel-default">
			      <div class="panel-heading">
			        <h4 class="panel-title">
			          <a data-toggle="collapse" data-parent="#accordion" href="#collapse6">FAQ6:사랑니는 언제 나는 건가요?</a>
			        </h4>
			      </div>
			      <div id="collapse6" class="panel-collapse collapse">
			        <div class="panel-body">사랑니는 청소년부터 20대 중반 사이에 나는 치아입니다.<br>
사람마다 치아가 올라오는 시기는 약간씩 차이가 있습니다만<br>
사랑니는 위턱과 아래턱 좌우에 한개씩 총 4개가 나오게 됩니다.<br>
<br>
사람들 중에서는 사랑니가 아예 나지 않는 경우도 있으며.<br>
늦게 올라온다고 해서 문제될것도 없습니다.<br>
1개에서 4개까지 사랑니가 올라오는 치아의 개수도 다를 수 있다고 합니다.</div>
			      </div>
			    </div>
			    <%-- FAQ6 종료 --%>
			    <%-- FAQ7 시작 --%>
			    <div class="panel panel-default">
			      <div class="panel-heading">
			        <h4 class="panel-title">
			          <a data-toggle="collapse" data-parent="#accordion" href="#collapse7">FAQ7:스케일링을 하면 치아가 약해지나요?</a>
			        </h4>
			      </div>
			      <div id="collapse7" class="panel-collapse collapse">
			        <div class="panel-body">스케일링을 받으면 일시적으로 시린 증상이 있기 때문에 스케일링이 <br>
치아를 손상시킨다는 오해가 있는데요 이것은 잘못된 생각입니다.<br>
스케일링은 치아에 붙은 치석만 제거하고 치아에 손상을 주지 않습니다. <br>
치석이 제거되면서 빈공간이 생기고 치아면이 노출되면서 <br>
일시적으로 시린 느낌이 오기 때문입니다. <br>
시간이 지나면 정상적으로 돌아오기 때문에 걱정하지 않으셔도 됩니다. <br>
<br>
스케일링은 세균덩어리인 치석을 제거하여 염증을 가라앉게 하여 <br>
치주질환이나 잇몸병 예방에 좋은 치료입니다.</div>
			      </div>
			    </div>
			    <%-- FAQ7 종료 --%>
			    <%-- FAQ8 시작 --%>
			    <div class="panel panel-default">
			      <div class="panel-heading">
			        <h4 class="panel-title">
			          <a data-toggle="collapse" data-parent="#accordion" href="#collapse8">FAQ8:임플란트 수술 시간은 얼마나 되나요??</a>
			        </h4>
			      </div>
			      <div id="collapse8" class="panel-collapse collapse">
			        <div class="panel-body">임플란트 수술 시간은 몇개의 임플란트를 이식하는지에 따라 가장 차이가 큽니다만,<br>
<br>
수술시간은 대게 1시간 전후로 걸린다고 생각해 주시면 됩니다.<br>
<br>
실제 수술 자체에 소요되는 시간은 극히 짧은 편이니 부담은 크게 가지실 필요는 없습니다.</div>
			      </div>
			    </div>
			    <%-- FAQ8 종료 --%>
			    <%-- FAQ9 시작 --%>
			    <div class="panel panel-default">
			      <div class="panel-heading">
			        <h4 class="panel-title">
			          <a data-toggle="collapse" data-parent="#accordion" href="#collapse9">FAQ9:임플란트 식립 후 잇몸병은 어떻게 예방하나요???</a>
			        </h4>
			      </div>
			      <div id="collapse9" class="panel-collapse collapse">
			        <div class="panel-body">환자의 구강위생관리가 부실하여 인공치아 주위에 음식물 찌꺼기가 쌓이게 되면, <br>
<br>
자연치아와 마찬가지로 잇몸이 붓고 염증이 생겨<br>
<br>
인공치아 주위의 잇몸뼈가 파괴되므로 사용가능 기간이 줄어들게 욉니다.<br>
<br>
<br>
염증이 계속되고 심해지면<br>
<br>
임플란트 치아가 흔들리고 탈락하게 됩니다.<br>
<br>
음식물 끼임을 방지하고 오랫동안 사용하기 위해서는<br>
<br>
치료 후에도 철저한 위생 관리와 주의사항을 철저히 지켜주시고<br>
<br>
정기적으로 검진을 받는것이 중요합니다.</div>
			      </div>
			    </div>
			    <%-- FAQ9 종료 --%>
			    <%-- FAQ10 시작 --%>
			    <div class="panel panel-default">
			      <div class="panel-heading">
			        <h4 class="panel-title">
			          <a data-toggle="collapse" data-parent="#accordion" href="#collapse10">FAQ10:당뇨가 있는데 임플란트가 가능한가요?</a>
			        </h4>
			      </div>
			      <div id="collapse10" class="panel-collapse collapse">
			        <div class="panel-body">당뇨병이 오래 지속된 경우 혈관과 신경이 손상되고<br>
<br>
면역세포의 기능이 악화되어 세균 감염 기능이 증가하게 되며<br>
<br>
상처 치유력 및 지혈능력 저하등의 문제가 발생하기 때문에<br>
<br>
당뇨 환자들은 임플란트 수술 과정에서 보다 세심한 관찰이 필요하며<br>
<br>
세균처리가 완벽하게 된 곳에서 신속 정확하게 수술이 진행되어야 합니다.</div>
			      </div>
			    </div>
			    <%-- FAQ10 종료 --%>
			</div> 
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