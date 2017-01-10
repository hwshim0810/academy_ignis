$(function() {
	$("#searchBtn").click(function(event) {
		var type = $("#searchType").val().trim();
		var content = $("#searchContent").val().trim();
		var page = 1;
		
		$.post("/academy_ignis/admin/search_member.jsp", {type : type, content : content, page : page} , function(data) {
			$('#tableArea').html(data);
		});
	});
	
	$(".pageNum").click(function() {
		var type = $("#hidden_type").val().trim();
		var content = $("#hidden_content").val().trim();
		var page = event.target.getAttribute('id');
		
		if (page == 'first')
			page = '1';
		console.log(type);
		console.log(content);
		console.log(page);
		$.ajax({
			type : "post",
 			url : "/academy_ignis/admin/search_member.jsp",
		  	data : {type : type, content : content, page : page},
			success : function(data) { $('#tableArea').html(data); },
			error : function error(){alert("error"); }
		});
	});
});