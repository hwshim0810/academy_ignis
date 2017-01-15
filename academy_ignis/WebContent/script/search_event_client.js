$(function() {
    $("input[name=searchEvent]").keypress(function(key) {
    	 
        if (key.keyCode == 13) {
        	key.preventDefault();
	        $("#searchBtn").click();
	    }
	});
	
	$("#searchBtn").click(function(event) {
		
		$.ajax({
			type : "post",
 			url : "/academy_ignis/community/search_event.jsp",
		  	data : {type : $("#eventSearch").val(), content : $("#searchEvent").val(), page : 1},
			success : function(data) { 
				var res = data.trim();
				$('#ContentArea').html(res); },
			error: function (request, status, error) {
				    alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
				 }
		});
	});
});