$(function() {
	$("#searchBtn").click(function(event) {
		var type = $("#searchType").val().trim();
		var content = $("#searchContent").val().trim();
		var page = 1;
		
		$.ajax({
			type : "post",
 			url : "/academy_ignis/admin/search_member.jsp",
		  	data : {type : type, content : content, page : page},
			success : function(data) { $('#panel-body').html(data); },
		});
		
	});
});