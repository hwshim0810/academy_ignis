$(function() {
	$(".pageNum").click(function() {
		var type = $("#hidden_type").val().trim();
		var content = $("#hidden_content").val().trim();
		var page = event.target.getAttribute('id');
		
		$.post('/academy_ignis/admin/search_member.jsp', { type : type, content : content, page : page }, function(temp) {
			var result = temp.trim();
			$("#panel-body").html(result);
		});
	});
});