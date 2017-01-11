$(function() {
	$("#reservDelete").click(function() {
		$.confirm({
			type: 'red',
		    title: '예약 삭제',
		    content: '예약 정보를 모두 삭제하시겠습니까?',
		    buttons: {
		        삭제하기: {
		        	btnClass: 'btn-red',
		        	action : function () {
		        		var reservNum = $("#reservNum").val();
		        		
		        		$.post('/academy_ignis/reserv/reservAdminDelete.jsp?', 'reservNum=' + reservNum, function(temp) {
		    				var result = temp.trim();
		    			
		        			if (result == 'OK') {
		        				console.log(result);
		    					$.alert({
		    						buttons: {
		    							tryAgain: {
		    					            text: '확인',
		    					            btnClass: 'btn-green',
		    					            action: function(){
		    					            	location.href='/academy_ignis/manage_Reserv';
		    					            }
		    							}
		    						},
		    					    title: '예약정보삭제',
		    					    type: 'green',
		    					    content: '예약정보가 삭제되었습니다.'
		    					});
		    					return false;
		    				} else {
		    					$.alert({
		    						buttons: {
		    							tryAgain: {
		    					            text: '돌아가기',
		    					            btnClass: 'btn-yellow',
		    					            action: function(){
		    					            }
		    							}
		    						},
		    					    title: '삭제실패',
		    					    type: 'red',
		    					    content: '삭제과정에 문제 있습니다. 관리자에게 문의하세요'
		    					});
		    					return false;
		    				}
		        		});
		        	}
		        },
		        취소하기: function () {}
		    }
		});
  	});	
});