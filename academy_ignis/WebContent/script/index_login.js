
function userLogin() {
	$("#login").html('<a href="#" id="logout">Logout</a>');
	$("#mypage").html('<a class="dropdown-toggle" data-toggle="dropdown" href="#">My page<span class="caret"></span></a><ul class="dropdown-menu"><li><a href="/academy_ignis/reservDetail">예약정보 확인</a></li><li><a href="#"><a href="/academy_ignis/myPagePath">내정보 확인</a></li><li><a href="#"><a href="/academy_ignis/memOutpage">회원 탈퇴</a></li></ul>');
}

function userLogout() {
	$("#login").html('<a href="/academy_ignis/login">Login</a>');
	$("#mypage").html('<a href="/academy_ignis/memberJoin?page=home">MemberJoin</a>');
}

function confirmLogout() {
	$.confirm({
		theme: 'light',
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