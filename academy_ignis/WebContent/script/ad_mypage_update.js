$(function() {
	$('.navbar-toggle-sidebar').click(function () {
  		$('.navbar-nav').toggleClass('slide-in');
  		$('.side-body').toggleClass('body-slide-in');
  		$('#search').removeClass('in').addClass('collapse').slideUp(200);
  	});

  	$('#search-trigger').click(function () {
  		$('.navbar-nav').removeClass('slide-in');
  		$('.side-body').removeClass('body-slide-in');
  		$('.search-input').focus();
  	});
  	
  	$("#backBtn").click(function() {
		if ( document.referrer && document.referrer.indexOf("/academy_ignis") != -1 ) { 
			history.back();
		}

		else { 
			location.href = "/academy_ignis/admin/ad_Manage.jsp";
		}
	});
})