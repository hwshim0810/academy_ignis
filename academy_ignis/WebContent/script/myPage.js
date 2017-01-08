$(function() {
	$("#backBtn").click(function() {
		if ( document.referrer && document.referrer.indexOf("/academy_ignis") != -1 ) { 
			history.back();
		}

		else { 
			location.href = "/academy_ignis";
		}
	});
	
	$("#passChk").click(function() {
		var m_pass = $("#m_pass").val().trim();
		var m_id = $("#m_id").val().trim();
		
		$.post('/academy_ignis/member/passChk.jsp', { m_pass : m_pass, m_id : m_id }, function(temp) {
			var result = temp.trim();
			
			if (result == 'OK') {
				$.confirm({
					type: 'green',
				    title: '비밀번호 확인',
				    content: '확인되었습니다.',
				    buttons: {
				        확인: {
				        	btnClass: 'btn-green',
				        	action : function () {
				        	}
				        },
				    }
				});
				return false;
			} else {
				$.alert({
					buttons: {
						tryAgain: {
				            text: '돌아가기',
				            btnClass: 'btn-red',
				            action: function(){
				            }
						}
					},
					title: '사용불가',
				    type: 'red',
				    content: '이미 존재하는 아이디입니다.'
				});
				return false;
			}
		});
	});
	
});
