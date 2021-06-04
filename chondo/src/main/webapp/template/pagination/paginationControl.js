$(function() {
	window.pagObj = $('#pagination').twbsPagination({
		totalPages: 10,
		visiblePages: 5,
		startPage: 5,
		onPageClick: function(event, page) {
			console.info(page + ' (from options)');
		}
	}).on('page', function(event, page) {
		console.info(page + ' (from event listening)');
	});
});