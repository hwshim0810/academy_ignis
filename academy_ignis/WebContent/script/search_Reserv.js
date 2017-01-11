	$(function() {
		$('#reservSubmit').click(function (event) {
			$.ajax({
				type : "post",
	 			url : "/academy_ignis/admin/search_Reserv.jsp",
			  	data : {searchType : $('#searchType').val(), searchContent : $('#searchContent').val(), page : 1},
				success : function(data) { $('#reservContent2').html(data); },
				error : function error(){alert("error"); }
			});
			return false;
		});
	});