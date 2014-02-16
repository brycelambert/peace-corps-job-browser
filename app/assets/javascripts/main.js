var countries = [
		{ id: '1', label: 'Albania' },
		{ id: '2', label: 'Armenia' },
		{ id: '3', label: 'Azerbaijan' },
		{ id: '4', label: 'Belize' },
		{ id: '5', label: 'Benin' },
		{ id: '6', label: 'Botswana' },
		{ id: '7', label: 'Burkina Faso' },
		{ id: '8', label: 'Cambodia' },
		{ id: '9', label: 'Cameroon' },
		{ id: '10', label: 'China' },
		{ id: '11', label: 'Colombia' },
		{ id: '12', label: 'Costa Rica' },
		{ id: '13', label: 'Dominican Republic' },
		{ id: '14', label: 'Eastern Caribbean' },
		{ id: '15', label: 'Ecuador' },
		{ id: '16', label: 'El Salvador' },
		{ id: '17', label: 'Ethiopia' },
		{ id: '18', label: 'Fiji' },
		{ id: '19', label: 'Georgia' },
		{ id: '20', label: 'Ghana' },
		{ id: '21', label: 'Guatemala' },
		{ id: '22', label: 'Guinea' },
		{ id: '23', label: 'Guyana' },
		{ id: '24', label: 'Indonesia' },
		{ id: '25', label: 'Jamaica' },
		{ id: '26', label: 'Kenya' },
		{ id: '27', label: 'Kosovo' },
		{ id: '28', label: 'Kyrgyz Republic' },
		{ id: '29', label: 'Lesotho' },
		{ id: '30', label: 'Liberia' },
		{ id: '31', label: 'Macedonia' },
		{ id: '32', label: 'Madagascar' },
		{ id: '33', label: 'Malawi' },
		{ id: '34', label: 'Mexico' },
		{ id: '35', label: 'Micronesia & Palau' },
		{ id: '36', label: 'Moldova' },
		{ id: '37', label: 'Mongolia' },
		{ id: '38', label: 'Morocco' },
		{ id: '39', label: 'Mozambique' },
		{ id: '40', label: 'Namibia' },
		{ id: '41', label: 'Nepal' },
		{ id: '42', label: 'Nicaragua' },
		{ id: '43', label: 'Panama' },
		{ id: '44', label: 'Paraguay' },
		{ id: '45', label: 'Peru' },
		{ id: '46', label: 'Philippines' },
		{ id: '47', label: 'Rwanda' },
		{ id: '48', label: 'Samoa' },
		{ id: '49', label: 'Senegal' },
		{ id: '50', label: 'Sierra Leone' },
		{ id: '51', label: 'South Africa' },
		{ id: '52', label: 'Swaziland' },
		{ id: '53', label: 'Tanzania' },
		{ id: '54', label: 'Thailand' },
		{ id: '55', label: 'The Gambia' },
		{ id: '56', label: 'Togo' },
		{ id: '57', label: 'Tonga' },
		{ id: '58', label: 'Uganda' },
		{ id: '59', label: 'Ukraine' },
		{ id: '60', label: 'Vanuatu' },
		{ id: '61', label: 'Zambia' }
];

var listOpportunities = function(results) {
	$('#results').html('');
	for(var i=0; i < results.length; i++) {
		$('#results').append(
			"<h3>" + results[i].project_title + "</h3>" +
			results[i].fy + "   " + "quarter: " + results[i].quarter
		);
	}
};

var readCheckboxes = function(field) {
	var ouputArrayForField = [];
	var selectorString = "#filter-form-" + field + " input:checked";
	$(selectorString).each(function() {
		ouputArrayForField.push($(this).val());
	});
	return ouputArrayForField;
};

var readCountries = function() {
	var countries = []
	$("#country-dropdown").dropdownCheckbox("checked").map(
		function(item) { countries.push(item.label) }
	);
	return countries;
};

var writeJobs = function(job) {
	return "<p class='label'>Project Title: </span>" +
					"<p class='job-info'>" + job.project_title +
					"<p class='label'>Country: </span>" +
					"<p class='job-info'>" + job.country +
					"<p class='label'>Country: </span>" +
					"<p class='job-info'>" + job.country +

};

$(document).ready(function(){

	$("#country-dropdown").dropdownCheckbox({
  	data: countries,
  	title: "Select Countries",
  	autosearch: true,
  	btnClass: "btn btn-default dropdown-toggle",
  	hideHeader: false

	});

	$('#fitler-form-submit').click(function(e) {
		e.preventDefault();
		var data = {
			countries: readCountries(),
			sectors: readCheckboxes('sector'),
			quarters: readCheckboxes('quarter')
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