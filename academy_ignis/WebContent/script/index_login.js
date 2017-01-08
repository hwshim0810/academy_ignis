
function userLogin() {
	$("#login").html('<a href="#" id="logout">Logout</a>');
	$("#mypage").html('<a href="/academy_ignis/myPage">My page</a>');
}

function userLogout() {
	$("#login").html('<a href="/academy_ignis/login">Login</a>');
	$("#mypage").html('<a href="/academy_ignis/memberJoin?page=home">MemberJoin</a>');
}

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

$(function() {
	$("#logout").bind('click', function() {
		confirmLogout();
		return false;
	});
});