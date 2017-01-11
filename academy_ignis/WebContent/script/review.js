function moveLogin() {
	$.alert({
		buttons: {
			tryAgain: {
	            text: '확인',
	            btnClass: 'btn-yellow',
	            action: function(){
	            	location.href = "/academy_ignis/login?page=Review&login=member";
	            }
			}
		},
	    title: '로그인',
	    type: 'yellow',
	    content: '로그인 후 이용할수 있습니다.'
	});
	return false;
}