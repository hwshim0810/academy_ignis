$(function() {
	$("#searchBtn").click(function(event) {
		
		$.ajax({
			type : "post",
 			url : "/academy_ignis/admin/search_member.jsp",
		  	data : {type : $("#searchType").val(), content : $("#searchContent").val(), page : 1},
			success : function(data) { 
				var res = data.trim();
				$('#tableArea').html(res); },
			error: function (request, status, error) {
				    alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
				 }
		});
	});
});