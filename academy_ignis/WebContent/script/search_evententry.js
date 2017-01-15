$(function() {
    $("input[name=searchEventEntry]").keypress(function(key) {
    	 
        if (key.keyCode == 13) {
        	key.preventDefault();
	        $("#searchBtn").click();
	    }
	});
	
	$("#searchBtn").click(function(event) {
		
		$.ajax({
			type : "post",
 			url : "/academy_ignis/admin/search_evententry.jsp",
		  	data : {type : $("#eventEntrySearch").val(), content : $("#searchContent").val(), page : 1},
			success : function(data) { 
				var res = data.trim();
				$('#contentArea').html(res); },
			error: function (request, status, error) {
				    alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
				 }
		});
	});
});