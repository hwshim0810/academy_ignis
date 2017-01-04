$(function() {
	$("#login").bind('click', function() {
		confirmLogout();
		return false;
	});
});

function userLogin() {
	$("#login").html('<a href="#">Logout</a>');
	$("#mypage").html('<a href="#">My page</a>');
}

function userLogout() {
	$("#login").html('<a href="/academy_ignis/login">Login</a>');
	$("#mypage").html('<a href="/academy_ignis/memberJoin">MemberJoin</a>');
}

function confirmLogout() {
	$.confirm({
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