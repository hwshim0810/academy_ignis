function userLogin() {
	$("#login").html('<a href="#" id="logout">Logout</a>');
	$("#mypage").html('<a href="/academy_ignis/myPage">My page</a>');
}

function userLogout() {
	$("#login").html('<a href="/academy_ignis/login">Login</a>');
	$("#mypage").html('<a href="/academy_ignis/memberJoin?page=home">MemberJoin</a>');
}

$(function() {
    $('input[name="m_birth"]').daterangepicker({
        singleDatePicker: true,
        showDropdowns: true
    });
	
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
	
	$('.button-checkbox').each(function(){
		var $widget = $(this),
			$button = $widget.find('button'),
			$checkbox = $widget.find('input:checkbox'),
			color = $button.data('color'),
			settings = {
					on: {
						icon: 'glyphicon glyphicon-check'
					},
					off: {
						icon: 'glyphicon glyphicon-unchecked'
					}
			};

		$button.on('click', function () {
			$checkbox.prop('checked', !$checkbox.is(':checked'));
			$checkbox.triggerHandler('change');
			updateDisplay();
		});

		$checkbox.on('change', function () {
			updateDisplay();
		});

		function updateDisplay() {
			var isChecked = $checkbox.is(':checked');
			// Set the button's state
			$button.data('state', (isChecked) ? "on" : "off");

			// Set the button's icon
			$button.find('.state-icon')
				.removeClass()
				.addClass('state-icon ' + settings[$button.data('state')].icon);

			// Update the button's color
			if (isChecked) {
				$button
					.removeClass('btn-default')
					.addClass('btn-' + color + ' active');
			}
			else
			{
				$button
					.removeClass('btn-' + color + ' active')
					.addClass('btn-default');
			}
		}
		function init() {
			updateDisplay();
			// Inject the icon if applicable
			if ($button.find('.state-icon').length == 0) {
				$button.prepend('<i class="state-icon ' + settings[$button.data('state')].icon + '"></i> ');
			}
		}
		init();
	});
	
});
