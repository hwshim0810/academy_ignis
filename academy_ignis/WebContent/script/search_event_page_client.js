$(function() {
	$("#searchBtn").click(function(event) {
		var type = $("#eventSearch").val().trim();
		var content = $("#searchEvent").val().trim();
		var page = 1;
		
		$.post("/academy_ignis/community/search_event.jsp", {type : type, content : content, page : page} , function(data) {
			$('#ContentArea').html(data);
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
 			url : "/academy_ignis/community/search_event.jsp",
		  	data : {type : type, content : content, page : page},
			success : function(data) { $('ContentArea').html(data); },
			error : function error(){alert("error"); }
		});
	});
});