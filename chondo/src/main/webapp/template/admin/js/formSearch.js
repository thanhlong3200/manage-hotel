$(document).ready(function() {


	var today = new Date();
	var tomorrow = new Date();
	tomorrow.setDate(today.getDate() + 1);
	$("#dateFrom").datepicker('setStartDate', today);
	$("#dateTo").datepicker('setStartDate', tomorrow);
	$("#dateTo").datepicker({
		startDate: tomorrow,
		format: 'dd/mm/yyyy'
	}).on("changeDate", function(e) {
		var currentDate = $("#dateTo").datepicker("getDate",  "-1d");
		currentDate.setDate(currentDate.getDate() - 1);
		$("#dateFrom").datepicker('setEndDate', currentDate);
	});
	$("#dateFrom").datepicker({
		startDate: '0',
		format: 'dd/mm/yyyy'
	}).on("changeDate", function(e) {
		var currentDate = $("#dateFrom").datepicker("getDate", "+1d");
		currentDate.setDate(currentDate.getDate() + 1);
		$("#dateTo").datepicker('setStartDate', currentDate);
	});
})