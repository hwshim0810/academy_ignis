$(function() {
	$("#idChk").click(function() {
		var m_id = $("#m_id").val();
		
		if (!m_id) {
			$.alert({
			    title: '빈아이디',
			    content: '아이디를 입력해 주십시오.',
			});
			$("#m_id").focus();
			return false;
		}
		
		$.post('/academy_ignis/member/idChk.jsp', 'm_id=' + m_id, function(result) {
			if (result == 'ok') {
				$.alert({
				    title: '사용가능',
				    content: '사용가능한 아이디입니다.',
				});
			} else {
				$.alert({
				    title: '사용불가',
				    content: '이미 존재하는 아이디입니다.',
				});
				console.log(result);
				$("#m_id").val("");
				$("#m_id").focus();
			}
		});

	});
});