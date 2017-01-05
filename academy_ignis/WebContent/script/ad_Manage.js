$(function () {
  	$("#logout").bind('click', function() {
		confirmLogout();
		return false;
	});
	
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
  	
  });

function confirmLogout() {
	$.confirm({
		theme: 'supervan',
		title: '로그아웃',
	    content: '로그아웃 하시겠습니까?',
	    buttons: {
	    	네: {
	            text: '네',
	            btnClass: 'btn-primary',
	            keys: ['enter'],
	            action: function(){
	            	location.href='/academy_ignis/logout';
	            }
	        },
	        
	        아니요: function () {
	           
	        }
	    }
	});
}