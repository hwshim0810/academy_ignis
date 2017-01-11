$(function() {
	$("#outBtn").click(function() {
		$.confirm({
					type: 'red',
				    title: '탈퇴확인',
				    content: '주의사항을 모두 읽어보셨습니까?',
				    buttons: {
				        탈퇴: {
				        	btnClass: 'btn-red',
				        	action : function () {
				        		$("#outForm").submit();
				        	}
				        },
				        취소: function () {
				        }
				    }
				});
	});
})