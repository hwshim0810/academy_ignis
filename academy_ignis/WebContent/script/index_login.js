function userLogin() {
	$("#login").html('<a href="/academy_ignis/logout">Logout</a>');
	$("#mypage").html('<a href="#">My page</a>');
}

function userLogout() {
	$("#login").html('<a href="/academy_ignis/login">Login</a>');
	$("#mypage").html('<a href="/academy_ignis/memberJoin">MemberJoin</a>');
}
