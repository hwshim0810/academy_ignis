$(function() {
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
  	
  	$("#backBtn").click(function() {
		if ( document.referrer && document.referrer.indexOf("/academy_ignis") != -1 ) { 
			history.back();
		}

		else { 
			location.href = "/academy_ignis/admin/ad_Manage.jsp";
		}
	});
  	
  	$("#delBtn").click(function() {
		$.confirm({
			type: 'red',
		    title: '회원삭제',
		    content: '회원정보를 모두 삭제하시겠습니까?',
		    buttons: {
		        삭제하기: {
		        	btnClass: 'btn-red',
		        	action : function () {
		        		var m_id = $("#m_id").val();
		        		
		        		$.post('/academy_ignis/admin/ad_delMem.jsp?page=admin', 'm_id=' + m_id, function(temp) {
		    				var result = temp.trim();
		    			
		        			if (result == 'OK') {
		        				console.log(result);
		    					$.alert({
		    						buttons: {
		    							tryAgain: {
		    					            text: '확인',
		    					            btnClass: 'btn-green',
		    					            action: function(){
		    					            	location.href='/academy_ignis/member';
		    					            }
		    							}
		    						},
		    					    title: '회원정보삭제',
		    					    type: 'green',
		    					    content: '회원정보가 삭제되었습니다.'
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
		    					    content: '삭제과정에 문제가 있었습니다.'
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