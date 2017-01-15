$(function() {
	$("#searchBtn").click(function(event) {
		var type = $("#reviewSearch").val().trim();
		var content = $("#searchReview").val().trim();
		var page = 1;
		
		$.post("/academy_ignis/admin/search_review.jsp", {type : type, content : content, page : page} , function(data) {
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
 			url : "/academy_ignis/admin/search_review.jsp",
		  	data : {type : type, content : content, page : page},
			success : function(data) { $('ContentArea').html(data); },
			error : function error(){alert("error"); }
		});
	});
});