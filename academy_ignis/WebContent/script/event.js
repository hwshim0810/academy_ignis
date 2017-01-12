$(function() {
	$('input[name="eb_period"]').daterangepicker();
	
	 $('input[name="eb_announceday"]').daterangepicker({
	        singleDatePicker: true,
	        showDropdowns: true
	  });
})