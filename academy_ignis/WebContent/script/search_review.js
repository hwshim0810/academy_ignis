$(function() {
    $("input[name=searchReview]").keypress(function(key) {
    	 
        if (key.keyCode == 13) {
        	key.preventDefault();
	        $("#searchBtn").click();
	    }
	});
	
	$("#searchBtn").click(function(event) {
		
		$.ajax({
			type : "post",
 			url : "/academy_ignis/admin/search_review.jsp",
		  	data : {type : $("#reviewSearch").val(), content : $("#searchReview").val(), page : 1},
			success : function(data) { 
				var res = data.trim();
				$('#ContentArea').html(res); },
			error: function (request, status, error) {
				    alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
				 }
		});
	});
});