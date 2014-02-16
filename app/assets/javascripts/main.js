var listOpportunities = function(results) {
	$('#results').html('');
	for(var i=0; i < results.length; i++) {
		$('#results').append(
			"<h3>" + results[i].project_title + "</h3>" +
			results[i].fy + "   " + "quarter: " + results[i].quarter
		);
	}
};

$(document).ready(function(){
	$('#fitler-form-submit').click(function(e) {
		e.preventDefault();

		var data = {
			countries: $("#country option:selected").text()
		};

		$.ajax({
			url: '/list',
			data: data,
			dataType: 'json',
			type: 'GET',
			success: function(data){
				console.log(data);
				listOpportunities(data);
			}
		});
		return false;
	});
});